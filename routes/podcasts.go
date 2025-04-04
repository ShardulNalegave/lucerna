package routes

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"
	"os"

	"github.com/ShardulNalegave/lucerna/ollama"
	"github.com/ShardulNalegave/lucerna/utils"
	"github.com/gen2brain/go-fitz"
	"github.com/go-chi/chi/v5"
	"github.com/rs/zerolog/log"

	htmltomarkdown "github.com/JohannesKaufmann/html-to-markdown/v2"
)

func mountPodcastsRoutes(r *chi.Mux) {
	r.Post("/podcasts/generate", generatePodcast)
}

func generatePodcast(w http.ResponseWriter, r *http.Request) {
	remoteURL := os.Getenv("LUCERNA_TTS_SERVICE_URL")
	o := r.Context().Value(utils.OllamaKey).(*ollama.Ollama)

	err := r.ParseMultipartForm(10 << 20) // 10 MB max memory
	if err != nil {
		log.Error().Err(err).Msg("Error parsing form data")
		http.Error(w, "Error parsing form data", http.StatusBadRequest)
		return
	}

	file, header, err := r.FormFile("paper")
	if err != nil {
		log.Error().Err(err).Msg("Error retrieving the file")
		http.Error(w, "Error retrieving the file", http.StatusBadRequest)
		return
	}
	defer file.Close()

	doc, err := fitz.NewFromReader(file)
	if err != nil {
		http.Error(w, "Error parsing the file from MuPDF", http.StatusBadRequest)
		return
	}

	htmlContent := ""
	for i := 0; i < 1; i++ {
		content, _ := doc.HTML(i, true)
		htmlContent += content
	}

	htmlContent = "<div>" + htmlContent + "</div>"
	mdContent, _ := htmltomarkdown.ConvertString(htmlContent)

	log.Info().Msg("Generating transcript")

	ollamaMessages := make([]map[string]interface{}, 0)
	// ollamaMessages = append(ollamaMessages, map[string]interface{}{
	// 	"role": "user",
	// 	"content": "Generate podcast transcript for the following paper:-\n" + mdContent,
	// })

	ollamaMessages = append(ollamaMessages, map[string]interface{}{
		"role": "user",
		"content": mdContent + `
		Write a podcast for this research paper by obeying the following instructions:-

		You are Lucerna, who hosts a dedicated podcast named "Research Revealed" focused solely on research papers. Your role is to generate a complete, self-contained podcast transcript that explains a given research paper in an engaging and detailed manner, without any extraneous chatbot or conversational preamble.

		For each transcript, follow these instructions:
		1. Begin with a warm, concise introduction where you introduce yourself and briefly mention the title or subject of the paper.
		2. Deliver a thorough and easy-to-understand explanation of the paper’s content, covering every key detail without skipping important points.
		3. Conclude the transcript with a clear, thoughtful summary that wraps up the discussion and leaves the audience feeling enlightened.
		4. Your output should be formatted strictly as a podcast transcript—no extra phrases like “Okay, here is a brief breakdown…” or any meta commentary. Only the structured transcript should be returned.
		5. Do not add any placeholder text for things like ("Music plays here"), etc. Also don't add tags like "Lucerna: " in the transcript. Your response should just be plain text that the host should speak.
		`,
	})

	ollamaPayload := map[string]interface{}{
        // "model": "gemma3:4b",
		"model": "llama3.2:3b",
		"stream": false,
		"messages": ollamaMessages,
	}

	res, err := o.Chat(ollamaPayload)
	if err != nil {
		log.Error().Err(err).Msg("Could not get response from ollama")
	}

	fmt.Println(res.Message.Content)

	var body struct {
		Transcript string `json:"transcript"`
	}
	body.Transcript = res.Message.Content

	embeddingReq, _ := json.Marshal(body)
	resp, err := http.Post(fmt.Sprintf("%s/generate", remoteURL), "application/json", bytes.NewBuffer(embeddingReq))
	if err != nil {
		log.Error().Err(err).Msg("couldn't generate audio")
		http.Error(w, "couldn't generate audio", http.StatusInternalServerError)
		return
	}
	defer resp.Body.Close()

	w.WriteHeader(http.StatusOK)
	w.Write([]byte(header.Filename))
}