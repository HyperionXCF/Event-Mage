package db

import (
	_ "github.com/go-sql-driver/mysql"
	"database/sql"
	"fmt"
	"os"
)

func CreateDatabase() error {
	// check if the env variable exists
	// dsn := os.Getenv("DB_ROOT_DSN")
	// if dsn == "" {
	// 	return fmt.Errorf("DB_ROOT_DSN environment variable is not set")
	// }

	// open db connection for executing create database query
	db, err := sql.Open("mysql", "root:yash@tcp(127.0.0.1:3306)/")
	if err != nil {
		return fmt.Errorf("error connecting to MySQL : %w", err)
	}
	defer db.Close()

	// check if connection to mysql works using ping 
	if err := db.Ping(); err != nil {
		return fmt.Errorf("could not reach mysql : %w", err)
	}

	// execute cmd 
	_, err = db.Exec("CREATE DATABASE IF NOT EXISTS eventdb")
	if err != nil {
		return fmt.Errorf("could not create database : %w", err)
	}

	// if all good 
	return nil
}

func Connect() (*sql.DB, error) {
	dsn := os.Getenv("DB_DSN")
	if dsn == "" {
		return nil, fmt.Errorf("DB_DSN environment variable is not set")
	}

	db, err := sql.Open("mysql", dsn)
	if err != nil {
		return nil, fmt.Errorf("could not open database : %w", err)
	}
	if err := db.Ping(); err != nil {
		return nil, fmt.Errorf("could not reach db : %w", err)
	}

	// if no errors 
	return db, nil
}