package main

import (
	"net/http"
	"os"

	"github.com/ShardulNalegave/lucerna/database"
	"github.com/ShardulNalegave/lucerna/routes"
	"github.com/go-chi/chi/v5"
	"github.com/joho/godotenv"
	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
)

func main() {
	zerolog.TimeFieldFormat = zerolog.TimeFormatUnix
	log.Logger = log.Output(zerolog.ConsoleWriter{Out: os.Stdout})

	if err := godotenv.Load(); err != nil {
		log.Fatal().Err(err).Msg("Could not load .env")
	}

	db := database.ConnectToDatabase()

	r := chi.NewRouter()
	r.Use(database.DatabaseMiddleware(db))

	routes.MountRoutes(r)

	log.Info().Msg("Listening...")
	err := http.ListenAndServe(":8080", r)
	log.Fatal().Err(err).Msg("Shutting down...")
}
