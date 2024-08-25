# Anchor CLI 基本指令（一）

Content

在上一课中，我们了解到 Anchor 是 Solana 区块链上构建和部署程序（智能合约）的框架，它提供了一组工具和库，简化了智能合约的开发过程。在开始之前，我们需要先完成安装工作。Anchor 本身是 Rust 写的 Solana 开发框架，同时也支持前端项目，因此它的安装涉及到一系列的依赖，比如 Rust、Solana、Yarn，在完成依赖的安装后，再安装 Anchor 版本管理工具(Anchor Version Manager) avm，如果你熟悉 Nodejs，他就像管理 nodejs 版本的 nvm。 通过 avm，我们能更加灵活的使用和管理 Anchor。安装指南可以看这里。接下来我们介绍下使用 Anchor 框架进行程序开发的常用指令。

常用指令

1、创建新项目：这个命令用于创建一个新的 Anchor 项目，包含了 demo 代码，你可以用自己的项目名称替换 my_project 。

```sh
anchor init my_project
```

2、构建新的程序（智能合约）：这个命令用于构建和编译程序。它会在 target/deploy 目录下生成编译后的合约二进制文件。如果在项目目录下可以省略项目名称。

```sh
anchor build [my_project]
```

3、测试程序逻辑：运行这个命令会执行程序的测试套件，确保程序的功能正常。

```sh
anchor test
```

4、部署程序到指定网络：Solana 的 devnet 是一个专门用于开发和测试的网络，通常我们会把项目先部署在本地或者开发测试网进行验证，验证通过后部署到主网 mainnet-beta。

```sh
// 部署到开发测试网
anchor deploy --env devnet
// 部署到主网
anchor deploy --env mainnet-beta
项目目录结构
创建完项目 my_project 后，我们进入 my_project 文件夹， 可以看到 Anchor 自动生成的文件和目录：
my_project/
├── Anchor.toml
├── programs/
│ └── my_program/
│ ├── Cargo.toml
│ ├── src/
│ │ └── lib.rs
│ └── tests/
│ └── program_test.rs
├── target/
└── tests/
└── integration_test.rs
```

这是一个简化的结构，提供了一个基本的框架，使你能够开始编写、测试和部署程序。在具体的项目中，你可能需要根据需求添加其他文件和目录，例如配置文件、文档等。以下是一些关键文件和目录的说明：

● Anchor.toml： 项目的配置文件，包含项目的基本信息、依赖关系和其他配置项。

● programs 目录： 包含你的程序的目录。在这个例子中，有一个名为 my_program 的子目录。

● Cargo.toml： 程序的 Rust 项目配置文件。

● src 目录： 包含实际的程序代码文件，通常是 lib.rs，在实际的项目中我们会根据模块划分，拆的更细。

● tests 目录： 包含用于测试程序的测试代码文件。

● target 目录： 包含构建和编译生成的文件。

● tests 目录： 包含整合测试代码文件，用于测试整个项目的集成性能。

让我们一起来创建一个名为 my_first_project 的新 Solana 项目。

# Anchor CLI 基本指令（二）

Content

这一节我们继续来学习 Anchor 的基本指令。由于 Anchor 的指令非常多，想要把这些指令全部记住是很困难的，不过我们可以先学习下 help 指令，并用它来获取相关子指令的详细信息。

一、help 帮助指令

打印出所有可用命令的列表：anchor help

```bash
anchor help

available commands:
  init      初始化一个工作空间。
  build     构建整个工作空间。
  expand    展开宏（cargo expand 的包装）。
  verify    验证链上字节码是否与本地编译的构件匹配。在程序子目录中运行此命令，即包含程序的 Cargo.toml 文件的目录。
  test      在本地网络运行集成测试。
  new       创建一个新的程序。
  idl       与接口定义语言（IDL）交互的命令。
  clean     从目标目录中删除除程序密钥对之外的所有构建产物。
  deploy    部署工作空间中的每个程序。
  migrate   运行部署迁移脚本。
  upgrade   部署、初始化接口定义并一次性迁移所有内容的命令。升级单个程序。配置的钱包必须是升级权限。
  cluster   集群命令。
  shell     启动一个带有 anchor 客户端设置的节点 shell。
  run       运行由当前工作空间的 anchor.toml 定义的脚本。
  login     将来自注册表的 API 令牌保存到本地。
  publish   将经过验证的构建发布到 anchor 注册表。
  keys      密钥对命令。
  localnet  本地网络命令。
  account   使用提供的接口定义获取并反序列化帐户。
  help      打印此消息或给定子命令的帮助信息。
```

打印给定子命令的帮助信息：`anchor help [subcommand]`。例如，如果你想获取有关 deploy 命令的帮助信息，可以执行以下命令：

```bash
anchor help deploy
```

这将显示关于 deploy 命令的用法、选项和示例。帮助信息通常包括有关如何正确使用命令的说明，以及可用选项的详细描述。帮助命令是理解和学习 Anchor 框架的重要工具，因为它提供了有关每个命令的详细信息，帮助你正确使用这些命令来开发和管理 Solana 上的程序。
二、anchor init 和 anchor new 有什么区别？
它们都是用于创建 Anchor 项目的命令，但它们有不同的目的和用法：

1.  anchor init ：初始化工作空间，该命令会创建一个包含基本项目结构和配置文件的工作空间。你需要指定一个工作空间的名称，例如 anchor init my_workspace 中的 my_workspace。
2.  anchor new：创建新程序，创建一个新的 Anchor 程序（智能合约），包括相关的目录和文件。你需要指定一个程序的名称，例如 anchor new my_program 中的 my_program。
    通常，你会首先使用 anchor init 初始化一个工作空间，然后使用 anchor new 在该工作空间中创建一个或多个程序。
    三、anchor verify 指令有什么作用？
    该指令用于验证链上部署的程序的字节码是否与本地编译的构件（artifact）匹配。这个命令通常在开发者部署程序到 Solana 区块链之后使用，以确保链上的合约与本地开发环境中的代码一致。在使用这个命令时，你需要在包含程序程序的目录中运行，即包含程序的 Cargo.toml 文件的目录。执行 anchor verify 会比较链上合约的字节码和本地编译的构件，确保它们一致。验证的过程通常包括以下步骤：
3.  检查链上合约的程序 ID 是否与本地编译的程序 ID 一致。
4.  对比链上合约的字节码和本地编译的构件，确保它们相匹配。
    通过这个命令，开发者可以确保在本地开发环境中编写的合约与实际部署到链上的合约是一致的，减少了由于编译或其他环境问题引起的潜在错误。
    四、anchor upgrade 指令有什么作用？
    该命令是用于一次性升级程序的命令。它的作用是部署、初始化接口定义（IDL），并将执行所有迁移的过程集成在一起。这个命令通常用于升级一个单独的程序，而不是整个工作空间。这个命令会执行以下步骤：
5.  部署最新版本的程序：意味着将程序的最新版本上传到 Solana 区块链网络上，并在链上创建一个新的程序实例。这个过程涉及将新的程序二进制文件部署到链上，以便替换先前部署的程序版本。
6.  初始化接口定义（IDL）：IDL 是一种描述程序接口的语言，用于定义合约的数据结构、方法和事件。初始化接口定义的过程是将这些接口定义部署到链上，以便客户端能够与程序进行交互，并能够正确地解析合约的数据结构和方法。
7.  执行所有必要的迁移脚本：迁移脚本是用于在合约升级或修改时执行的脚本。它包含了在链上执行的逻辑，例如更新存储结构、迁移数据等。迁移脚本的目的是确保链上合约状态的平滑过渡，使新版本的合约能够与旧版本兼容。
    Quiz 1/2

如何查看 migrate 指令的详细信息？
01
Type your answer here
02
Show Answer
(-10coin)

Submit
