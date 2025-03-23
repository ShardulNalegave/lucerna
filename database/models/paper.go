package models

import "github.com/pgvector/pgvector-go"

type Paper struct {
	ID        uint64          `db:"id" json:"id"`
	Title     string          `db:"title" json:"title"`
	Abstract  string          `db:"abstract" json:"abstract"`
	DOI       string          `db:"doi" json:"doi"`
	Embedding pgvector.Vector `db:"embedding" json:"embedding"`
}
