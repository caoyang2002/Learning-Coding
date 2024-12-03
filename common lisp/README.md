# Lisp 安装

## Lisp 简介

`sbcl`（Steel Bank Common Lisp）和 `clisp`（Common Lisp Interpreter and Server）都是 Common Lisp 的实现，但它们有一些关键的区别：

1. **性能**：
   - `sbcl`：它是一个编译器，注重性能和稳定性。`sbcl`生成的代码通常比其他Lisp实现更快。
   - `clisp`：它是一个解释器和编译器的结合体，可以快速启动和执行代码，但通常在性能上不如`sbcl`。

2. **可移植性**：
   - `sbcl`：它非常注重跨平台兼容性，可以在多种操作系统上运行。
   - `clisp`：它也是跨平台的，但由于它的设计，某些特性可能在不同的系统上有所不同。

3. **特性**：
   - `sbcl`：它有一个模块化的架构，支持多种操作系统和硬件平台。它还提供了一个强大的调试器和优化器。
   - `clisp`：它包含了一个内置的编辑器、一个交互式环境和一个网络服务器。它也支持C语言的外部函数接口。

4. **社区和文档**：
   - `sbcl`：它有一个活跃的社区，提供了大量的文档和资源。
   - `clisp`：它的社区相对较小，但仍然有一群忠实的用户和开发者。

5. **用途**：
   - `sbcl`：由于其性能优势，它通常被用于需要高性能的应用程序。
   - `clisp`：由于其快速启动和交互式特性，它经常被用于原型开发、脚本编写和教育。

6. **编译策略**：
   - `sbcl`：它提供了一个即时编译器，可以在运行时编译代码。
   - `clisp`：它既可以解释代码，也可以编译代码，这使得它可以在不预先编译的情况下快速执行代码。

7. **模块系统**：
   - `sbcl`：它遵循了 Common Lisp 的标准模块系统。
   - `clisp`：它有自己的模块系统，虽然它也支持标准模块系统。

8. **扩展性**：
   - `sbcl`：它允许用户通过 C 语言扩展 Lisp 代码。
   - `clisp`：它同样支持 C 语言扩展，并且由于其内置的编辑器和服务器，它在某些类型的应用程序中可能更容易扩展。

这里的 Lisp 主要是指 common lisp 和 scheme。

common lisp wiki 上给出了很多免费的 implementations，如：Armed Bear Common Lisp (ABCL) ，Clozure CL(CCL), Embeddable Common Lisp(ECL), Steel Bank Common Lisp (SBCL) 。

# 快速安装

## Steel Bank Common Lisp (SBCL)

安装

```bash
brew install sbcl
```

执行某个文件

```bash
sbcl --script fileName.lisp
```

获取帮助

```bash
sbcl --help
```

练习 common lisp 的时候，想试试在终端运行指令，类似 mit-scheme，发现 sbcl 没那么顺手，改用 clisp。

安装:
```bash
brew install clisp
```

安装后，终端直接 clisp， 进入交互环境。

使用 `(exit)` 或者 `(quit)` 退出 clisp。

执行某个文件

```bash
clisp fileName.lisp
```

获取帮助

```bash
clisp --help
```

## Scheme

参考 mit-scheme, 下载 MIT-scheme:

对于Mac OS version 10.14 +，请不要直接在mit-scheme下载适用于Mac OS 10.13的安装包，会坑得人莫名其妙……

使用 Homebrew

```bash
brew install mit-scheme
```

安装完成后，终端输入

```bash
mit-scheme
```

进入 scheme 交互环境:



使用 `(exit)` 或者 `(quit)` 退出 scheme。

执行某个文件：

```bash
scheme < FILENAME
```

获取帮助

```bash
scheme --help
```

# MAC 一般安装

在 macOS 上安装 Common Lisp 的两种流行实现，即 `clisp` 和 `sbcl`，可以通过以下几种方法进行：

### 使用 Homebrew 安装

Homebrew 是 macOS 上的一个包管理器，它可以简化安装过程。如果你还没有安装 Homebrew，可以从它的官方网站（https://brew.sh/）获取安装指令。

1. **安装 Homebrew**：
   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **使用 Homebrew 安装 CLISP**：
   ```sh
   brew install clisp
   ```

3. **使用 Homebrew 安装 SBCL**：
   ```sh
   brew install sbcl
   ```

安装完成后，你可以通过在终端中输入 `clisp` 或 `sbcl` 来启动相应的 Lisp 环境。

### 使用官方源代码安装

如果你想要安装最新版本，或者 Homebrew 中的版本不符合你的需求，你可以直接从官方源代码编译安装。

1. **下载源代码**：
   - 访问 `clisp` 的官方网站下载源代码：[CLISP Download](http://clisp.org/download.html)
   - 访问 `sbcl` 的官方网站下载源代码：[SBCL Download](http://www.sbcl.org/platform-table.html)

2. **编译和安装**：
   - 解压下载的源代码压缩包。
   - 打开终端，切换到解压后的目录。
   - 通常，你可以使用 `./configure` 来配置，然后使用 `make` 来编译，最后使用 `sudo make install` 来安装。

   示例命令：
   ```sh
   ./configure
   make
   sudo make install
   ```

### 使用 Quicklisp

Quicklisp 是一个 Common Lisp 的软件仓库和包管理系统，它可以帮助你管理和安装 Lisp 库。

1. **安装 Quicklisp**：
   
   - 在 `clisp` 或 `sbcl` 的 REPL 中，你可以使用以下命令安装 Quicklisp：
     ```lisp
     (require 'asdf)
     (require 'quicklisp)
     (quicklisp-quickstart:install)
     (ql:add-to-init-file)
     ```
   
2. **加载 Quicklisp**：
   - 每次启动 Lisp 时，你需要加载 Quicklisp：
     ```lisp
     (require 'quicklisp)
     (quicklisp:quickload "quicklisp")
     ```

---
要编写和测试 Common Lisp 代码，你可以使用任何文本编辑器创建一个 `.lisp` 文件，然后使用 `clisp` 或 `sbcl` 命令行工具来运行它。以下是一些基本的步骤和示例，用于在 CLISP 和 SBCL 中编写和测试简单的 Common Lisp 程序。

### 1. 编写一个简单的 Common Lisp 程序

创建一个名为 `hello-world.lisp` 的文件，然后添加以下内容：

```lisp
;; 定义一个函数来打印问候语
(defun print-hello ()
  (format t "Hello, World!~%"))

;; 调用函数
(print-hello)
```

### 2. 使用 CLISP 运行程序

1. 打开终端。
2. 导航到包含 `hello-world.lisp` 文件的目录。
3. 运行以下命令：

```sh
clisp hello-world.lisp
```

如果一切正常，你应该在终端看到输出 "Hello, World!"。

### 3. 使用 SBCL 运行程序

1. 打开终端。
2. 导航到包含 `hello-world.lisp` 文件的目录。
3. 运行以下命令：

```sh
sbcl --load hello-world.lisp
```

同样，如果一切正常，你应该在终端看到输出 "Hello, World!"。

### 4. 编写一个更复杂的测试案例

创建一个名为 `factorial.lisp` 的文件，然后添加以下内容：

```lisp
;; 定义一个递归函数来计算阶乘
(defun factorial (n)
  (if (zerop n)
      1
      (* n (factorial (- n 1)))))

;; 测试阶乘函数
(defun test-factorial ()
  (assert (= (factorial 0) 1))
  (assert (= (factorial 1) 1))
  (assert (= (factorial 2) 2))
  (assert (= (factorial 3) 6))
  (assert (= (factorial 4) 24))
  (format t "All tests passed.~%"))

;; 调用测试函数
(test-factorial)
```

### 5. 使用 CLISP 运行测试案例

1. 打开终端。
2. 导航到包含 `factorial.lisp` 文件的目录。
3. 运行以下命令：

```sh
clisp factorial.lisp
```

如果所有测试都通过，你应该在终端看到输出 "All tests passed."。

### 6. 使用 SBCL 运行测试案例

1. 打开终端。
2. 导航到包含 `factorial.lisp` 文件的目录。
3. 运行以下命令：

```sh
sbcl --load factorial.lisp
```

同样，如果所有测试都通过，你应该在终端看到输出 "All tests passed."。
