package routes

import (
	"net/http"
	"net/http/httputil"
	"net/url"
	"os"

	"github.com/go-chi/chi/v5"
	"github.com/rs/zerolog/log"
)

func mountEmbeddingsRoutes(r *chi.Mux) {
	remoteURL := os.Getenv("LUCERNA_EMBEDDINGS_SERVICE_URL")
	if remoteURL == "" {
		log.Fatal().Msg("LUCERNA_EMBEDDINGS_SERVICE_URL not provided")
	}

	remote, err := url.Parse(remoteURL)
	if err != nil {
		log.Fatal().Msg("Could not resolve embeddings service url")
	}

	proxy := httputil.NewSingleHostReverseProxy(remote)
	originalDirector := proxy.Director
	proxy.Director = func(req *http.Request) {
		originalDirector(req)

		if req.URL.Path == "/embeddings/proximity" {
			req.URL.Path = "/generate/proximity"
		} else if req.URL.Path == "/embeddings/adhoc_query" {
			req.URL.Path = "/generate/adhoc_query"
		}
	}

	r.HandleFunc("/embeddings/proximity", func(w http.ResponseWriter, r *http.Request) {
		proxy.ServeHTTP(w, r)
	})

	r.HandleFunc("/embeddings/adhoc_query", func(w http.ResponseWriter, r *http.Request) {
		proxy.ServeHTTP(w, r)
	})
}
