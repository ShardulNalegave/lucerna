package ollama

import (
	"bytes"
	"encoding/json"
	"net/http"
	"os"

	"github.com/rs/zerolog/log"
)

type ChatMessage struct {
	Role string `json:"role"`
	Content string `json:"content"`
}

type ChatResponse struct {
	Model string `json:"model"`
	Message ChatMessage `json:"message"`
}

type Ollama struct {
	base string
	http *http.Client
}

func ConnectToOllama() *Ollama {
	baseURL := os.Getenv("LUCERNA_OLLAMA_URL")
	if baseURL == "" {
		log.Fatal().Msg("LUCERNA_OLLAMA_URL not provided")
	}
	
	return &Ollama{
		base: baseURL,
		http: http.DefaultClient,
	}
}

func (o *Ollama) Chat(payload any) (*ChatResponse, error) {
    payloadBytes, err := json.Marshal(payload)
    if err != nil {
        return nil, err
    }
    
    resp, err := http.Post(o.base + "/chat", "application/json", bytes.NewBuffer(payloadBytes))
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()
    
    var result ChatResponse
    if err := json.NewDecoder(resp.Body).Decode(&result); err != nil {
        return nil, err
    }
    
    return &result, nil
}