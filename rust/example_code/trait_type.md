# Trait 的关联类型

概念

在 Rust 中，关联类型允许我们在 trait 中使用类型参数 type，该类型可以在实现 trait 的时候具体化。这使得 trait 能够与不同的具体类型一起使用，而不需要在 trait 中提前指定具体的类型。·通过关联类型，我们可以在 trait 中使用抽象的类型，而在实现 trait 时再具体指定这些类型，这样就可以在不同的类型上共享相同的行为，从而增加了 trait 的灵活性。

比喻

就像是一种“填空游戏”，其中 trait 定义了一些空白，而实现这个 trait 的类型可以填入这些空白，使得这个 trait 变得更具体。

Documentation

关联类型是在特征定义的语句块中，申明一个自定义类型，这样就可以在特征的方法签名中使用该类型：

```rust
pub trait Iterator {
    type Item;

    fn next(&mut self) -> Option<Self::Item>;
}
```

以上是标准库中的迭代器特征 Iterator，它有一个 Item 关联类型，用于替代遍历的值的类型。同时，next 方法也返回了一个 Item 类型，不过使用 Option 枚举进行了包裹，假如迭代器中的值是 i32 类型，那么调用 next 方法就将获取一个 Option<i32> 的值。

```rust
impl Iterator for Counter {
    type Item = u32;

    fn next(&mut self) -> Option<Self::Item> {
        // --snip--
    }
}
```

通过如上代码，我们在 Counter 的实现中指定了 Item 的具体类型 u32，这也是 next 函数的返回值 Self::Item 对应的类型。

FAQ

Q：是否可以通过范型参数达到相同的效果，关联类型跟范型参数相比，它们的适用场景有什么区别？
A：通过在 trait 中使用泛型参数，可以实现与关联类型类似的灵活性。以下是使用泛型参数的示例：

```rust
pub trait Iterator<T> {

    fn next(&mut self) -> Option<T>;

}
```

关联类型相对于泛型参数相比，语法更简洁：使用关联类型时，不需要在每个 impl 语句中指定具体的类型参数（如 impl Iterator<u32> for Counter {…}），而是在 trait 中定义关联类型，尤其当范型参数较多时，使得代码更加清晰简洁，提升代码可读性。通常情况下，范型参数更适用于函数中，当函数需要适用于多个不同类型时，使用泛型参数可以提供更大的灵活性。而关联类型更适合与 trait 相关的类型抽象：当 trait 需要定义一个与 trait 相关的类型，且这个类型在实现 trait 时才能确定具体类型时，使用关联类型会更加合适。因此，选择使用泛型参数还是关联类型取决于具体的需求和代码结构，以及对灵活性和抽象级别的需求。

示例代码

在下面的示例中，我们定义了一个名为 Summary 的 trait，并在其中声明了一个关联类型 Output。然后，我们为 NewsArticle 实现了 Summary trait，并为关联类型 Output 指定了具体的类型 String。

```rust
// 定义一个 trait，其中包含一个关联类型
trait Summary {
// 关联类型
type Output;

    // 定义一个方法，返回关联类型
    fn summarize(&self) -> Self::Output;

}

// 实现 Summary trait 的具体类型：NewsArticle
struct NewsArticle {
headline: String,
location: String,
author: String,
}

// 实现 Summary trait for NewsArticle
impl Summary for NewsArticle {
// 指定关联类型的具体类型
type Output = String;

    // 实现 trait 中的方法
    fn summarize(&self) -> String {
        format!("{}, by {} ({})", self.headline, self.author, self.location)
    }

}

fn main() {
let article = NewsArticle {
headline: String::from("Penguins win the Stanley Cup Championship!"),
location: String::from("Pittsburgh, PA, USA"),
author: String::from("Iceburgh"),
};

    println!("{}", article.summarize());

}
```
