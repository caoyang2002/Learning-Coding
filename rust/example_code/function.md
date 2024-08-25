```rust
// fn 为声明函数的关键字
// unsafe_add()是函数名，函数的命名要遵循 snake_case 的规范，同时要见名知意，提高代码的可读性
// i 和 j 是入参，并且需要显式指定参数类型
// --> i32 表明出参也是 i32 类型
fn unsafe_add(i: i32, j: i32) -> i32 {
   // 表达式形式，所以函数会在计算求和后返回该值
   i + j
}
```

我们在这里展示 Rust 特有的一些函数：表达式作为返回值的函数、单元类型 `()` 作为返回值的函数 以及永不返回的发散函数。

```rust
// 表达式作为返回值的函数
fn max_plus_one(x: i32, y: i32) -> i32 {
    if x > y {
        // 命中该规则，可通过return直接返回
        return x + 1;
    }

    // 最后一行是表达式，可作为函数返回值
    // 注意，这里不能有分号，否则就是语句
    y + 1
}

// 单元类型()作为返回值的函数
// 该函数没有显式执行返回值类型，Rust默认返回单元类型()
fn print_hello() {
    // 这里是个语句，不是表达式
    println!("hello");
}

// 永不返回的发散函数，用!标识
fn diverging() -> ! {
    // 抛出panic异常，终止程序运行
    panic!("This function will never return!");
}
```

# FAQ

Q1：Rust 为什么要设计没有任何返回值的单元类型 `()` ?

> A：Rust 是一门静态类型语言，它在编译时需要确定每个函数的返回类型。
> 当函数体中没有返回语句或表达式时，编译器无法确定函数的返回类型应该是什么。为了解决这个问题，Rust 引入了单元类型 `()` 作为一种特殊的类型，表示没有返回值的函数。类似于其他语言中的 `void` 类型，通常用于打印消息、写入文件等一些不需要返回值的操作。

Q2：什么是发散函数（Diverging Functions）?

> A：指的是永远不会返回的函数，甚至连默认的单元类型 `()` 返回值都没有，这些函数通常用 `!` 类型来标注。通常用于处理错误或不可恢复的情况，并通过终止程序的执行来表达这种状态。