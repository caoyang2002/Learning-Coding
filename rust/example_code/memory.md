# 栈内存和堆内存

概念

前言：我们在前几节介绍过 Rust 的基础类型：`i32`、`char`、`f64`、`bool` 等，它们都是已知大小的，存储在栈内存中。在接下来的 Rust 所有权特性中会涉及到堆内存相关的知识，所以我们在这里使用 `String` 作为例子，并专注于 `String` 与所有权相关的部分，看下 Rust 如何在栈、堆内存中管理数据的。关于 `String` 类型更加深入的讲解会在第三章。

这里我们先介绍下关于内存的 2 个基础知识：栈内存和堆内存。

> ![NOTE]注意
>
> 这并不是 Rust 独有的。栈内存存储的数据主要为大小固定的基础数据类型，分配和释放速度很快；它以放入值的顺序存储值并以相反顺序取出值。这也被称作 后进先出（last in, first out）。堆内存存储那些大小在运行时动态变化的数据结构，允许更灵活的数据共享和动态分配；当向堆放入数据时，内存分配器（memory allocator）在堆的某处找到一块足够大的空位，把它标记为已使用，并返回一个表示该位置地址的 指针（pointer）。总的来说，堆、栈内存并无优劣之分，只是面向的场景不同而已。动态字符串（String 类型）： 大小可变的字符集合，这个类型允许程序在运行时动态的管理堆内存上的字符串数据，比如分配、增长和修改字符串内容，所以能够存储在编译时未知大小的内容。

比喻

栈内存的使用方式就像叠盘子一样：当增加更多盘子时，把它们放在盘子堆的顶部，当需要盘子时，再从顶部拿走。不能从中间也不能从底部增加或拿走盘子；同时，栈内存存储的数据的大小像盘子一样，都是固定的，因此分配和释放都很快。

而堆内存的使用方式就像往仓库中放入货物一样，入库前必须先清理出一片足够的区域，出库后这片区域又会被释放；同时，货物大小没有固定要求，只要仓库放得下即可。

通过下面的代码，我们看下动态字符串的创建。

```rust
use std::io;
fn main() {
     // 创建一个可变的字符串变量来存储用户输入
    let mut input: String = String::new();
    println!("请输入您的名字:");
    // 读取用户输入并将其存储在 input 变量中
    io::stdin()
        .read_line(&mut input)
        .expect("无法读取输入");
    // 打印用户输入的字符串
    println!("您的名字是: {}", input);
}
```

下面的代码展示了动态字符串的创建，以及克隆的代码示意。那它在内存中的结构是什么样的？请参见 FAQ。

```rust
fn main() {
    // 动态字符串
    let s1 = String::from("hello");

    // 克隆，把变量s1在堆内存的数据，复制了一份，存储在新开辟的内存空间中
    // 变量s3在栈内存中记录了新空间的位置、长度、大小信息
    let s3 = s1.clone();
    println!("s1 = {}, s3 = {}", s1, s3);
}
```

### FAQ

Q ：**Rust 中动态字符串在内存中的结构是什么样的，发生拷贝时，内存有什么变化？**（请结合 Example 例子）

**创建**动态字符串 hello 时，内存分配器会在**堆内存**中开辟一块空白的区域，当前为 5 个字节大小，用于存储 hello 的值。当把该动态字符串赋给变量 s1 时，s1 会在**栈内存**中存储该字符串在堆内存空间中的信息，包含：堆内存的指针、字符串长度、开辟的堆内存容量大小。如下图所示：

![image](https://hackquest-s3-prod-apne1.s3.ap-northeast-1.amazonaws.com/courses/f900092a-e3ac-44fc-9d49-744119511e36/ef7eac6f-6f72-4438-8923-b7818ce770f7/3408fe61-4135-4d6d-b3b9-5bb487ec4737/1dfa5f57-baa1-4ffc-9e53-b633355202fc.webp?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAYCTGVDAPLLZW2SFB%2F20240810%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240810T025102Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFcaDmFwLW5vcnRoZWFzdC0xIkcwRQIhAP3lq62jXrIgxQjc8YzBV36EtgI4J35qZysy%2FO2Hl2MoAiARpcGlLcYs9C%2F8mSn1YOPgZMCB4cM8C%2BYVw1YkjKe94yqeBAhQEAEaDDU1NTMzOTgxNDk0MiIM6ZIDCQ7hCBnxKZZbKvsDWTUhMw6fncmfVD7Z3BEMbRS4y3xAc%2FT49dlMWrIT7s%2BwOY9nymyxCYVp5LsXjHgsENFAmvKblXUi3xNwpXFll7EB8R5qdtGQm7Q7dhlX53gNnyGCMBcNXFgyGZ5kvKbrf0YL58sNMLNxx%2F46kaGxLsdiSL4IRW%2F1eZHQGum%2F3tFZhB1m6kZLpSz8xH0Bi3LkG0GIZBiZ3DejS5U9HxW7KxglnposKBfrx2ZSWgChsSeVMvFCELzlgyUtJhyHVXL2o%2BAHIpVekY3QFXrSxeV2UBO5z9lu0UmM9zOZDGxAjHZHSnQ%2B02UNHonPLuxzeMYxKFMFRTdiHbRIWSRoAomiwbiWnOtTEOqTpJTpoBqeMCyR52I5h%2BISMJzDvKo8OHsX6s4lED9SFx3kFsWOEQJjTG8TUhVWCcxBSKZIeArjqVbJJ0qm86KcG7T1CvpRRBWhqWLxHEx0evSIrjkd4TW289jsOUr2sHFUvv%2Ftc%2F8cf8NwbULQN46yyRWzlhpWP4cdWjwqHquZOb7tA5T9w40RJXvepszDEzJoX2e0ReOuE9kQw47V3uMViycGg4HRBlnZlBipM5iC6N3%2FzZHS%2BmFMu3Law3%2BenfSWs5Z%2Fr4xXGp8pp%2Bgp6TdvjhWYER%2Bv1gXhXH4LIWlZDd6lMAli0aMFXaXPA%2Blk2AYCFz2BMM2%2B2rUGOqYBhAtFIlheVJCmPe3%2Br49HmQedt%2BfxkPUfBVHl5CJ%2BWsNskSbMGvi2ST1%2FXgkzA3rfJzpMzJRvVVryDTVdJnpyXnWDF%2FGDmVpVBuDAArYSCFm8UVq4D9egUxm475FM2WdA9VZwXYN1iLjUmLnWOZDEQE3lA2kXSzo99ES2QUEjmKBY5OLgNEPt0a1mlP3GTm7l21n534Kd0%2FQgijgLQlRTCb1NQsPs7A%3D%3D&X-Amz-Signature=839f90590a699a7a931706d0c3a08927afc8092d63d97f350e512751e9b895a3&X-Amz-SignedHeaders=host&x-id=GetObject)

**克隆（深拷贝）**：假设这样一个场景：我们想要修改该字符串，但又不想影响其他使用该字符串的地方，那该怎么办？答案是：克隆，即把该字符串生成一个副本，对副本进行修改，这样就可以达到上述目的。克隆后在内存中的结构如下：

![image](https://hackquest-s3-prod-apne1.s3.ap-northeast-1.amazonaws.com/courses/f900092a-e3ac-44fc-9d49-744119511e36/ef7eac6f-6f72-4438-8923-b7818ce770f7/3408fe61-4135-4d6d-b3b9-5bb487ec4737/6344e6e0-96b7-4aa0-b023-0bf6efc90cc3.webp?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAYCTGVDAPLLZW2SFB%2F20240810%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240810T025102Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFcaDmFwLW5vcnRoZWFzdC0xIkcwRQIhAP3lq62jXrIgxQjc8YzBV36EtgI4J35qZysy%2FO2Hl2MoAiARpcGlLcYs9C%2F8mSn1YOPgZMCB4cM8C%2BYVw1YkjKe94yqeBAhQEAEaDDU1NTMzOTgxNDk0MiIM6ZIDCQ7hCBnxKZZbKvsDWTUhMw6fncmfVD7Z3BEMbRS4y3xAc%2FT49dlMWrIT7s%2BwOY9nymyxCYVp5LsXjHgsENFAmvKblXUi3xNwpXFll7EB8R5qdtGQm7Q7dhlX53gNnyGCMBcNXFgyGZ5kvKbrf0YL58sNMLNxx%2F46kaGxLsdiSL4IRW%2F1eZHQGum%2F3tFZhB1m6kZLpSz8xH0Bi3LkG0GIZBiZ3DejS5U9HxW7KxglnposKBfrx2ZSWgChsSeVMvFCELzlgyUtJhyHVXL2o%2BAHIpVekY3QFXrSxeV2UBO5z9lu0UmM9zOZDGxAjHZHSnQ%2B02UNHonPLuxzeMYxKFMFRTdiHbRIWSRoAomiwbiWnOtTEOqTpJTpoBqeMCyR52I5h%2BISMJzDvKo8OHsX6s4lED9SFx3kFsWOEQJjTG8TUhVWCcxBSKZIeArjqVbJJ0qm86KcG7T1CvpRRBWhqWLxHEx0evSIrjkd4TW289jsOUr2sHFUvv%2Ftc%2F8cf8NwbULQN46yyRWzlhpWP4cdWjwqHquZOb7tA5T9w40RJXvepszDEzJoX2e0ReOuE9kQw47V3uMViycGg4HRBlnZlBipM5iC6N3%2FzZHS%2BmFMu3Law3%2BenfSWs5Z%2Fr4xXGp8pp%2Bgp6TdvjhWYER%2Bv1gXhXH4LIWlZDd6lMAli0aMFXaXPA%2Blk2AYCFz2BMM2%2B2rUGOqYBhAtFIlheVJCmPe3%2Br49HmQedt%2BfxkPUfBVHl5CJ%2BWsNskSbMGvi2ST1%2FXgkzA3rfJzpMzJRvVVryDTVdJnpyXnWDF%2FGDmVpVBuDAArYSCFm8UVq4D9egUxm475FM2WdA9VZwXYN1iLjUmLnWOZDEQE3lA2kXSzo99ES2QUEjmKBY5OLgNEPt0a1mlP3GTm7l21n534Kd0%2FQgijgLQlRTCb1NQsPs7A%3D%3D&X-Amz-Signature=a4e7bd82684de3b1d1d47828e28a6a9238a89e8fc09ffc7c613ed0303c71524b&X-Amz-SignedHeaders=host&x-id=GetObject)

但克隆会**对性能有影响**，尤其是对于执行较为频繁的代码(热点路径)或者克隆较大的内存对象时，使用 clone 会极大的降低程序性能。

在其他编程语言中（如 Java），还有一种**浅拷贝**的方式，即只拷贝**栈内存**中的数据，此时变量 s1 有了副本 s2，但堆内存数据并没有复制，所以这种操作的效率非常高。但由于 2 个变量指向同一个堆内存，所以变量 s1、s2 都可以修改数据，造成数据竞争，因此需要非常谨慎。

不过好在 Rust 有自己的处理机制：**所有权和借用**，我们会在接下来的章节介绍到。

![image](https://hackquest-s3-prod-apne1.s3.ap-northeast-1.amazonaws.com/courses/f900092a-e3ac-44fc-9d49-744119511e36/ef7eac6f-6f72-4438-8923-b7818ce770f7/3408fe61-4135-4d6d-b3b9-5bb487ec4737/1a55cc5f-86a7-4594-a583-2e5054163b0a.webp?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAYCTGVDAPLLZW2SFB%2F20240810%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240810T025102Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFcaDmFwLW5vcnRoZWFzdC0xIkcwRQIhAP3lq62jXrIgxQjc8YzBV36EtgI4J35qZysy%2FO2Hl2MoAiARpcGlLcYs9C%2F8mSn1YOPgZMCB4cM8C%2BYVw1YkjKe94yqeBAhQEAEaDDU1NTMzOTgxNDk0MiIM6ZIDCQ7hCBnxKZZbKvsDWTUhMw6fncmfVD7Z3BEMbRS4y3xAc%2FT49dlMWrIT7s%2BwOY9nymyxCYVp5LsXjHgsENFAmvKblXUi3xNwpXFll7EB8R5qdtGQm7Q7dhlX53gNnyGCMBcNXFgyGZ5kvKbrf0YL58sNMLNxx%2F46kaGxLsdiSL4IRW%2F1eZHQGum%2F3tFZhB1m6kZLpSz8xH0Bi3LkG0GIZBiZ3DejS5U9HxW7KxglnposKBfrx2ZSWgChsSeVMvFCELzlgyUtJhyHVXL2o%2BAHIpVekY3QFXrSxeV2UBO5z9lu0UmM9zOZDGxAjHZHSnQ%2B02UNHonPLuxzeMYxKFMFRTdiHbRIWSRoAomiwbiWnOtTEOqTpJTpoBqeMCyR52I5h%2BISMJzDvKo8OHsX6s4lED9SFx3kFsWOEQJjTG8TUhVWCcxBSKZIeArjqVbJJ0qm86KcG7T1CvpRRBWhqWLxHEx0evSIrjkd4TW289jsOUr2sHFUvv%2Ftc%2F8cf8NwbULQN46yyRWzlhpWP4cdWjwqHquZOb7tA5T9w40RJXvepszDEzJoX2e0ReOuE9kQw47V3uMViycGg4HRBlnZlBipM5iC6N3%2FzZHS%2BmFMu3Law3%2BenfSWs5Z%2Fr4xXGp8pp%2Bgp6TdvjhWYER%2Bv1gXhXH4LIWlZDd6lMAli0aMFXaXPA%2Blk2AYCFz2BMM2%2B2rUGOqYBhAtFIlheVJCmPe3%2Br49HmQedt%2BfxkPUfBVHl5CJ%2BWsNskSbMGvi2ST1%2FXgkzA3rfJzpMzJRvVVryDTVdJnpyXnWDF%2FGDmVpVBuDAArYSCFm8UVq4D9egUxm475FM2WdA9VZwXYN1iLjUmLnWOZDEQE3lA2kXSzo99ES2QUEjmKBY5OLgNEPt0a1mlP3GTm7l21n534Kd0%2FQgijgLQlRTCb1NQsPs7A%3D%3D&X-Amz-Signature=8723bed684622226eda93863c76c9a1b7b8608fc7849181b5751257b6d3e0176&X-Amz-SignedHeaders=host&x-id=GetObject)
