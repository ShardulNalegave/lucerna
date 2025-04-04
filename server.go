package main

import (
	"net/http"
	"os"

	"github.com/ShardulNalegave/lucerna/database"
	"github.com/ShardulNalegave/lucerna/ollama"
	"github.com/ShardulNalegave/lucerna/routes"
	"github.com/go-chi/chi/v5"
	"github.com/go-chi/cors"
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
	o := ollama.ConnectToOllama()

	r := chi.NewRouter()
	r.Use(cors.AllowAll().Handler)

	r.Use(database.DatabaseMiddleware(db))
	r.Use(ollama.OllamaMiddleware(o))

	routes.MountRoutes(r)

	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello from Lucerna!"))
	})

	log.Info().Msg("Listening...")
	err := http.ListenAndServe("0.0.0.0:8080", r)
	log.Fatal().Err(err).Msg("Shutting down...")
}
