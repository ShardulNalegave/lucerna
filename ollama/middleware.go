package ollama

import (
	"context"
	"net/http"

	"github.com/ShardulNalegave/lucerna/utils"
)

func OllamaMiddleware(o *Ollama) func(http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			ctx := context.WithValue(r.Context(), utils.OllamaKey, o)
			r = r.WithContext(ctx)
			next.ServeHTTP(w, r)
		})
	}
}