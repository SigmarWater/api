package main

import (
	"net/http"
	"github.com/gin-gonic/gin"
)

func Hello (c *gin.Context){
	c.JSON(http.StatusOK, gin.H{"text":"Hello World from Serer"})
}


func main(){
	r := gin.Default() 

	r.GET("/hello", Hello)

	if err := r.Run(":5051"); err != nil{
		return
	}
}