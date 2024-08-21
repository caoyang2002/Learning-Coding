# This is a RUST project

## learning

```bash
cargo run # 运行项目
```

## 官方网站

- [https://www.rust-lang.org](https://www.rust-lang.org/)
- [rustlang@twitter](https://twitter.com/rustlang)

## 社区

- [Rust 官方社区](https://www.rust-lang.org/community)
- [Rust 官方社区的中文区](https://www.rust-lang.org/zh-CN/):
- [Rust 中文](https://rustlang-cn.org/)：非常新的 Rust 社区，有很多内容，而且更新维护很给力。
- [Lib.rs](https://lib.rs/): 含有 67000 个 Rust 库和应用程序的索引。快速、轻量级、有观点、非官方的 crates.io 替代品。

## 文档

- [标准库 API 文档](https://doc.rust-lang.org/std/)
- [Rust Reference](https://doc.rust-lang.org/reference/index.html): Rust reference 文档，有中文翻译版本 [Rust 语言规范](https://rustlang-cn.org/office/rust/reference/) 正在翻译过程中
- [Rust 编译错误索引](https://doc.rust-lang.org/error-index.html)：发生编译错误时，可以通过索引找到具体错误解释
- [rustdoc 文档](https://doc.rust-lang.org/rustdoc/): `restdoc`工具的使用文档
- [Rustonomicon](https://doc.rust-lang.org/reference/): rust 的参考文档。但是目前并不完整，可能有遗漏和错误
- [Unstable Book](https://doc.rust-lang.org/unstable-book/): 用于尚不稳定特性的文档
- [Rustonomicon](https://doc.rust-lang.org/nomicon/): unsafe rust 的黑暗艺术，有中文翻译版本 [Rust 高级编程](https://rustlang-cn.org/office/rust/advrust/)
- [The Cargo Book](https://doc.rust-lang.org/cargo/index.html): cargo 使用介绍，有中文翻译版本 [Cargo 教程](https://rustlang-cn.org/office/rust/cargo/) 正在进行中
- [Rust Edition Guide](https://doc.rust-lang.org/nightly/edition-guide/introduction.html): Rust 版本指南，传递 Rust 不同版本之间大的变更信息
- [Command line apps in Rust](https://rust-lang-nursery.github.io/cli-wg/#command-line-apps-in-rust): 在 Rust 中编写命令行程序

Rust 中文网站有一个 Rust 官方书籍的汇总页面：

https://rustlang-cn.org/office/rust/

## 书籍

rust 中文社区有个资源收集项目，里面有不少好书：

https://github.com/rustlang-cn/resourses/tree/master/books

### The Rust Programming Language

官方书籍"The Rust Programming Language", 有[第一版](https://doc.rust-lang.org/stable/book/first-edition/)和[第二版](https://doc.rust-lang.org/stable/book/index.html)。其中第一版已经过时，第二版几乎是重写。这本书网上有电子版可以[下载](http://www.allitebooks.com/the-rust-programming-language/)。

“The Rust Programming Language"中文翻译版本, [第一版翻译](https://kaisery.gitbooks.io/rust-book-chinese/content/)和[第二版翻译](https://rustlang-cn.org/office/rust/book/)。

是目前非常好的的 Rust 入门书籍。

### Rust 异步编程

翻译自自官方[async-book](https://rust-lang.github.io/async-book/)

### Rust by Example

这本书的内容非常不错，强烈推荐给入门读者。就是内容稍微老了点。

- [英文版在线阅读](https://rustbyexample.com/index.html)
- [英文版本仓库](https://github.com/rust-lang/rust-by-example)
- [中文翻译版在线阅读](https://rustwiki.org/zh-CN//rust-by-example/)
- [中文翻译版仓库](https://github.com/rust-lang-cn/rust-by-example-cn): 最后更新时间：2017-10-03

## 资源

### Awesome Rust

https://github.com/rust-unofficial/awesome-rust

最齐全的 Rust 资料列表

Rust 中文社区的 Awesome Rust：

https://rustlang-cn.org/resourse/awesome/

### 值得新手关注的 Rust 项目

适用于新手学习 rust 的项目有：

- [mini redis](https://github.com/tokio-rs/mini-redis)
- [async-graphql](https://github.com/sunli829/async-graphql)

### 资源介绍文章

- [一些有用的关于 Rust 的网站和 repo](https://dengjianping.github.io/2019/06/12/一些有用的关于Rust的网站和repo.html)

# 命令

---

这个列表包含了大部分 Cargo 提供的命令，涵盖了从项目创建到开发、测试、文档生成、安全审核、代码格式化和发布的各个方面。这些命令的完整细节和更多选项可以在 Cargo 的官方文档或相应的第三方文档中找到。

| 命令              | 作用                                  | 示例                           |
| ----------------- | ------------------------------------- | ------------------------------ |
| `cargo new`       | 创建一个新的 Rust 项目                | `cargo new my_project`         |
| `cargo build`     | 编译项目和其依赖                      | `cargo build --release`        |
| `cargo run`       | 编译并运行 Rust 项目                  | `cargo run`                    |
| `cargo test`      | 运行项目的测试                        | `cargo test`                   |
| `cargo doc`       | 为项目的依赖生成文档                  | `cargo doc --open`             |
| `cargo update`    | 更新 `Cargo.lock` 文件中的依赖版本    | `cargo update`                 |
| `cargo check`     | 快速检查代码能否编译                  | `cargo check`                  |
| `cargo clean`     | 清除编译生成的文件                    | `cargo clean`                  |
| `cargo publish`   | 将包发布到 crates.io                  | `cargo publish`                |
| `cargo bench`     | 运行基准测试                          | `cargo bench`                  |
| `cargo fetch`     | 下载项目依赖的 crate，但不进行编译    | `cargo fetch`                  |
| `cargo install`   | 安装和管理 Rust 二进制文件            | `cargo install [crate_name]`   |
| `cargo uninstall` | 卸载通过 Cargo 安装的 Rust 二进制文件 | `cargo uninstall [crate_name]` |
| `cargo package`   | 准备一个本地 crate 以便发布           | `cargo package`                |
| `cargo search`    | 在 crates.io 上搜索 crate             | `cargo search [search_query]`  |
| `cargo login`     | 使用 API token 登录 crates.io         | `cargo login [token]`          |
| `cargo owner`     | 管理 crate 的所有者                   | `cargo owner --add [username]` |
| `cargo init`      | 在现有目录中初始化新的 Rust 项目      | `cargo init my_project`        |
| `cargo version`   | 显示 Cargo 的版本信息                 | `cargo version`                |
| `cargo vendor`    | 将所有依赖复制到本地目录              | `cargo vendor`                 |
| `cargo metadata`  | 输出 JSON 格式的项目元数据            | `cargo metadata`               |
| `cargo tree`      | 显示项目依赖树                        | `cargo tree`                   |
| `cargo fix`       | 自动修复 Rust 代码中的警告            | `cargo fix`                    |
| `cargo audit`     | 审核 Cargo.lock 以查找不安全的依赖    | `cargo audit`                  |
| `cargo rustc`     | 提供对 rustc 编译器参数的访问         | `cargo rustc -- [options]`     |
| `cargo rustdoc`   | 为项目运行 rustdoc 工具               | `cargo rustdoc -- [options]`   |
| `cargo clippy`    | 运行 clippy 来进行代码审查            | `cargo clippy`                 |
| `cargo fmt`       | 使用 rustfmt 格式化代码               | `cargo fmt`                    |
| `cargo miri`      | 运行 miri 以执行内存安全检查          | `cargo miri test`              |
| `cargo outdated`  | 检查过时的依赖                        | `cargo outdated`               |
| `cargo release`   | 自动化 crate 发布流程                 | `cargo release`                |
| `cargo add`       | 向 Cargo.toml 添加新依赖              | `cargo add [crate_name]`       |
| `cargo rm`        | 从 Cargo.toml 中移除依赖              | `cargo rm [crate_name]`        |
| `cargo upgrade`   | 升级 Cargo.toml 的依赖版本            | `cargo upgrade [crate_name]`   |

请注意，一些命令如 `cargo audit`, `cargo clippy`, `cargo fmt`, `cargo miri`, `cargo outdated`, `cargo release`, `cargo add`, `cargo rm`, 和 `cargo upgrade` 实际上是由第三方提供的 Cargo 扩展（也称为 "cargo 子命令"），并可能需要单独安装。

---

https://skyao.io/learning-rust/docs/build/rustc/conditional-compilation/

# Rustc 的命令行参数

Rustc 的命令行参数

> 英文原文地址： https://doc.rust-lang.org/rustc/command-line-arguments.html

这是 `rustc` 的命令行参数列表和他们的功能介绍：

### `-h`/`--help`： 帮助

该标志将打印出`rustc`的帮助信息。

### `--cfg`：配置编译环境

此标志可以打开或关闭各种`#[cfg]`设置。

该值可以是单个标识符，也可以是由`=`分隔两个标识符。

举例，`--cfg 'verbose'` 或者 `--cfg 'feature="serde"'`。分别对应`#[cfg(verbose)]`和`#[cfg(feature = "serde")]`。

### `-L`：将目录添加到库搜索路径

查找外部 crate 或库时，将搜索传递到此标志的目录。

搜索路径的类型可以通过 `-L KIND=PATH` 方式制定，这是可选的，其中 KIND 可以是以下之一：

- `dependency` —仅在此目录中搜索传递依赖项。
- `crate` —仅在此目录中搜索此 crate 的直接依赖项。
- `native` —仅在此目录中搜索原生类库。
- `framework` —仅在此目录中搜索 macOS 框架。
- `all`—在此目录中搜索所有库类型。这是 KIND 未指定时的默认值。

### `-l`：将生成的包链接到一个原生库

使用此标志可以在构建 crate 时指定链接到特定的原生库。

可以使用以下形式之一指定库的类型，-l KIND=lib 其中 KIND 可以是：

类库的类型可以通过 `-l KIND=lib` 方式制定，这是可选的，其中 KIND 可以是以下之一：

- `dylib` — 原生动态库。
- `static`— 原生静态库（例如.a 包）。
- `framework` — macOS 框架。

可以在 `#[link]` 属性中指定库的类型。如果未在 link 属性或命令行中指定种类，它将链接动态库（如果可用），否则将使用静态库。如果在命令行上指定了种类，它将覆盖 link 属性中指定的种类。

在 link 属性中使用的 name 可以用 “-l ATTR_NAME:LINK_NAME” 的形式来覆盖，其中 `ATTR_NAME` 是在 link 属性的 name ，而 `LINK_NAME` 是将被链接的实际库的名称。

### `--crate-type`：编译器生成包的类型列表

指示 rustc 要构建的 crate 类型。该标志接受逗号分隔的值列表，并且可以多次指定。有效的 crate 类型为：

- `lib`—生成编译器首选的库类型，当前默认为 `rlib`。
- `rlib` — Rust 静态库。
- `staticlib` —原生静态库。
- `dylib` — Rust 动态库。
- `cdylib` —原生动态库。
- `bin` —可运行的可执行程序。
- `proc-macro` —生成适合于程序宏类库的格式，该格式可由编译器加载。

crate 类型可以使用 `crate_type` 属性指定。该 `--crate-type` 命令行值将覆盖 `crate_type` 属性。

可以在参考文档的 [linkage 章节](https://doc.rust-lang.org/reference/linkage.html) 中找到更多详细信息。

### `--crate-name`：指定构建的 crate 的名称

告诉`rustc` crate 的名称。

### `--edition`：指定要使用的版本

此标志的值为 2015 或 2018。默认值为 2015。有关版本的更多信息，请参见 [版本指南](https://doc.rust-lang.org/edition-guide/introduction.html)。

### `--emit`：指定要生成的输出文件的类型

该标志控制编译器生成的输出文件的类型。接受逗号分隔的值列表，并且可以多次指定。有效的生成种类有：

- `asm`—生成带有 crate 的汇编代码的文件。默认输出文件名是`CRATE_NAME.s`。
- `dep-info`—生成具有 Makefile 语法的文件，该文件指示已经加载用来生成 crate 的所有源文件。默认输出文件名是`CRATE_NAME.d`。
- `link`—生成由`--crate-type`指定的 crate。默认输出文件名取决于 crate 类型和平台。这是 `--emit`未指定时的默认值。
- `llvm-bc`—生成包含 LLVM 字节码的二进制文件。默认输出文件名是`CRATE_NAME.bc`。
- `llvm-ir`—生成包含 LLVM IR 的文件。默认输出文件名是`CRATE_NAME.ll`。
- `metadata`—生成包含有关 crate 元数据的文件。默认输出文件名是`CRATE_NAME.rmeta`。
- `mir`—生成包含 rustc 的中等中间表示形式(mid-level intermediate representation)的文件。默认输出文件名是`CRATE_NAME.mir`。
- `obj`—生成原生目标文件。默认输出文件名是 `CRATE_NAME.o`。

可以使用 `-o` 标志设置输出的文件名。可以使用 `-C extra-filename` 标志添加后缀到文件名中。除非使用该 `--out-dir` 标志，否则文件将被写入当前目录。每种生成类型还可以使用`KIND=PATH`形式来指定输出的文件名，该文件名优先于`-o`标志。

### `--print`：打印编译器信息

该标志输出有关编译器的各种信息。可以多次指定此标志，并按照指定标志的顺序打印信息。指定`--print`标志通常将禁用 `--emit`步骤，并且只会打印所请求的信息。有效的打印值类型为：

- `crate-name` — crate 的名称。
- `file-names`—由`link` 生成种类创建的文件的名称。
- `sysroot` — sysroot 的路径。
- `cfg`— CFG 值列表。有关 cfg 值的更多信息，请参见[条件编译](https://skyao.io/learning-rust/docs/build/rustc/command-line-arguments/conditional-compilation.md)。
- `target-list`—已知目标列表。可以使用`--target`标志选择目标 。
- `target-cpus`—当前目标的可用 CPU 值列表。可以使用该`-C target-cpu=val`标志选择目标 CPU 。
- `target-features`—当前目标的可用目标功能列表。可以使用该`-C target-feature=val` 标志启用目标功能。该标志是不安全的。有关更多详细信息，请参见[已知问题](https://doc.rust-lang.org/rustc/targets/known-issues.html)。
- `relocation-models`—重定位模型列表。可以使用`-C relocation-model=val`标志选择重定位模型。
- `code-models`—代码模型列表。可以使用`-C code-model=val`标志选择代码模型 。
- `tls-models`—支持的线程本地存储(Thread Local Storage)模型列表。可以通过`-Z tls-model=val`标志选择模型。
- `native-static-libs`—在创建`staticlib` crate 类型时可以使用它。如果这是唯一标志，它将执行完整编译并包含诊断说明，该诊断说明指示在链接生成的静态库时要使用的链接器标志。该注释以文本开头， `native-static-libs:`以使其更容易获取输出。

### `-g`：包括调试信息

`-C debuginfo=2`的同义词，更多信息请参见[这里](https://doc.rust-lang.org/rustc/codegen-options/index.html#debuginfo)。

### `-O`：优化代码

`-C opt-level=2`的同义词，更多信息请参见[这里](https://doc.rust-lang.org/rustc/codegen-options/index.html#opt-level)。

### `-o`：输出的文件名

该标志控制输出文件名。

### `--out-dir`：写入输出的目录

输出的 crate 将被写入此目录。如果`-o`标志被使用，则忽略此标志。

### `--explain`：提供错误消息的详细说明

`rustc`的每个错误都带有错误代码；这将打印出给定错误的详细说明。

### `--test`：建立测试工具

编译此 crate 时，`rustc`将忽略`main`函数，而是产生一个测试工具。

### `--target`：选择要构建的目标三元组

这可以控制要生产的[目标](https://doc.rust-lang.org/rustc/targets/index.html)。

### `-W`：设置 lint warnings

此标志将设置应将哪些 lint 设置为 warn 级别 。

### `-A`：设置 lint allowed

此标志将设置应将哪些 lint 设置为 allow 级别 。

### `-D`：设置 lint denied

此标志将设置应将哪些 lint 设置为 deny 级别 。

### `-F`：设置 lint forbidden

此标志将设置应将哪些 lint 设置为 forbid 级别 。

### `-Z`：设置不稳定的选项

此标志将允许您设置 rustc 的不稳定选项。为了设置多个选项，`-Z`标志可以多次使用。例如：`rustc -Z verbose -Z time`。使用`-Z`指定选项仅在 nightly 中可用。要查看所有可用选项，请运行：`rustc -Z help`。

### `--cap-lints`：设置最严格的 lint 等级

此标志使您可以“限制”lint，有关更多信息，[请参见此处](https://doc.rust-lang.org/rustc/lints/levels.html#capping-lints)。

### `-C`/ `--codegen`：代码生成选项

此标志将允许您设置[代码生成选项](https://doc.rust-lang.org/rustc/codegen-options/index.html)。

### `-V`/ `--version`：打印版本

此标志将打印出`rustc`的版本。

### `-v`/ `--verbose`：使用详细输出

与其他标志结合使用时，该标志将产生额外的输出。

### `--extern`：指定外部库的位置

此标志允许您传递将链接到要构建的 crate 的外部 crate 的名称和位置。可以多次指定此标志。值的格式应为`CRATENAME=PATH`。

### `--sysroot`：覆盖系统根目录

“ sysroot”是`rustc`寻找 Rust 发行版附带的 crate 的地方。该标志允许它被覆盖。

### `--error-format`：控制错误的产生方式

该标志使您可以控制消息的格式。消息将打印到 stderr。有效选项是：

- `human`—可读的输出。这是默认值。
- `json`—结构化 JSON 输出。有关更多详细信息，请参见[JSON 章节](https://doc.rust-lang.org/rustc/json.html)。
- `short` —短的单行消息。

### `--color`：配置输出的颜色

此标志使您可以控制输出的颜色设置。有效选项是：

- `auto`—如果输出发送到 tty，则使用颜色。这是默认值。
- `always` —始终使用颜色。
- `never` —切勿使输出着色。

### `--remap-path-prefix`：在输出中重新映射源名称

在所有输出中重新映射源路径前缀，包括编译器诊断，调试信息，宏扩展等。它从`FROM=TO`形式中获取值， 其中路径前缀等于`FROM`的 value 被重写为 `TO`的 value。在`FROM`自身也可以包含一个`=`符号，但`TO`价值不得。可以多次指定此标志。

这对于标准化生成产品很有用，例如通过从发出到目标文件中的路径名中删除当前目录。替换纯文本形式，不考虑当前系统的路径名语法。例如`--remap-path-prefix foo=bar`将匹配`foo/lib.rs`但不匹配 `./foo/lib.rs`。

### `--json`：配置编译器打印的 json 消息

当`--error-format=json`选项传递给 rustc 时，所有编译器的诊断输出将以 JSON blob 的形式发出。该 `--json`参数可与一起使用，`--error-format=json`以配置 JSON Blob 包含的内容以及发出的 JSON Blob。

使用`--error-format=json`编译器时，始终会以 JSON blob 的形式发出任何编译器错误，但是该`--json`标志还可以使用以下选项来自定义输出：

- `diagnostic-short`-诊断消息的 json blob 应该使用“简短”呈现，而不是常规的“人为”呈现。这意味着的输出 `--error-format=short`将嵌入到 JSON 诊断程序中，而不是默认的`--error-format=human`。
- `diagnostic-rendered-ansi`-默认情况下，其`rendered`字段中的 JSON Blob 将包含诊断的纯文本呈现。该选项改为指示诊断程序应具有嵌入的 ANSI 颜色代码，该颜色代码打算用于 rustc 通常已经用于终端输出的方式来对消息进行着色。请注意，此选项可与板条箱有效地结合使用，例如 `fwdansi`将 Windows 上的这些 ANSI 代码转换为控制台命令，或者 `strip-ansi-escapes`如果您以后希望有选择地去除 ansi 颜色的话。
- `artifacts`-这指示 rustc 为每个发出的工件发出 JSON Blob。工件与`--emit`CLI 参数中的请求相对应，并且该工件在文件系统上可用时，将立即发出通知。

请注意，它是无效的结合`--json`论点与`--color` 论据，并且需要结合起来`--json`使用`--error-format=json`。

有关更多详细信息，请参见[JSON 章节](https://doc.rust-lang.org/rustc/json.html)。

### `@path`：从路径加载命令行标志

如果`@path`在命令行上指定，则它将打开`path`并从中读取命令行选项。这些选项是每行一个。空行表示空选项。该文件可以使用 Unix 或 Windows 样式的行尾，并且必须编码为 UTF-8。
