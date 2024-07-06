package main
import "fmt"

func main () {
    var operator string
    fmt.Println("Enter Operator: +, -, *, /")
    fmt.Scan(&operator)

    var num1, num2 float64
    fmt.Println("Enter two numbers:")
    fmt.Scan(&num1, &num2)

    switch operator {
    case "+":
        fmt.Println(num1 + num2)
    case "-":
        fmt.Println(num1 - num2)
    case "*":
        fmt.Println(num1 * num2)
    case "/":
        fmt.Println(num1 / num2)
    default:
        fmt.Println("Invalid Operator")
    }
}
