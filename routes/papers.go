package routes

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"

	"github.com/ShardulNalegave/lucerna/database/models"
	"github.com/ShardulNalegave/lucerna/utils"
	"github.com/go-chi/chi/v5"
	"github.com/jmoiron/sqlx"
	"github.com/pgvector/pgvector-go"
	"github.com/rs/zerolog/log"
)

type crossRefPaperMetadataResponse struct {
	DOI      string   `json:"DOI"`
	Title    []string `json:"title"`
	Abstract string   `json:"abstract"`
}

func mountPapersRoutes(r *chi.Mux) {
	r.Post("/papers", registerNewPaper)
	r.Post("/papers/find", findPapers)
}

func registerNewPaper(w http.ResponseWriter, r *http.Request) {
	remoteURL := os.Getenv("LUCERNA_EMBEDDINGS_SERVICE_URL")
	if remoteURL == "" {
		log.Error().Msg("LUCERNA_EMBEDDINGS_SERVICE_URL not provided")
	}

	db := r.Context().Value(utils.DatabaseKey).(*sqlx.DB)

	var body struct {
		DOI      string `json:"doi"`
		Title    string `json:"title"`
		Abstract string `json:"abstract"`
	}

	if err := json.NewDecoder(r.Body).Decode(&body); err != nil {
		http.Error(w, "Invalid request body", http.StatusBadRequest)
		return
	}

	embeddingsBody := struct {
		Title    string `json:"title"`
		Abstract string `json:"abstract"`
	}{
		Title:    body.Title,
		Abstract: body.Abstract,
	}
	embeddingsReqData, err := json.Marshal(embeddingsBody)
	if err != nil {
		log.Error().Err(err).Msg("error marshalling embeddings request body")
		http.Error(w, "Error marshalling embeddings request body", http.StatusInternalServerError)
		return
	}

	resp, err := http.Post(fmt.Sprintf("%s/generate/proximity", remoteURL), "application/json", bytes.NewBuffer(embeddingsReqData))
	if err != nil {
		log.Error().Err(err).Msg("couldn't fetch embeddings")
		http.Error(w, "Could not fetch embeddings", http.StatusInternalServerError)
		return
	}
	defer resp.Body.Close()

	embeddingsResBody, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Error().Err(err).Msg("couldn't read embedding dta")
		http.Error(w, "Could not read embedding data", http.StatusInternalServerError)
		return
	}

	var embeddingRes struct {
		Dims      uint32    `json:"dims"`
		Embedding []float32 `json:"embedding"`
	}
	if err := json.Unmarshal(embeddingsResBody, &embeddingRes); err != nil {
		log.Error().Err(err).Msg("couldn't decode embedding data")
		http.Error(w, "Could not decode embedding data", http.StatusInternalServerError)
		return
	}

	var paper models.Paper
	paper.DOI = body.DOI
	paper.Title = body.Title
	paper.Abstract = body.Abstract
	paper.Embedding = pgvector.NewVector(embeddingRes.Embedding)

	query := `
		INSERT INTO papers(title, abstract, doi, embedding)
		VALUES ($1, $2, $3, $4)
		RETURNING id
	`
	row := db.QueryRow(query, paper.Title, paper.Abstract, paper.DOI, paper.Embedding)
	if err := row.Err(); err != nil {
		log.Error().Err(err).Msg("couldn't add paper to database")
		http.Error(w, "Could not add paper to database", http.StatusInternalServerError)
		return
	}

	var pID uint64
	if err := row.Scan(&pID); err != nil {
		log.Error().Err(err).Msg("couldn't read saved paper id")
		http.Error(w, "Could not read saved paper id", http.StatusInternalServerError)
		return
	}

	paper.ID = pID
	data, _ := json.Marshal(paper)
	w.WriteHeader(http.StatusOK)
	w.Write(data)
}

func findPapers(w http.ResponseWriter, r *http.Request) {
	remoteURL := os.Getenv("LUCERNA_EMBEDDINGS_SERVICE_URL")
	if remoteURL == "" {
		log.Error().Msg("LUCERNA_EMBEDDINGS_SERVICE_URL not provided")
	}

	db := r.Context().Value(utils.DatabaseKey).(*sqlx.DB)

	var body struct {
		Query string `json:"query"`
	}

	if err := json.NewDecoder(r.Body).Decode(&body); err != nil {
		http.Error(w, "Invalid request body", http.StatusBadRequest)
		return
	}

	embeddingReq, _ := json.Marshal(body)
	resp, err := http.Post(fmt.Sprintf("%s/generate/adhoc_query", remoteURL), "application/json", bytes.NewBuffer(embeddingReq))
	if err != nil {
		log.Error().Err(err).Msg("couldn't fetch embeddings")
		http.Error(w, "Could not fetch embeddings", http.StatusInternalServerError)
		return
	}
	defer resp.Body.Close()

	embeddingsResBody, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Error().Err(err).Msg("couldn't read embedding data")
		http.Error(w, "Could not read embedding data", http.StatusInternalServerError)
		return
	}

	var embeddingRes struct {
		Dims      uint32    `json:"dims"`
		Embedding []float32 `json:"embedding"`
	}
	if err := json.Unmarshal(embeddingsResBody, &embeddingRes); err != nil {
		log.Error().Err(err).Msg("couldn't decode embedding data")
		http.Error(w, "Could not decode embedding data", http.StatusInternalServerError)
		return
	}

	papers := make([]models.Paper, 0)
	query := `SELECT id, title, abstract, doi FROM papers ORDER BY embedding <=> $1 LIMIT 1`
	if err := db.Select(&papers, query, pgvector.NewVector(embeddingRes.Embedding)); err != nil {
		log.Error().Err(err).Msg("couldn't fetch papers")
		http.Error(w, "Couldn't fetch papers", http.StatusInternalServerError)
		return
	}

	data, err := json.Marshal(papers)
	if err != nil {
		log.Error().Err(err).Msg("json marshalling error")
		http.Error(w, "JSON Marshalling error", http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Write(data)
}
