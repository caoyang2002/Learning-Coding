> 前言：在上节我们介绍了 Rust 的所有权以及所有权的转移，但是仅仅支持通过转移所有权的方式获取一个值，会让程序变得复杂。那么，接下来我们学习下 Rust 中的另一特性：借用

借用(Borrowing) ：是指通过引用来获得数据的**访问权**，而不是所有权，用符号`&`表示。借用使得可以在**不转移所有权**的情况下，让多个部分**同时访问**相同的数据。Rust 的借用分为可变借用（mutable borrowing）和不可变借用（immutable borrowing）两种形式。

解引用：是借用的一个重要操作，允许通过引用获取到被引用值的实际内容，简单来说，就是获取到借用的对象的值。用符号`*`表示。

比喻
在所有权的背景下，“借用”其实很好理解，就如同你名下有一辆车，那你就拥有这辆车的所有权，你把车借给朋友开，他用完还要还给你，这就是“借用”，同时呢，他把车开到大街上向别人炫耀下他借到了一辆特别酷炫的车，这就是“解引用”。

```rust
// 变量s1拥有字符串的所有权，类似于你拥有一辆特别酷炫的车
let s1 = String::from("hello");

// 借用，通过 &s1 获得字符串的访问权，类似于朋友从你那里把这辆车借走了
// 但是车还是你的
let s: &String = &s1;

// 解引用，通过 *s 获的借用的对象的值
// 类似于你朋友把车开到大街上向别人展示：看，我借到了一辆特别酷炫的车！
println!("s1 = {}, s = {}", s1, *s);
```

通过一下的图示，我们会发现借用其实就是存储了字符串对象的内存地址指针，所以用更宽泛的概念来说，借用也是一种引用。

![image](https://hackquest-s3-prod-apne1.s3.ap-northeast-1.amazonaws.com/courses/f900092a-e3ac-44fc-9d49-744119511e36/ef7eac6f-6f72-4438-8923-b7818ce770f7/89ee0c23-8d07-45be-8075-9a7a7f550c10/3467b7c1-a622-4059-bf30-795dff29a2cc.webp?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAYCTGVDAPN77SBL7D%2F20240817%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240817T014046Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEP3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaDmFwLW5vcnRoZWFzdC0xIkcwRQIhANt2OcIeCljG5wrMZddx7LOSmaW7dvQFs7dAKpUUx8AQAiANhCGUbVtEpqCe2%2FmbmnsgDU74EIGgNLueldCAb7gLbCqnBAj3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAEaDDU1NTMzOTgxNDk0MiIMFudNtJMlw18GzS4PKvsD1Qpt%2F4OF64cbM0V1UR67HeTn3jbnzqN2t4xqT4dE4EZMFJ4%2F36T%2Fif1pTlVmWA8ov0swok6bd1kkTP3D4OPfZAUHDTIWjh76k2ggnxfcL1sdK0f1C6bKMyX%2BS7yhac1xo89%2FQNlFwsueO16UdtKG7tRU%2BA8Kp7hqP0%2BaVSLtYVF5gqZLNEeR0UOtPtrmkug3xRMcwG8eeTOMglxFcATeXMm84zVgaDKdalkO3bSOdFnlGdTy6UIkyFB%2FQK9hrKV7rE6ZgrPqSJNva3Dh6tO%2F9oh1l%2BbHrvP3ah%2FAJ5ksPx5AbI1%2BhserTAgsyqfD88VbsxVhHF3Q2GvrgVpBzLSWpgWyRNfgdPDDhXuI95ia%2FtiNShBv0BAJKrFe2MVZ7nOnkFxJSUge9%2BSXWskpSU7EGkQ4FNe0paFFjKIaPUCl1f4FiGxNsW7ABDNvzzg2haKS037W8wjHyWdWMx65SOBmbbnafkNX65quYUlSloH8wVAcc9GWYQWZHBz76pliY78YCJVA7VrYBXEn%2Fcp3xYM7YcM3qvP2a6pB3NW2DcrsgQ%2B2%2Be6R%2BvSTaxCsfdeHxQfjqfdxootdiJFEYavuKMkAaFA04sjBcgJ%2Fw8CjTJb4%2FvdhWg17p210w2K7JdFlUj0K0sVeFo7%2FHJxA9JpiMfSR9eSd5MYpIE%2FRdw9%2FMIuK%2F7UGOqYBFtrjYko7IXziPexqPEACXAmIEWV3YmRBlOzZjfUeTXT0rbJl3ZX43mLuEZ0IvQy%2FbSh3f4JCkw4qs4nD9UA%2BPcivEVXNlG%2BNgbWw92HOaAMKuKqu7fwSW7lmKZnqnapLTE9kh%2BzYnl5YPUf0wg2HbyIeuFZE0q7Pliy%2FqqYvhUNUY7fqmGqE0D7M83hNqoFtPlXwA5%2BqH6zM4siN2IhQSi7Zhjg%2BLA%3D%3D&X-Amz-Signature=84dd0eabcbc954e9b0897d2c3cfd743e15613e3fea3d83628349241f02f52b5b&X-Amz-SignedHeaders=host&x-id=GetObject)

这里我们学习下什么是不可变引用（借用）、可变引用与悬垂引用。

```rust
// 不可变引用，获取值的长度
fn calculate_length(s: &String) -> usize {
    s.len()
}

// 可变引用
fn change(some_string: &mut String) {
    some_string.push_str(", hackquest.");
}

// 悬垂引用（编译不通过）
fn dangle() -> &String {
    // 创建拥有字符串所有权的变量s
    let s = String::from("hello");

    // 返回对象的借用
    &s

} //离开函数体作用域后，变量s的内存空间会被自动释放掉，此时&s就成为无效指针（悬垂引用），因此，
  //会编译失败

fn main() {
    let s1 = String::from("hello");

    // &s1 即不可变引用（默认），也就是在函数中我们只能读取对象，而不能修改对象
    let len = calculate_length(&s1);
    println!("The length of '{}' is {}.", s1, len);

    let mut s2 = String::from("hi");
    // &mut s2 即可变引用，所以 change 函数可以修改该值
    let r1 = &mut s2;
    change(r1);

    // 试图访问悬垂引用的对象，编译失败
    // let reference_to_nothing = dangle();
}
```
