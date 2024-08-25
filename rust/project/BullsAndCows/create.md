# cammand:

```bash
cargo new (project's name)  //创建一个新的 cargo 项目
cargo build                 //编译项目
cargo run                   //对项目进行编译，然后再运行
```

# 创建项目

在上一课中，我们了解了 Rust 的包管理器和构建工具 Cargo，包括一些基础指令：创建项目、编译和运行项目。现在，我们将正式学习如何使用 Cargo 来创建你的第一个 Rust 项目 - Bulls and Cows。
💡
确保你已经按照上一课的指引安装了 Rust 和 Cargo，它们是你在接下来的 Rust 项目实战中不可或缺的工具。

## 具体步骤

1. 打开我们的命令行工具

这是开始任何 Rust 项目的第一步。无论你是 Windows、Linux 还是 macOS 用户，找到并打开你的命令行工具。

2. 输入创建项目指令

在你的终端中输入以下命令来创建一个新的 Rust 项目 - Bulls and Cows：

```rust
cargo new bulls_and_cows
```

在 Rust 中，项目名通常使用小写字母，并用下划线代替空格来保持一致性和兼容性。因此，描述性名称 Bulls and Cows 在实际创建时会转换为 bulls_and_cows。

3. 进入项目目录

创建项目后，使用以下命令进入项目目录：

```rust
cd bulls_and_cows
```

## 目录结构

创建完项目 Bulls and Cows 后，我们进入 bulls_and_cows 文件夹， 可以看到 Cargo 自动生成的文件和目录：

```bash
$ tree
.
├── .git
├── .gitignore
├── Cargo.toml
└── src
    └── main.rs
```

# 引入依赖

依赖

在上一课中，我们已经学习了如何使用 Cargo 创建一个新的 Rust 项目。你现在有了一个空白的新项目，但在我们开始编写代码之前，让我们先来了解一下如何为你的项目添加 - 依赖。

什么是依赖？

在软件开发中，依赖就像是你的工具箱中的工具和材料。它们是由其他开发者编写的可重用代码库，可以为你的项目增添特定的功能或性能，让你不必从头开始编写重复代码。依赖使得开发更快、更高效，并能让你专注于项目的最核心功能。

管理依赖：Cargo.toml

我们可以回顾下上一课新创建项目的文件目录：

```rust
├── .git
├── .gitignore
├── Cargo.toml
└── src
    └── main.rs
```

其中根目录有一个文件：`Cargo.toml`，它包含项目信息和依赖的配置信息。

```toml
[package]
name = "bulls_and_cows"
version = "0.1.0"
edition = "2021"

[dependencies]
```

1. [package]：记录着项目的元信息。name 项目名称，version 项目版本号，edition rust 语言版本

2. [dependencies]：是项目依赖的列表，指明了你的项目需要哪些外部库及其版本。

让我们为自己的项目 bulls_and_cows 引入名为 rand 的库，并指定使用 0.8 版本。

```rust
rand="0.8"
```

## 随机数的生成（1）

随机数

在上一节课《引入依赖》中，我们学习了如何为 Rust 项目添加依赖，并且引入了 rand 库，准备用它来生成随机数。这一课，我们将实际使用 rand 库来创建我们项目 Bulls and Cows 的基础：随机数。

项目流程

我们把 Bulls and Cows 程序大致分为三个部分：
● 生成随机数

● 程序捕获用户输入的数字

● 判定用户输入的数字是否等于生成的随机数

这一节课我们先学习第一步：生成一个可以猜测的随机数。
使用 rand 库
生成随机数是 Bulls and Cows 游戏的核心。在 Rust 中，我们可以利用之前引入的 rand 库轻松生成随机数。

1. 打开 main.rs 文件

它是项目的主要源文件，通常位于根目录的 src 目录下：

```rust
├── Cargo.toml
└── src
    └── main.rs
```

2. 引入 rand

在文件顶部添加 use rand::Rng;。这样我们就可以在接下来的代码中直接使用 rand 库提供的方法。

Syntax

use：引入库或特性。

```rust
use std::collections::HashMap;
```

在我们项目的 `main.rs` 文件中引入 `rand::Rng` 这个`Trait`，它用于生成随机数。

```rust
use rand::Rng
```

## 随机数的生成

经过上一节课的学习，我们已经成功引入了 rand 库，在这一节，我们将学习如何具体使用 rand 库生成一个我们的游戏需要的随机数。

编写生成随机数的代码

在 main 函数中，我们将添加代码来生成一个 1 到 100 之间的随机数。

```rust
let secret_number = rand::thread_rng().gen_range(1..101);
```

● secret_number ：它将存储生成的随机数。

● rand ：是我们之前引入的库，它包含了随机数生成的功能。

● thread_rng ：是 rand 库中的一个函数，它返回一个随机数生成器。
● gen_range ：是随机数生成器的方法，用于生成一个指定范围内的随机数。1..101 定义了一个范围，这个范围包括起始值 1，但不包括结束值 101。所以实际生成的随机数将在 1 到 100 之间（包括 1 和 100）

简而言之，这行代码声明了一个名为 secret_number 的变量，并调用 rand 库为当前线程的随机数生成器生成一个 1 到 100 的随机整数并赋值给它。这个随机数将用于接下来的游戏，作为玩家需要猜测的数字。

Syntax

Function Call

```rust
std::time::SystemTime::now()
```

声明一个名为 secret_number 的变量，并调用 rand 库生成一个 1 到 10 的随机整数并赋值给它。

```rust
let secret_number = rand::thread_rng().gen_range(1..11);
```

## 随机数的生成（3）

记录尝试次数

经过上一节课的学习，我们已经学习了如何使用 rand 库生成随机数。在这一节，我们将进一步完善我们的 Bulls and Cows 游戏，通过添加一个整数变量用于跟踪记录玩家猜测的次数。
添加尝试次数的记录

游戏中，跟踪玩家尝试的次数是一个重要的功能，它不仅可以用来显示玩家的当前进度，还可以用来决定游戏何时结束。

```rust
let mut attempts = 0;
```

● 声明可变变量 attempts ：在 Rust 中，可变变量允许我们在其生命周期内更改其值。对于记录玩家尝试次数这个属性来说，需要定义为可变变量，因为每次玩家猜测时，我们都需要更新这个计数。

● 初始化变量：初始化 attempts 变量为 0，表示在游戏开始时，玩家尚未进行任何尝试。

简而言之，这行代码声明了一个名为 attempts 的可变变量，并初始化为 0。
Syntax
Mutability

```rust
let mut number = 0;
```

声明一个可变变量 attempts 并初始化为 0，用来记录玩家尝试次数。

```rust
let mut attempts = 0;
```

## 程序捕获用户输入 (1)

引入 io 库

经过前面的学习，我们成功地生成了随机数并记录了玩家的尝试次数。接下来，在这一节中，我们将学习如何捕获用户的输入，这是实现游戏互动的关键一步。首先，我们需要引入 Rust 标准库中的 io（输入/输出）模块。

引入 std::io 库

为了读取用户在终端的输入，我们需要使用 std::io 模块。这个模块提供了各种处理输入和输出的功能，我们将用它来读取用户输入的数字。

在程序的开头，我们需要使用 use 语句引入 std::io。这使得我们可以在程序代码部分直接使用 io 相关的函数。

```rust
use std::io;
```

std::io 模块包含了处理输入和输出的多种工具。对于我们的游戏来说，最关键的是 stdin 函数，我们可以用它来读取用户输入的数据。Syntaxuse：引入库或特性。

```rust
use rand::Rng;
```

给我们的程序引入 std::io 模块

```rust
use std::io;
```

## 程序捕获用户输入 (2)

捕获用户输入

经过上一节课的学习，我们知道了如何引入 std::io 模块，为接下来程序捕获用户输入的数字做好了准备。现在，我们就开始学习，如何使用这个 io 模块来读取用户在终端输入的数字。

创建用于存储用户输入的变量

为了存储用户输入的数据，我们需要一个变量。这个变量应该是可变变量，因为用户可以多次输入，导致变量可以随时改变。

```rust
let mut input_data = String::new();
```

● `String::new()` ：创建一个新的空字符串，作为用户输入数据的存储容器。

● `let mut input_data`：声明了一个名为 input_data 的可变字符串变量，并初始化为 String::new() 空字符串。
读取用户输入

接下来，我们使用 std::io 模块中的 stdin 函数来读取用户的输入。

```rust
io::stdin().read_line(&mut input_data);
```

● `io::stdin()`：用于获取用户在终端的输入。它提供了一个通道，允许程序接收用户通过键盘输入的数据。简单来说，它就像是连接用户键盘和你的程序的桥梁。

● `read_line(&mut input_data)`：用来读取用户输入的文本并将其存储到指定的变量中。这个方法需要一个变量的可变引用，以便它可以将捕获的输入保存到那个变量里。

简单来说，这行代码使用 stdin() 函数获取终端输入的句柄，并调用 read_line 方法将用户输入的数据写入之前创建的 input_data 字符串。

Syntax

Mutable Variable

String

Function Call

```rust
let mut number = 1;
let mut str = String::new();
rand::thread_rng().gen_range(1..11);
```

创建一个名为 guess 的可变变量，并且为其赋值一个 String::new() 空字符串 。

```rust
let mut guess = String::new();
```

## 程序捕获用户输入 (2)

捕获用户输入

经过上一节课的学习，我们知道了如何引入 std::io 模块，为接下来程序捕获用户输入的数字做好了准备。现在，我们就开始学习，如何使用这个 io 模块来读取用户在终端输入的数字。

创建用于存储用户输入的变量

为了存储用户输入的数据，我们需要一个变量。这个变量应该是可变变量，因为用户可以多次输入，导致变量可以随时改变。

```rust
let mut input_data = String::new();
```

● String::new() ：创建一个新的空字符串，作为用户输入数据的存储容器。

● let mut input_data：声明了一个名为 input_data 的可变字符串变量，并初始化为 String::new() 空字符串。

读取用户输入

接下来，我们使用 std::io 模块中的 stdin 函数来读取用户的输入。

```rust
io::stdin().read_line(&mut input_data);
```

● io::stdin()：用于获取用户在终端的输入。它提供了一个通道，允许程序接收用户通过键盘输入的数据。简单来说，它就像是连接用户键盘和你的程序的桥梁。

● read_line(&mut input_data)：用来读取用户输入的文本并将其存储到指定的变量中。这个方法需要一个变量的可变引用，以便它可以将捕获的输入保存到那个变量里。

简单来说，这行代码使用 stdin() 函数获取终端输入的句柄，并调用 read_line 方法将用户输入的数据写入之前创建的 input_data 字符串。

Syntax

Mutable Variable

String

Function Call

```rust
let mut number = 1;
let mut str = String::new();
rand::thread_rng().gen_range(1..11);
```

通过 io::stdin() 函数获取终端输入，再调用其 read_line() 方法读取用户在命令行输入的数据，并将读取的结果通过引用传递给 guess 变量。

```rust
io::stdin().read_line(&mut guess);
```

## 程序捕获用户输入 (3)

处理输入异常

经过上一节课的学习，我们学会了如何读取用户输入的数据，但这个方法可能返回错误的信息，因此，这节课我们就将学习如何处理输入的错误。

理解 read_line 的返回值

```rust
io::stdin().read_line(&mut guess);
```

上节课我们学习了如何通过 io.stdin() 中的 read_line() 方法读取用户在命令行输入的值。

read_line() 方法在读取输入时可能会遇到各种问题，例如，用户输入非法字符或输入过程中发生中断等。

read_line() 方法会返回一个 Result 类型的值，这是一个枚举，其值可以是 Ok 或 Err。

● Ok：表示操作成功，包含成功读取的字节数。

● Err：表示操作失败，包含错误信息。

使用 expect 处理错误

为了处理可能发生的错误，我们使用 expect 方法。如果 read_line 方法返回一个 Err 值，expect 将会停止程序并显示你提供的错误信息，它可以帮助你快速发现并处理错误。

```rust
io::stdin().read_line(&mut guess).expect("Failed to read line");
```

在 read_line 调用后添加 `.expect("Failed to read line")`。这样，如果读取输入时出现错误，程序会停止运行，并显示 "Failed to read line"。

Syntax

Error Handling with expect

```rust
.expect("error message");
```

使用 expect() 为 read_line()方法做异常处理，当异常发生时，返回字符串 "Oops! Something goes wrong"。

```rust
.expect("Oops! Something goes wrong");
```

## 程序捕获用户输入 (4)

捕获用户输入

在之前的课程中，我们学习了如何捕获用户输入并处理可能出现的错误，但现在我们要考虑一个新的问题，就是在一个游戏中，通常玩家不会一次就猜中正确答案，因此我们需要提供多次猜测的机会。因此，我们将把这个过程放入一个循环中，允许玩家多次竞猜，直到他们找到正确的答案。

设置循环竞猜

在 Rust 中，我们可以使用 loop 关键字来创建一个无限循环，这样玩家就可以游戏中进行多次尝试。

```rust
loop {
			println!("Please input a number: ");
			let mut guess = String::new();
			io::stdin().read_line(&mut guess);
}
```

在循环内，我们将重复之前学到的逻辑，从用户那里获取输入并处理错误的步骤。

Syntax

loop

```rust
loop {
// 循环内的代码
}
```

创建一个 loop 循环，不断地提示用户输入数字，并捕获这些输入。

```rust
loop{
  // code
}
```

## 处理捕捉后的数据 (1)

数据预处理

在之前的课程中，我们学习了如何捕获用户输入的数据。接下来，我们将学习如何对这些捕获的数据进行预处理，以确保数据的准确性和可用性。这一节，我们将使用 trim 方法去除用户输入中不必要的空白字符。

去除空白字符

当用户输入数据时，他们可能会在开始或结束时不小心加入空格或换行符。这些额外的空白字符可能会干扰我们程序的逻辑判断。因此，我们使用 trim 方法来清除这些不需要的字符。

```rust
let input_data = "   42   ";
let trimmed_data = input_data.trim();

println!("Original Data: '{}'", input_data); //"   42   "
println!("Trimmed Data: '{}'", trimmed_data);//"42";
```

这行代码去除了 input_data 字符串两端的所有空白字符，并将结果存储在新的变量 trimmed_data 中。SyntaxStringtrim

```rust
let trimmed = text.trim();
```

对 guess 变量使用 trim() 方法去除前后不必要的空白字符，并重新赋值给新的变量 guess。

```rust
slet guess = guess.trim();
```

## 处理捕捉后的数据 (2)

转换和处理用户输入

在上一节课中，我们学习了如何使用 trim 方法去除用户输入中的不必要空白字符。接下来的这节课，我们将学习如何将把字符串转换成数值类型，并对转换的结果进行处理，以便后续的逻辑判断和计算。

使用 parse 转换字符串

上一节课，我们使用 trim 处理输入的字符串。

```rust
let guess = guess.trim()；
```

我们再调用 parse 方法，并指定转换后的类型。在这个例子中，我们将尝试将字符串转换为 u32 类型的整数：

```rust
let guess: u32 = match guess.trim().parse() {

		Ok(num) => num,
		Err(_) => {
		    println!("Please input valid number");
		    continue;
		}
};
```

● `let guess: u32 = match guess.trim().parse() { ... }`：这行代码尝试将去除空白符后的字符串解析为 u32 类型的整数，因此，我们把原来的 guess 变量声明为 u32 整数类型。

● `match` ：parse 方法转换字符串为整数类型时，可能成功、也可能失败，所以，我们使用 match 表达式允许我们处理每种可能的结果（Ok 和 Err）并返回。

● `Ok(num) => num`：如果 parse 成功，Result 将会是 Ok(num)，其中 num 是解析得到的数值。此处，我们使用 => 将得到的整数 num 直接返回。

● `Err(_) => {...}`：如果 parse 失败，Result 会是 Err(_)，其中 _ 是一个通配符，表示我们不关心具体的错误信息。这里我们输出一条错误消息，并使用 continue 跳过本次循环，提示用户重新输入。

Syntax

String parse

match

Result

```rust
let number: u32 = match text.trim().parse() {

		Ok(num) => num,
		Err(_) => {
		    println!("Please input valid number");
		    continue;
		}
};
```

把 guess 字符串变量使用 trim 函数处理， 结果交给 parse 方法转换，最后使用 match 表达式把处理的结果，返回给一个新的 u32 类型整数变量 guess。

## 两数的比对

内容

在获取并捕获了用户的输入之后，我们就可以完成程序的最后一步了——两数对比

数值比较

我们将使用 std 依赖中的 cmp 和 Ordering 来实现对比功能
cmp(): 方法是泛型，可以用于比较多种类型的值，比如整数，字符串，浮点数等。

```rust
use std::cmp::Ordering;

fn main() {
    let num1 = 42;
    let num2 = 30;

    // 使用cmp方法比较两个整数的大小
    match num1.cmp(&num2) {
        Ordering::Less => println!("{} 小于 {}", num1, num2),
        Ordering::Equal => println!("{} 等于 {}", num1, num2),
        Ordering::Greater => println!("{} 大于 {}", num1, num2),
    }
}
```

首先声明两个变量：num1 ，num2 ，通过 match() 和 cmp() 方法对比两数，cmp 方法将返回一个`std::cmp::Ordering` 的枚举，该枚举类有三个变体：Less，Equal, Greater 我们通过 match() 表达式来根据比较的结果执行不同的操作。

根据 println!() 中的提示填写对应的枚举变体

# Bulls and Cows 总结

内容

恭喜你 🎉 我们一同完成了 Bulls and Cows 的编程。在该项目中，我们学习了随机数的生成，rust 中的 I/O 流和比对方法的使用。在学习新内容的同时也回顾了之前的教学。右侧是项目的完整代码。

完整代码

```rust
use std::io;
use std::cmp::Ordering;
use rand::Rng;

fn main() {
    println!("Welcome to Bull and Cows");

    let secret_number = rand::thread_rng().gen_range(1..11);

    let mut attempts = 0;

    loop {
        println!("Please input a number:");

        let mut guess = String::new();
        io::stdin().read_line(&mut guess)
            .expect("Ops! Something goes wrong");

        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Please input valid number");
                continue;
            }
        };

        attempts += 1;

        if guess < 1 || guess > 10 {
            println!("Please input a number between 1 and 10");
            continue;
        }

        match guess.cmp(&secret_number) {
            Ordering::Less => {
                println!("too small!");
                if attempts > 5 {
                    println!("tips: you have tried {} times", attempts);
                }
            }
            Ordering::Greater => {
                println!("too big!");
                if attempts > 5 {
                    println!("tips: you have tried {} times", attempts);
                }
            }
            Ordering::Equal => {
                println!("Congratulation you're right!");
                println!("tips: you have tried {} times", attempts);
                break;
            }
        }

        if attempts == 10 {
            println!("You have tried 10 times, game over");
            break;
        }
    }
}
```
