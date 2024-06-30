https://learnku.com/docs/the-little-go-book/gc/3300

# 配置基础

http://golang.google.cn/dl/



# Hello World

初始化 go 程序

```bash
go mod init hello
```



创建  `main.go` 文件，写入 go 代码

```go
package main  // 声明 main 包

import "fmt" // 导入 fmt 包

func main() {  // 声明 main 主函数
	fmt.Println("hello world") # 打印字符串
}
```



运行

```bash
go run main.go
```



# 注释

```go
/*
多行注释
*/

// 单行注释

```



# 包名和目录名

`./book/book.go`

```go
package bookeee  // 包名和目录名可以不一致
```



# main包

一个 go 程序有且只有一个 main 包

```go
package main
func mian(){} 
```

main 函数只能声明在 main 包中



# import 导入

导入单个包：

```go
import fmt // 格式化输入输出的包
```

引入了包就必须使用，否则会报错



导入多个包：

```go
import(
	"fmt"
	"os"
)
```





# 变量与常量

## 变量 var

声明一个变量

```go
package main

import "fmt"

func main() {
	// 方法一
	var age int // 声明一个 int 变量，使用默认值
	fmt.Println("age = ", age)
	fmt.Printf("age's type is %T\n", age)
	/*
		ge =  0
		age's type is int
	*/

	// 方法二：声明一个 int 变量并初始化一个值
	var hight int = 100
	fmt.Printf("hight = %d, hight's type is %T\n", hight, hight)
	/*
		hight =  100, hight's type is int
	*/

	// 方法三：初始化的时候，去掉变量类型，GO 语言通过值自动匹配类型
	var eq = 100
	fmt.Printf("eq = %d, eq's type is %T\n", eq, eq)
	/*
	   eq = 100, eq's type is int
	*/
	var name = "张三"
	fmt.Printf("name = %s, name's type is %T\n", name, name)
	/*
		name = 张三, name's type is string
	*/

	// 方法四：短声明
	eye := 2
	fmt.Printf("eye = %d, eye's type is %T\n", eye, eye)
	/*
		fmt.Printf("name = %s, name's type is %T\n", name, name)
	*/
}
```

一次声明多个变量

```go
package main

import "fmt"

func main() {
	// 方法一
	var xx, yy int = 100, 200
	fmt.Println(xx, yy)
	// 100 200
	var aa, bb = 1, "string"
	fmt.Println(aa, bb)
	// 1 string
	var (
		num int = 100
		str     = "string"
	)
	fmt.Println(num, str)
	// 100 string
}
```



## 常量 const

固定的值

```go
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

```





# 关键字

```go
func // 函数

```



```go
func 函数名(参数列表) (返回值列表){ // 必须在一行
    执行体
}
```



```go
break // 使用 break 关键字可以终止循环并继续执行其余代码。

case // 这是 “switch” 构造的一种形式。我们在切换后指定一个变量。

chan- // chan” 关键字用于定义通道。在 “执行” 中，允许您同时运行并行代码。

const // 'const' 关键字用于为标量值引入名称，例如 2 或 3.14 等。

continue // 使用 “continue” 关键字可以返回到 “ for” 循环的开头。

default // 'default' 语句是可选的，但是您需要在 switch 语句中使用 case 或 default。如果大小写与控制表达式不匹配，则开关跳至默认值。

defer // 关键字 'defer' 用于推迟执行功能，直到周围的功能执行为止。

else // 如果条件为假，则将 'else' 关键字与 'if' 关键字一起使用以执行替代语句。

fallthrough // 在 switch 语句中的情况下使用此关键字。当我们使用此关键字时，将输入下一种情况。

for // “for” 关键字用于开始 for 循环。

func // 'func' 关键字用于声明一个函数。

go // go 关键字触发一个 goroutine，该例程由 golang 运行时管理。

goto // 'goto' 关键字可无条件跳转至带标签的语句。

if // 'if' 语句用于检查循环内的特定条件。

import // 'import' 关键字用于导入软件包。

interface // 'interface' 关键字用于指定方法集。方法集是一种类型的方法列表。

map // 'map' 关键字定义 map 类型。映射是键值对的无序集合。

package - 代码在包中分组为一个单元。 “package” 关键字用于定义一个。

range - 使用 “range” 关键字可以迭代列表项 (如 map 或 数组) 上的项。

return-Go 允许您将返回值用作变量，并且可以为此目的使用 'return' 关键字。

select-“select” 关键字使 goroutine 在同步通信操作期间等待。

struct-Struct 是字段的集合。我们可以在字段声明后使用'struct' 关键字。

switch-'switch' 语句用于启动循环并在块内使用 if-else 逻辑。

type - 我们可以使用 'type' 关键字来引入新的结构类型。

var-“var” 关键字用于创建 “ Go” 语言的变量。

```



# 数据类型

在静态类型的语言中，在创建一个变量或常量时必须要指定数据类型，否则无法为其分配内存

## 整型

### 有符号

- int8
- int16
- int32
- int64
- int

### 无符号

- uint8
- uint16
- uint32
- uint64
- uint

```go
package main

import (
	"fmt"
	"math"
	"unsafe"
)

// 有符号整型
func Integer() {
	var num8 int8 = 127
	var num16 int16 = 32767
	var num32 int32 = math.MaxInt32
	var num64 int64 = math.MaxInt64
	var num int = math.MaxInt
	fmt.Printf("num8 type = %T,num8 size = %d, num8 is %d\n", num8, unsafe.Sizeof(num8), num8)
	fmt.Printf("num16 type = %T,num16 size = %d, num16 is %d\n", num16, unsafe.Sizeof(num16), num16)
	fmt.Printf("num32 type = %T,num32 size = %d, num32 is %d\n", num32, unsafe.Sizeof(num32), num32)
	fmt.Printf("num64 type = %T,num64 size = %d, num64 is %d\n", num64, unsafe.Sizeof(num64), num64)
	fmt.Printf("num type = %T,num size = %d, num is %d\n", num, unsafe.Sizeof(num), num)
	/*
		num8 type = int8,num8 size = 1, num8 is 127
		num16 type = int16,num16 size = 2, num16 is 32767
		num32 type = int32,num32 size = 4, num32 is 2147483647
		num64 type = int64,num64 size = 8, num64 is 9223372036854775807
		num type = int,num size = 8, num is 9223372036854775807
	*/
}

func unsignedInteger() {

	var num8 uint8 = 127
	var num16 uint16 = 32767
	var num32 uint32 = math.MaxUint32
	var num64 uint64 = math.MaxUint64
	var num uint = math.MaxUint
	fmt.Printf("num8 type = %T,num8 size = %d, num8 is %d\n", num8, unsafe.Sizeof(num8), num8)
	fmt.Printf("num16 type = %T,num16 size = %d, num16 is %d\n", num16, unsafe.Sizeof(num16), num16)
	fmt.Printf("num32 type = %T,num32 size = %d, num32 is %d\n", num32, unsafe.Sizeof(num32), num32)
	fmt.Printf("num64 type = %T,num64 size = %d, num64 is %d\n", num64, unsafe.Sizeof(num64), num64)
	fmt.Printf("num type = %T,num size = %d, num is %d\n", num, unsafe.Sizeof(num), num)
	/*
		num8 type = uint8,num8 size = 1, num8 is 127
		num16 type = uint16,num16 size = 2, num16 is 32767
		num32 type = uint32,num32 size = 4, num32 is 4294967295
		num64 type = uint64,num64 size = 8, num64 is 18446744073709551615
		num type = uint,num size = 8, num is 18446744073709551615
	*/
}

func main() {
	// 一般使用 int 表示整型的宽度，在 32 位系统下就是 32 位， 在 64 位系统下就是 64 位
	Integer()
	fmt.Println("----------------------------------------------")
	unsignedInteger()

}

```



```go
func showFloat() {
	var num1 float32 = math.MaxFloat32
	var num2 float64 = math.MaxFloat64
	fmt.Printf("num1 type %T, num1 is %g\n", num1, num1)
	fmt.Printf("num2 type %T, num2 is %g\n", num2, num2)
	/*
		num1 type float32, num1 is 3.4028235e+38
		num2 type float64, num2 is 1.7976931348623157e+308
	*/
}

func main() {
	showFloat()
}
```



## 容器类型

### 数组

一个由固定长度的特定类型的元素序列

```go	
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
```



### 切片

切片是对数组的连续片段的引用，所以切片是一个引用类型













# 使用 Go 创建项目

要使用go module 首先要设置GO111MODULE=on，GO111MODULE 有三个值，off、on、auto。

auto 会根据当前目录下是否有 go.mod 文件来判断是否使用 modules 功能。

平时 `GO111MODULE = off`，在需要使用的时候再开启，避免在已有项目中意外引入 `go module`。
命令：

```bash
set GO111MODULE=on
go env // 查看 GO111MODULE 选项为 on 代表修改成功
```



```bash
# 初始化。先进入test项目下，然后执行此命令，项目根目录会出现一个 go.mod 文件
go mod init test 
# 检测依赖。tidy会检测该文件夹目录下所有引入的依赖，写入 go.mod 文件，写入后你会发现 go.mod 文件有所变动
go mod tidy 
# 下载依赖。我们需要将依赖下载至本地，而不是使用 go get
go mod download 
# 导入依赖。此命令会将刚才下载至 GOPATH 下的依赖转移至该项目根目录下的 vendor(自动新建) 文件夹下, 此时我们就可以使用这些依赖了
go mod vendor 
# 依赖更新：这里的更新不是指版本的更新，而是指引入新依赖，依赖更新请从检测依赖部分一直执行即可：
go mod tidy
go mod download
go mod vendor
```





```bash
go mod
```



## 熟悉Go Module

1. 使用 go module 管理依赖后会在项目根目录下生成两个文件 go.mod 和 go.sum。go.mod 中会记录当前项目的所依赖的包的信息。
2. 在需要使用时才开启GO111MODULE = on，平时GO111MODULE = off，避免在已有项目中意外引入 go module。
3. **go module 的目的是依赖管理，所以使用 go module 时你**可以舍弃 go get 命令(但是不是禁止使用, 如果要指定包的版本或更新包可使用go get，平时没有必要使用)
