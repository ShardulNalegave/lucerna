package database

import (
	"os"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"github.com/rs/zerolog/log"
)

const databaseInit = `
CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS papers (
	id bigserial primary key,
	title text not null,
	abstract text not null,
	doi text not null,
	embedding vector(768)
);
`

func ConnectToDatabase() *sqlx.DB {
	dsn := os.Getenv("LUCERNA_POSTGRES_DSN")
	if dsn == "" {
		log.Fatal().Msg("LUCERNA_POSTGRES_DSN was not provided")
	}

	db := sqlx.MustConnect("postgres", dsn)
	if _, err := db.Exec(databaseInit); err != nil {
		log.Fatal().Err(err).Msg("Could not run initialization query on the database")
	}

	log.Info().Msg("Connected to PostgreSQL")
	return db
}
