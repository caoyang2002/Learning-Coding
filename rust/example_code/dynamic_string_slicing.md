# 动态字符串切片

> 前言：在前几节我们介绍过 String 类型的内存结构，有了这个基础，我们就更容易理解本节的切片概念。

切片（slice）：是一种引用数据结构，它允许你引用数据的一部分而不需要拷贝整个数据。切片通常用于数组、字符串等集合类型。
字符串切片（String slice）：是一种特殊的切片，专门用于处理字符串。字符串切片的类型是 `&str`。它可以通过索引或范围来指定字符串的一部分。字符串切片提供了对字符串的引用，而不引入额外的内存开销。本节我们讨论的是分配在内存中的可动态调节大小的字符串的切片。

比喻
我们可以把整本书比作字符串，它可以包含大量信息，但你可能只对其中的一部分感兴趣，比如 10~20 页，那么你就可以只看这些页的内容，这就类似于切片。

我们接下来学习下切片的基本语法，以及对应的内存模型。

```rust
// 该字符串分配在内存中
let s = String::from("hello world");

// hello 没有引用整个 String字符串 s，而是引用了 s 的一部分内容，通过 [0..5] 的方式来指定。
let hello: &str = &s[0..5];
let world: &str = &s[6..11];
```

创建切片需要通过 `[开始索引..终止索引]` 来指定范围，代表的数据范围包含开始位置，但不包含结束位置，即前闭后开；同时索引位置从 0 开始。

![image](https://hackquest-s3-prod-apne1.s3.ap-northeast-1.amazonaws.com/courses/f900092a-e3ac-44fc-9d49-744119511e36/3b3fd9f6-bf88-4254-97d6-724552342ed1/4ccd8957-8e21-4944-bf32-fe1a795389cb/5fa27ad2-7558-4025-b046-bdd615fd6332.webp?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAYCTGVDAPLYUTKDAN%2F20240817%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240817T015200Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP7%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaDmFwLW5vcnRoZWFzdC0xIkYwRAIgPLdHpnodP%2Fzaec%2BcXEMIJjvT%2B3QNuNjzxd7L8CqUnloCIAtf7a%2FyLPcy%2FMGj5s5Mp9EtHfM3y4OSXE9nYYZSsbp1KqcECPf%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQARoMNTU1MzM5ODE0OTQyIgyjMkF0XLSZ%2BWuILXkq%2BwNIxiZwV4QfJrik3MPi4a0kZtjCfWTTQkuIkOWVHMmIWtW652zsYBUkQ3mJra38ZiLMZKHI5IeJ%2BNlXqZ01yXZ8qY2mLW3L%2BEp%2FoI62I%2BpyB%2BqjS%2BiUq3XJ9jdHNeKYtPAFitH1%2FaCJEs2mnqqgGGdyKeb35z31jk%2Bve50Yvd1C1qTb84RnB0fb4eJtE9LPtvMPqInhqtPiSHWR5yIuobYlqUinvle2mhnie6xIgt8L5jny4a6g6egVfUhas7gStMC2%2FdiaKZ0ZEu1tzWnTcQ49k3h%2FVWaSv1Ihg7opVey%2F01uDKgXha93RNUzalOPqA6v1Lb3MsMq1xLm0Ry9tM8jdM5xnxkFcl1UrHoxFvrXb0cy%2FAOssXH70aKPpDzrujuZJA6OTpTbKtHyLT3sha5WeCluYUxKH2AJERZvHR0BR1SoeiXq9XLJtEW0i4BU2HXCA2Uq3WFW7XWX%2FLfxiBJpCLFkRLIBGZtF4%2FC1xL0E4Pcc6se%2BGYagjGEEoXDCUvLi4YJ4n2VSZc6Ig4FxcTngTGWzG%2BPu0y4Y6jlxhYCxRA6%2FbqIH0wBWPqj%2F7y2LuD0u7D3kInu79sqY8xsc6Ae29Dp1gE991n5o9NTbhHyV9nCfZ6%2F5kCL4JKv0JYT3cKjR2KCwJi%2FBgUYVoNGK1LsTXfkWEwusJKZy0vXYwzY%2F%2FtQY6pwGFx2OVuhrjs8d08BjolQshZTi1w8ej5A8SVchswrjE%2Fb0%2Fn5LK%2FARkzwUXaW4XPMME%2Bq7KVIj1VmEqNCYoLVnWxJwBDDFiT96JWJK%2FZZZB7niZRZZkNrjcHjOMGG%2BCr8dfPr7hTGuvhIEREuFQexWkP2gJNDkSqGJiK1SVIbsFHoXACL11fDNYb4bdyXVsrFhGMtlCyUsCWfHee8rZG%2FB2qg9zU8BM8w%3D%3D&X-Amz-Signature=32e2099f1d9a538fc9d2936f9368d8c26e434b838e8139bfac0e68e77828f6c7&X-Amz-SignedHeaders=host&x-id=GetObject)

切片的几种方式

```rust
fn main() {
    let s: String = String::from("hello, hackquest.");

    // 起始从0开始， .. 代表一个或多个索引
    let slice1: &str = &s[0..2];
    // 默认也是从0开始
    let slice2: &str = &s[..2];

    let len: usize = s.len();
    // 包含最后一个字节，由于最后1个字节的索引为(len-1)，所以[4..len]的方式刚好包含了第(len-1)个字节
    let slice3: &str = &s[4..len];
    // 默认到最后1个字节
    let slice4: &str = &s[4..];

    // 获取整个字符串的切片
    let slice5: &str = &s[0..len];
    // 同上
    let slice6: &str = &s[..];
}
```

FAQ
Fold All
Q：如果字符串包含汉字，在获取字符串切片时有什么要注意的？
A：字符串切片的索引位置是按照字节而不是字符。由于汉字使用 UTF-8 编码，一个汉字（字符）可能由一个或多个字节组成。因此索引必须对应一个完整的汉字的边界，否则获取该汉字会失败。

```rust
let chinese_string = "中国人";

// 获取切片 zhong 会失败，因为一个汉字可能由“一个或多个字节”组成。
// 这里“中”占用3个字节，因此 [0..2]并不对应一个完整的汉字的边界
let zhong = &chinese_string [0..2];

// 正确的写法，1个汉字占3个字节，即汉字“中”的字节范围是0、1、2
let zhong = &chinese_string[0..3];
println!("{}", zhong);
```

在 Rust 中，字符串切片使用半开区间表示，格式为 `[开始索引..结束索引)`。对于 `String` 类型，索引是从 0 开始的字符偏移量。对于包含多字节字符的字符串，如 UTF-8 编码的字符串，字符的起始位置可能不是字节的起始位置。

在第 15 行的代码中，你想要获取字符串 `"你好，世界"` 的第一个字符 "你"。由于 "你" 是一个 UTF-8 编码的字符，它可能占用多个字节。在 UTF-8 编码中，中文字符通常占用 3 个字节。

要修复第 17 行的代码，你需要正确地获取 "你" 这个字符。由于 "你" 占用 3 个字节，你应该这样写：

```rust
let slice = &s[0..3]; // 从字节索引 0 开始，到字节索引 3（不包括3）
```

这样 `slice` 就会包含 "你" 这个字符。注意，这里使用的是字节索引，而不是字符索引。

另外，第 9 行的代码中的 `s` 是一个字符串字面量，它已经被分配在栈上，所以你可以直接使用字符串切片语法来获取子字符串。不需要使用 `size_of_val` 函数，因为它是用来获取一个值在内存中的大小，而不是用来处理字符串切片。

这是完整的修正后的 `main` 函数：

```rust
fn main() {
    let s = String::from("hello");

    let slice1 = &s[0..2];
    let slice2 = &s[..2];
    assert_eq!(slice1, slice2);

    let s = "你好，世界";
    let slice = &s[0..3]; // 正确获取第一个中文字符 "你"
    assert!(slice == "你");
}
```

这段代码现在应该可以正常编译和运行，并断言 `slice` 等于 "你"。
