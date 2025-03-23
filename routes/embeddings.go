package routes

import (
	"net/http"
	"net/http/httputil"
	"net/url"

	"github.com/go-chi/chi/v5"
	"github.com/rs/zerolog/log"
)

func mountEmbeddingsRoutes(r *chi.Mux) {
	remote, err := url.Parse("http://localhost:5000")
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
