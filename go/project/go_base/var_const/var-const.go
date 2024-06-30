package main

import "fmt"

const (
	BEIJING  = 0
	SHANGHAI = 1
	HANGZHOU = 2
)

// iota 常量计数器，从 0  开始依次递增
const (
	A = 5 * iota
	B
	C
)

func main() {
	const lenght = 10
	// lenght = 20  // 不可更改常量的值
	fmt.Println(lenght)
	// 10
	fmt.Println(BEIJING, SHANGHAI, HANGZHOU)
	// 0 1 2

	fmt.Println(A, B, C)
	// 0 5 10

}
