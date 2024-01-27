// BASIC WEB SERVICE

// Author: Nitin Jilla

package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/gorilla/mux"
)

var port string = ":8000"

func main() {

	r := mux.NewRouter()

	srv := http.Server{
		Addr:    port,
		Handler: r,
	}

	r.HandleFunc("/", homePage)

	log.Printf("Webserver started at %s:%s.", os.Getenv("HOSTNAME"), srv.Addr[1:])

	err := srv.ListenAndServe()
	if err != nil {
		log.Println(err)
	}
}

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome!")
}
