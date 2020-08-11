package main
 
import (
    "fmt"
    "log"
    "net/http"
    "os"
)
 
const homepageEndPoint = "/"

func StartWebServer() {
    http.HandleFunc(homepageEndPoint, handleHomepage)
    // port is set through env variable
    port := os.Getenv("PORT")
    if len(port) == 0 {
        panic("Environment variable PORT is not set")
    }
    // log attempt to start web server
    log.Printf("Starting web server to listen on endpoints [%s] and port %s",
        homepageEndPoint, port)
    if err := http.ListenAndServe(":"+port, nil); err != nil {
        panic(err)
    }
}
// return message on bound webserver port 
func handleHomepage(w http.ResponseWriter, r *http.Request) {
    urlPath := r.URL.Path
    log.Printf("Web request received on url path %s", urlPath)
    msg := "Hello there"
    _, err := w.Write([]byte(msg))
    if err != nil {
        fmt.Printf("Failed to write response, err: %s", err)
    }
}
 
func main() {
    StartWebServer()
}
