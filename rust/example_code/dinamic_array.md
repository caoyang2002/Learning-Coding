# 动态数组

概念

上一节我们已经初步了解了“动态数组”的概念，接下来我们深入学习下。动态数组 `Vec<T>`是一种灵活的数据结构，允许在运行时动态改变大小。所以它的长度是可变的，可以根据需要动态增加或减少元素。这为处理不确定数量的数据提供了便利，比如读取未知数量的用户输入或动态生成数据集。与 String 类型不同，动态数组 `Vec<T>`是通用的，可以存储“任何类型”的元素，而 String 专门用于处理 UTF-8 编码的文本数据。

动态数组 Vec 提供更灵活的操作，但在处理文本时，String 提供了一些额外的字符串特定功能，例如字符串连接、切片等。选择使用动态数组 Vec 还是 String 取决于具体的需求和数据类型。

比喻

生活中有很多事物具有类似于动态数组的特性，比如购物袋： 想象一个可以随时调整大小的购物袋。你可以根据购物需求，随时往里面加入或取出物品，而不需要提前确定购物袋的大小。又或者播放列表： 在音乐或视频播放列表中，你可以根据喜好不断添加或删除曲目，而不受歌单大小的限制，这种灵活性类似于动态数组的可变性，支持在运行时调整大小。

Documentation

下面的代码展示了 5 种创建动态数组的不同方式。

```rust
// 1.显式声明动态数组类型
let v1: Vec<i32> = Vec::new();

// 2.编译器根据元素自动推断类型，须将 v 声明为 mut 后，才能进行修改。
let mut v2 = Vec::new();
v2.push(1);

// 3.使用宏 vec! 来创建数组，支持在创建时就给予初始化值
let v3 = vec![1, 2, 3];

// 4.使用 [初始值;长度] 来创建数组，默认值为 0，初始长度为 3
let v4 = vec![0; 3]; // v4 = [0, 0, 0];

// 5.使用 from 语法创建数组
let v5 = Vec::from([0, 0, 0]);
assert_eq!(v4, v5);
FAQ
Q：动态数组 Vector 在内存中的结构是什么样的，如何进行动态调整的？
fn main() {
let mut v: Vec<i32> = vec![1, 2, 3, 4];
//prints 4，即数组的初始容量是 4
println!("v's capacity is {}", v.capacity());
// 打印内存地址
println!("Address of v's first element: {:p}", &v[0]);

    v.push(5);
    //prints 8，数组进行扩容，容量变成8
    println!("v's capacity is {}", v.capacity());
    // 打印扩容后的内存地址，会发现跟上面的地址并不相同
    println!("Address of v's first element: {:p}", &v[0]);

}
```

初始时动态数组 v 的容量是 4，堆内存中存储数值，栈内存中记录了堆内存的地址指针、数组容量及数组大小，当添加新元素 5 时，数组进行扩容，重新申请一块 2 倍大小的内存（即 8），再将所有元素拷贝到新的内存位置，同时更新指针数据，这时数组大小是 5，容量大小是 8。

![images](https://hackquest-s3-prod-apne1.s3.ap-northeast-1.amazonaws.com/courses/f900092a-e3ac-44fc-9d49-744119511e36/3b3fd9f6-bf88-4254-97d6-724552342ed1/6d5454be-6d00-41db-a93e-b97deb4a6f1b/8ac3f33e-8b52-4db7-ab48-966a56c6b209.webp?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAYCTGVDAPMWHA4MA6%2F20240819%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240819T034725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDMaDmFwLW5vcnRoZWFzdC0xIkgwRgIhAOp0oWSNw4s79PImse4z7yv3e2Fo7lLyh9Cyrkc%2FytDOAiEA3Nd57Cjhx6PP0HQrvFFzz05asHQ56zjdYvWakFfRDZMqngQIPRABGgw1NTUzMzk4MTQ5NDIiDJArt4ZpyUhCeZPNpyr7A3oU1VWp30lcSjow0sZWQ9QHPAoO61fom8mFxCgR25Pt3BqA3FqGhqsA%2FlKqzsIE0LGmgdKca0HPdpuHmv9cQ%2BD4r%2BH1C5yY0KmVRSaMyUr1izx1dqwHdk1LCL50f7MBv2ieHX6r3ec4F6ZkxJQ3p4DvkD69oEqMhsWcpI2jntrPZSo89QAyRmwTZU%2BcjgD0LBAkfAeGxuhtMYZn0v7kS%2FCYbyBnc5UNaU%2FqcQsH3jPk44P0qfK3%2BGB%2BYlQ91vxlMSL4tY1cHtDoUGReIc8MZbkiS5pRJKA60tprqGuRHjwrBZ2kpoq3CfhvQH%2BLUsrFy5%2BSYh6JsB6DQZtQsyI74cq1nkE5OlkfW7d4o2e0XLGIisIqLJ7EBs8pcKKQeCTZSiL2wOp1NKYNWSXlXLOGZWBdZ6dPNvL6IdVu7ZjIBsbbIUwvSVimcXeuby39F929NZavP7QsMrs8T1ke34EY72LvVDoCA6TdaGArJJuBU6DmqyQ%2FmMT4PAgVqcO9zpuqyBO6qUWnjXk%2BAADzexStomB89XBVSTc%2FjsNPXit%2FeAF2rXwVvkj8BYwcFg1o4nq9mFxvIHFgwOg5KIDgovNzfn0zwbC9ivB8s5Kp%2BhGl99Ln7FIWxSqcaxEfJXv3u8OJ8nyfS6GAQzmBV2Giq12WDmjCUWkxUMADIvme2TCn9oq2BjqlAeu%2FtXdovXWzPehs%2Bgm0WnY2R28vj8bMeoAw5yoPCwuATCkaXFEc6JlLgoLHIpv%2B4SvhXGbsv28bHyt4F%2FMCQwcXD30nRaM0x1VqRFHIda6hUZDH%2By1q5UqQL4jIGVqAt6%2Bubn8HaqGqPmvD%2F9YLKCvt3E9zHokkjGUZMOW9A3pyVsqmBJoXqLQpLfpwmOyx0iIre2G%2Buw2vl0SNuTqdXRmWkociPQ%3D%3D&X-Amz-Signature=8b3128fdf272922aebc1847148704f30cb743417d2c69f45dcbb0dc7e5decc92&X-Amz-SignedHeaders=host&x-id=GetObject)

![image](https://hackquest-s3-prod-apne1.s3.ap-northeast-1.amazonaws.com/courses/f900092a-e3ac-44fc-9d49-744119511e36/3b3fd9f6-bf88-4254-97d6-724552342ed1/6d5454be-6d00-41db-a93e-b97deb4a6f1b/47338a88-d7d7-4554-9480-459346f69f0e.webp?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=ASIAYCTGVDAPMWHA4MA6%2F20240819%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20240819T034725Z&X-Amz-Expires=3600&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEDMaDmFwLW5vcnRoZWFzdC0xIkgwRgIhAOp0oWSNw4s79PImse4z7yv3e2Fo7lLyh9Cyrkc%2FytDOAiEA3Nd57Cjhx6PP0HQrvFFzz05asHQ56zjdYvWakFfRDZMqngQIPRABGgw1NTUzMzk4MTQ5NDIiDJArt4ZpyUhCeZPNpyr7A3oU1VWp30lcSjow0sZWQ9QHPAoO61fom8mFxCgR25Pt3BqA3FqGhqsA%2FlKqzsIE0LGmgdKca0HPdpuHmv9cQ%2BD4r%2BH1C5yY0KmVRSaMyUr1izx1dqwHdk1LCL50f7MBv2ieHX6r3ec4F6ZkxJQ3p4DvkD69oEqMhsWcpI2jntrPZSo89QAyRmwTZU%2BcjgD0LBAkfAeGxuhtMYZn0v7kS%2FCYbyBnc5UNaU%2FqcQsH3jPk44P0qfK3%2BGB%2BYlQ91vxlMSL4tY1cHtDoUGReIc8MZbkiS5pRJKA60tprqGuRHjwrBZ2kpoq3CfhvQH%2BLUsrFy5%2BSYh6JsB6DQZtQsyI74cq1nkE5OlkfW7d4o2e0XLGIisIqLJ7EBs8pcKKQeCTZSiL2wOp1NKYNWSXlXLOGZWBdZ6dPNvL6IdVu7ZjIBsbbIUwvSVimcXeuby39F929NZavP7QsMrs8T1ke34EY72LvVDoCA6TdaGArJJuBU6DmqyQ%2FmMT4PAgVqcO9zpuqyBO6qUWnjXk%2BAADzexStomB89XBVSTc%2FjsNPXit%2FeAF2rXwVvkj8BYwcFg1o4nq9mFxvIHFgwOg5KIDgovNzfn0zwbC9ivB8s5Kp%2BhGl99Ln7FIWxSqcaxEfJXv3u8OJ8nyfS6GAQzmBV2Giq12WDmjCUWkxUMADIvme2TCn9oq2BjqlAeu%2FtXdovXWzPehs%2Bgm0WnY2R28vj8bMeoAw5yoPCwuATCkaXFEc6JlLgoLHIpv%2B4SvhXGbsv28bHyt4F%2FMCQwcXD30nRaM0x1VqRFHIda6hUZDH%2By1q5UqQL4jIGVqAt6%2Bubn8HaqGqPmvD%2F9YLKCvt3E9zHokkjGUZMOW9A3pyVsqmBJoXqLQpLfpwmOyx0iIre2G%2Buw2vl0SNuTqdXRmWkociPQ%3D%3D&X-Amz-Signature=0453af73e95fccf1d3f3b1840bc28f243f88b54c2901cdf9ed582d6639451089&X-Amz-SignedHeaders=host&x-id=GetObject)

我们在下面的代码中展示了数组 Vector 的一些常用操作（访问、修改、插入、删除等）。

```rust
fn main() {
let mut v1 = vec![1, 2, 3, 4, 5];

    // 通过 [索引] 直接访问指定位置的元素
    let third: &i32 = &v1[2];
    println!("第三个元素是 {}", third);

    // 通过 .get() 方法访问，防止下标越界
    // match属于模式匹配，后续章节会有详细介绍
    match v1.get(2) {
        Some(third) => println!("第三个元素是 {third}"),
        None => println!("指定的元素不存在"),
    }

    // 迭代访问并修改元素
    for i in &mut v1 {
        // 这里 i 是数组 v 中元素的可变引用，通过 *i 解引用获取到值，并 + 10
        *i += 10
    }
    println!("v1 = {:?}", v1);    // v1 = [11, 12, 13, 14, 15]

    let mut v2: Vec<i32> = vec![1, 2];
    assert!(!v2.is_empty()); // 检查 v2 是否为空
    v2.insert(2, 3); // 在指定索引插入数据，索引值不能大于 v 的长度， v2: [1, 2, 3]
    assert_eq!(v2.remove(1), 2); // 移除指定位置的元素并返回, v2: [1, 3]
    assert_eq!(v2.pop(), Some(3)); // 删除并返回 v 尾部的元素，v2: [1]
    v2.clear(); // 清空 v2, v2: []

}
```
