package routes

import "github.com/go-chi/chi/v5"

func MountRoutes(r *chi.Mux) {
	mountEmbeddingsRoutes(r)
	mountPapersRoutes(r)
	mountPodcastsRoutes(r)
}
