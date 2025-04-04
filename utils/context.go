package utils

type contextKey struct {
	name string
}

var DatabaseKey = &contextKey{name: "Database"}
var OllamaKey = &contextKey{name: "Ollama"}