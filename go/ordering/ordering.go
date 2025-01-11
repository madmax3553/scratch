package main

import (
	//	"std.io"
	"encoding/csv"
	"fmt"
	"os"
	"strconv"
)

type Record struct {
	partNum string
	quantity int
}

type Reader struct {
	FieldsPerRecord int

}

func main() {

	var dataset int

	// Pull args

	if os.Args[2:] == nil {
		fmt.Println("Incorrect Args")
		return
	}
	firstCsv := os.Args[1]
	secondCsv := os.Args[2]

	// Pull the easy one
	dataset = 1
	dataset1, err := readCSV(firstCsv)
	if err != nil {
		fmt.Println("Error reading dataset1:", err)
		return
	}
	// Hard one
	dataset = 2
	dataset2, err := readCSV(secondCsv)

	if err != nil {
		fmt.Println("Error reading dataset2:", err)
		return
	}
}

func readCSV(filepath string) ([]Record, error) {
	file, err := os.Open(filepath)
	if err != nil {
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
