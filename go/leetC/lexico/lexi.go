package main

import(
	"fmt"
	"math/rand"
)

var inputarray []int8
var input int8
var outputarray []int8
var size int8

func genArray(size int8) ([]int8, err) {
//	rand.Seed(time.Now().UnixName())
	n := size
	arr := make([]int,n)
	for i := range arr {
		arr[i] = rand.Intn(99)
	}
	if err != nil{
		return nil, err
	}
	return arr, err
}

//func lexiorder( n int8 ) []int8 {
//return nil,
//}

func main(){
	// generate inputarray
	size = 15
	genArray (size )
	if err != nil {
		return err
	}

	//lexiorder (input){
	//	return, nil
	//}
	fmt.println (arr)
}
