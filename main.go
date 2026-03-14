package main

import (
	"fmt"
	"os"

	"github.com/HyperionXCF/EventMage/db"
)

func main() {
	// create database
	err := db.CreateDatabase()
	if err != nil {
		errorString := fmt.Errorf("error creating database : %w", err)
		fmt.Print(errorString)
		os.Exit(1)
	}
	fmt.Println("database creation successful")

	// run migrations
	
	// connect to database for queries 
}