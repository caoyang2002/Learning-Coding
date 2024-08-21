# 枚举

概念

枚举（Enum）是一种用户自定义数据类型，它允许你列举一些可能的值，也叫变体（variants），每个变体也可以包含不同类型的数据。枚举主要用于表示不同种类的选项或操作，以及进行模式匹配等场景。它的定义如下：

```rust
enum 枚举名 {
	variants1,
	variants2,
	……
}
```

比喻

枚举的概念可以用“交通信息号灯”来类比，有 3 种不同的取值，分别为红、绿、黄；除此之外，“星期”也可以作为枚举，它包含周一到周日这 7 个取值范围。简单来说，我们把某个领域所有的取值范围枚举出来，就形成了它的枚举类型。
Documentation

我们以交通信号灯为例，看看它的枚举是什么。

```rust
// 通过 enum 关键字定义
enum TrafficLight {
  // 这里枚举出所有的取值
  Red,
  Yellow,
  Green,
}
```

FAQ
Q：什么是 Option 枚举，如何使用？A：Option 枚举主要用于处理可能出现空值的情况，以避免使用空指针引起的运行时错误。它的定义如下：

```rust
// 它有两个枚举值，Some(T): 包含一个具体的值 T，以及 None: 表示没有值。
enum Option<T> {
None,
Some(T),
}
```

下面的例子中 divide 函数的返回值就是 Option 枚举。请注意：Rust 的 标准库 prelude 中，Option 枚举是默认导入的，因此在代码中使用 Option 时无需显式使用 Option:: 前缀或者通过 use 语句显式导入。

```rust
// 定义一个函数，返回一个 Option 枚举
fn divide(x: f64, y: f64) -> Option<f64> {
if y == 0.0 {
None
} else {
Some(x / y)
}
}

fn main() {
// 调用函数并匹配 Option 的变体
let result1 = divide(10.0, 2.0);
match result1 {
// 这里不需要显式使用 Option::Some(data)
Some(data) => println!("result1:{:?}", result1),
None => println!("result1: None"),
}

    // 当分母为0，返回None值
    let result2 = divide(10.0, 0.0);
    match result2 {
        Some(data) => println!("result2:{:?}", result2),
        None => println!("result2: None"),
    }

}
```

示例代码

这里我们学习下枚举的使用以及枚举是如何表达更多的信息。

```rust
// 简单枚举
enum TrafficLight {
Red,
Yellow,
Green,
}

// 包含值的枚举，不同成员可以持有不同的数据类型
enum TrafficLightWithTime {
Red(u8),
Yellow(char),
Green(String),
}

fn main() {
// 通过 :: 操作符来访问 TrafficLight 的成员
let red = TrafficLight::Red;
let yellow = TrafficLight::Yellow;

    // 包含时间的红绿灯
    let red_with_time = TrafficLightWithTime::Red(10);
    let yellow_with_time = TrafficLightWithTime::Yellow('3');
    let green_with_time = TrafficLightWithTime::Green(String::from("绿灯持续30秒"));

}
```
