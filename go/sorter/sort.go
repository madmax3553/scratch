package main

import (
	"encoding/csv"
	"fmt"
	"os"
	"strconv"
)

type Record struct {
	firstCsv string
	secondCsv string
}

func main() {

	// Pull args

	if os.Args[2:] == nil {
		fmt.Println("Incorrect Args")
		return

		firstCsv := os.Args[1]
		secondCsv := os.Args[2]

		// Pull the easy one
		datset1, err := readCSV(firstCsv)
		if err != nil {
			fmt.Println("Error reading dataset1:", err)
			return
		}
		// Hard one
		dataset1, err := readCSV(secondCsv)
		if err != nil{
			fmt.Println("Error reading dataset2:", err)
			return
		}
	}
}
func readCSV(filepath string) ([]Record, error){
	file, err := os.Open(filepath)
	if err !=nil {
		return nil, err
	}
	defer file.Close()
	reader := csv.NewReader(file)
	records, err := reader.ReadAll()
	if err != nil {
		return nil, err
	}
	var result []Record
	for _, record := range records[1:] { // Skip header
		id, err := strconv.Atoi(record[0])
		if err != nil {
			return nil, err
		}
		result = append(result, Record{ID: id, Name: record[1]})
	}
	return result, nil
}
