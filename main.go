package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"sync"

	"github.com/go-redis/redis"
)

var mu sync.Mutex
var count int

type Requests struct {
	Hits  string `json:"hits"`
	Count string `json:"count"`
}

func main() {
	http.HandleFunc("/hits", handler)
	http.HandleFunc("/count", counter)
	log.Fatal(http.ListenAndServe("localhost:8000", nil))

	client := redis.NewClient(&redis.Options{
		Addr:     "localhost:6379",
		Password: "",
		DB:       0,
	})

	json, err := json.Marshal(Requests{Hits: "hits", Count: "count"})
	if err != nil {
		fmt.Println(err)
	}
	err = client.Set("NumberOfHits", json, 0).Err()
	if err != nil {
		fmt.Println(err)
	}
	val, err := client.Get("NumberOfHits").Result()
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(val)

}

// handler echoes the Path component of the requested URL.
func handler(w http.ResponseWriter, r *http.Request) {
	mu.Lock()
	count++
	mu.Unlock()
	fmt.Fprintf(w, "Hello")
}

// counter echoes the number of calls so far.
func counter(w http.ResponseWriter, r *http.Request) {
	mu.Lock()
	fmt.Fprintf(w, "Count %d\n", count)
	mu.Unlock()
}
