package main

import (
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello, Harolgyver 1.0!"))
	})
	http.ListenAndServe(":8080", nil)
}					
