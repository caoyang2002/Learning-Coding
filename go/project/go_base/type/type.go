// package main

// import (
// 	"fmt"
// 	"math"
// 	"unsafe"
// )

// // 有符号整型
// func Integer() {
// 	var num8 int8 = 127
// 	var num16 int16 = 32767
// 	var num32 int32 = math.MaxInt32
// 	var num64 int64 = math.MaxInt64
// 	var num int = math.MaxInt
// 	fmt.Printf("num8 type = %T,num8 size = %d, num8 is %d\n", num8, unsafe.Sizeof(num8), num8)
// 	fmt.Printf("num16 type = %T,num16 size = %d, num16 is %d\n", num16, unsafe.Sizeof(num16), num16)
// 	fmt.Printf("num32 type = %T,num32 size = %d, num32 is %d\n", num32, unsafe.Sizeof(num32), num32)
// 	fmt.Printf("num64 type = %T,num64 size = %d, num64 is %d\n", num64, unsafe.Sizeof(num64), num64)
// 	fmt.Printf("num type = %T,num size = %d, num is %d\n", num, unsafe.Sizeof(num), num)
// 	/*
// 		num8 type = int8,num8 size = 1, num8 is 127
// 		num16 type = int16,num16 size = 2, num16 is 32767
// 		num32 type = int32,num32 size = 4, num32 is 2147483647
// 		num64 type = int64,num64 size = 8, num64 is 9223372036854775807
// 		num type = int,num size = 8, num is 9223372036854775807
// 	*/
// }

// func unsignedInteger() {

// 	var num8 uint8 = 127
// 	var num16 uint16 = 32767
// 	var num32 uint32 = math.MaxUint32
// 	var num64 uint64 = math.MaxUint64
// 	var num uint = math.MaxUint
// 	fmt.Printf("num8 type = %T,num8 size = %d, num8 is %d\n", num8, unsafe.Sizeof(num8), num8)
// 	fmt.Printf("num16 type = %T,num16 size = %d, num16 is %d\n", num16, unsafe.Sizeof(num16), num16)
// 	fmt.Printf("num32 type = %T,num32 size = %d, num32 is %d\n", num32, unsafe.Sizeof(num32), num32)
// 	fmt.Printf("num64 type = %T,num64 size = %d, num64 is %d\n", num64, unsafe.Sizeof(num64), num64)
// 	fmt.Printf("num type = %T,num size = %d, num is %d\n", num, unsafe.Sizeof(num), num)
// 	/*
// 		num8 type = uint8,num8 size = 1, num8 is 127
// 		num16 type = uint16,num16 size = 2, num16 is 32767
// 		num32 type = uint32,num32 size = 4, num32 is 4294967295
// 		num64 type = uint64,num64 size = 8, num64 is 18446744073709551615
// 		num type = uint,num size = 8, num is 18446744073709551615
// 	*/
// }

// func showFloat() {
// 	var num1 float32 = math.MaxFloat32
// 	var num2 float64 = math.MaxFloat64
// 	fmt.Printf("num1 type %T, num1 is %g\n", num1, num1)
// 	fmt.Printf("num2 type %T, num2 is %g\n", num2, num2)
// 	/*
// 		num1 type float32, num1 is 3.4028235e+38
// 		num2 type float64, num2 is 1.7976931348623157e+308
// 	*/
// }

// func main() {
// 	// 一般使用 int 表示整型的宽度，在 32 位系统下就是 32 位， 在 64 位系统下就是 64 位
// 	Integer()
// 	fmt.Println("----------------------------------------------")
// 	unsignedInteger()
// 	fmt.Println("----------------------------------------------")
// 	showFloat()
// }
