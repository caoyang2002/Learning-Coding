package main

import "fmt"

func emptyArray() {
	var arr [5]int // 声明时没有指定数组元素值，默认为 0
	fmt.Println(arr)
	// [0 0 0 0 0]
	arr[0] = 1
	arr[1] = 2
	arr[2] = 3
	arr[3] = 4
	arr[4] = 5
	fmt.Println(arr)
	// [1 2 3 4 5]
}

func arrayValue() {
	// 声明时对数组进行初始化
	var arr1 = [5]int{6, 7, 8, 9, 10}
	fmt.Println(arr1)
	// [6 7 8 9 10]

	// 短声明的方式
	arr2 := [5]int{3, 4, 5, 6, 7}
	fmt.Println(arr2)
	// [3 4 5 6 7]

	// 部分初始化
	arr3 := [5]int{5, 7}
	fmt.Println(arr3)
	// [5 7 0 0 0]

	// 初始化特定的元素
	arr4 := [5]int{1: 100, 4: 200}
	fmt.Println(arr4)
	// [0 100 0 0 200]

	// 使用... 让编译器计算长度
	arr5 := [...]int{1, 2, 4, 5, 6, 7, 8, 9, 0}
	fmt.Println(arr5)
	// [1 2 4 5 6 7 8 9 0]
}

func typeOfArray() {
	// 数组的长度是数组类型的一部分
	arr1 := [3]int{1, 2, 3}
	arr2 := [5]int{4, 5, 6, 7, 8}
	fmt.Printf("type of arr1 %T\n", arr1)
	fmt.Printf("type of arr2 %T\n", arr2)
	/*
		type of arr1 [3]int
		type of arr2 [5]int  // 他们不是同一个类型
	*/
}

// 创建多维数组
func mdarray() {
	arr := [3][2]string{{"1", "go"}, {"2", "rust"}, {"3", "cpp"}}
	fmt.Println(arr)
	// [[1 go   ] [2 rust   ] [3 cpp   ]]
}

func arrayLenth() {
	arr := [...]string{"go", "rust", "python"}
	fmt.Println("length of array is", len(arr))
	// length of array is 3
}

func forArray() {
	arr := [...]string{"go", "rust", "python"}
	for index, value := range arr {
		fmt.Printf("arr[%d] = %s\n", index, value)
	}
	/*
		arr[0] = go
		arr[1] = rust
		arr[2] = python
	*/
	// 使用 _ 表示不使用变量
	for _, value := range arr {
		fmt.Printf("value = %s\n", value)
	}
	/*
		value = go
		value = rust
		value = python
	*/
}

func arrByValue() {
	// go 语言中，数组是值类型，而不是引用类型（是副本，不是指针）
	arr := [...]string{"go", "rust", "python"}
	copy := arr
	copy[0] = "Google"
	fmt.Println(arr)
	// [go rust python]
	fmt.Println(copy)
	// [Google rust python]
}

func main() {
	emptyArray()
	arrayValue()
	typeOfArray()
	mdarray()
	arrayLenth()
	forArray()
	arrByValue()
}
