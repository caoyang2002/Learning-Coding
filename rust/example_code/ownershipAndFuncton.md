所有权可以转移给函数，在移动期间，所有者的堆栈值将会被复制到函数调用的参数堆栈中。

```rust
struct Foo {
    x: i32,
}

fn do_something(f: Foo) {
    println!("{}", f.x);
    // f 在这里被 dropped 释放
}

fn main() {
    let foo = Foo { x: 42 };
    // foo 被移交至 do_something
    do_something(foo);
    // 此后 foo 便无法再被使用
}
```

当然，也可以从函数中获取所有权：

```rust
fn do_something() -> Foo {
    Foo { x: 42 }
    // 所有权被移出
}

fn main() {
    let foo = do_something();
    // foo 成为了所有者
    // foo 在函数域结尾被 dropped 释放
}
```

FAQ
Q：什么是分级释放？
A：我们以结构体为例，删除一个结构体时，结构体本身会先被释放，紧接着才分别释放相应的子结构体并以此类推。

```rust
struct Bar {
    x: i32,
}

struct Foo {
    bar: Bar,
}

fn main() {
    let foo = Foo { bar: Bar { x: 42 } };
    println!("{}", foo.bar.x);
    // foo 首先被 dropped 释放
    // 紧接着是 foo.bar
}
```

示例代码

在发生了可变借用后，一个资源的所有者便不可以再次被借用或者修改。此举是为了避免潜在的数据争用（data race）。

```rust
struct Foo {
    x: i32,
}

fn do_something(f: Foo) {
    println!("{}", f.x);
    // f 在这里被 dropped 释放
}

fn main() {
    let mut foo = Foo { x: 42 };
    let f = &mut foo;

    // 会报错: do_something(foo);
    // 因为 foo 已经被可变借用而无法取得其所有权

    // 会报错: foo.x = 13;
    // 因为 foo 已经被可变借用而无法被修改

    f.x = 13;
    // f 会因为此后不再被使用而被 dropped 释放

    println!("{}", foo.x);

    // 现在修改可以正常进行因为其所有可变引用已经被 dropped 释放
    foo.x = 7;

    // 移动 foo 的所有权到一个函数中
    do_something(foo);
}
```
