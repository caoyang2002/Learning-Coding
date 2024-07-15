package main
import "net/http"
func hello(w http.ResponseWriter, r *http.Request){
	w.Write([]byte("Hello\n"))
}
func main(){
	http.HandleFunc("/",hello)
	http.ListenAndServe(":8000",nil)
}
