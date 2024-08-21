# 语句和表达式

```rust
fn main() {
    // 语句，使用 let 关键字创建变量并绑定一个值
    let a = 1;

    // 语句不返回值，所以不能把语句(let a = 1)绑定给变量b，下面代码会编译失败
    let b = (let a = 1);

    // 表达式，返回值是 x + 1
    let y = {
        let x = 3;
        x + 1
    };

    println!("The value of y is: {}", y); // y = 4
}
```

# 示例代码

```rust
fn main() {
    // 以下4个为语句
    let a = 1;
    let b: Vec<f64> = Vec::new(); // vec表示创建一个类型为f64的动态数组
    let (a, c) = ("hi", false);  // 元组类型
    let x: i32 = 5;

    // 这是代码块表达式
    let y = {
        let x_squared = x * x;
        let x_cube = x_squared * x;

        // 下面表达式的值将被赋给 `y`
        x_cube + x_squared + x
    };
    println!("y is {:?}", y);  // y = 155

    let z = {
        // 这是一个表达式，计算 x+1 的值并返回
        x + 1

        // 如果加上分号(;)就变成了语句，无返回值
        // Rust中默认为“单元类型()”，此时 z = ()
        // x + 1;
    };
    println!("z = {:?}", z);

    // if 语句块也是一个表达式，因此可以用于赋值，也可以直接返回
    // 类似三元运算符，在Rust里我们可以这样写
    let p = if x % 2 == 1 {
        "odd"
    } else {
        "even"
    };
}
```
