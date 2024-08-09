wat2wasm: https://webassembly.github.io/wabt/demo/wat2wasm/

WebAssembly

https://gitlab.com/yzzyyzzy/wasm-ts

https://rustwasm.github.io/docs/book/introduction.html

# Start

## 创建 WebAssembly 项目

1. 安装 rust
2. 安装 node
3. 创建 rust 项目 `cargo new --lib wasm_game`
4. 创建 www 目录，进入 www 后执行以下命令：
   1. `npm init -y`
   2. `npm install -save-dev webpack-dev-server`
   3. `npm install --save webpack-cli`
   4. `npm install --save copy-webpack-plugin`

### 前端文件

1. 创建 www/public 文件夹
2. 创建并编辑 www/index.html 文件

```js
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>First wasm</title>
  <script src="index.js"></script>
</head>

<body>
  <h1>Hello wasm!</h1>
  <script src="index.js"></script>
</body>

</html>
```

3. 创建并编辑 www/index.js 文件

```js
console.log('hello, world!')
```

## 创建并编辑 `webpack.config.js` 文件

```js
const path = require('path')
const CopyWebpackPlugin = require('copy-webpack-plugin')

module.exports = {
  entry: './index.js',
  output: {
    path: path.resolve(__dirname, 'public'),
    filename: 'index.js',
  },
  mode: 'development',

  plugins: [
    new CopyWebpackPlugin({
      patterns: [{ from: './index.html', to: './' }],
    }),
  ],
}
```

## 更改执行命令

`package.json`

```json
 "scripts": {
    "build": "webpack",
    "dev": "webpack-dev-server",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
```

## 运行

构建： `npm run build`
`npm run dev`

## 下载 wasm 文件

https://webassembly.github.io/wabt/demo/wat2wasm/

从编辑框右上方的 downloads 按钮下载 wasm 文件

```wasm
(module
  (func (export "addTwo") (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.add))
```

# 编辑 `www/index.js`

必须是异步加载

```js
async function run() {
  const response = await fetch('test.wasm')
  const buffer = await response.arrayBuffer()
  const wasm = await WebAssembly.instantiate(buffer)
  // 获取方法
  const addTwoFunction = wasm.instance.exports.addTwo
  const result = addTwoFunction(1, 2)
  console.log(result)
}

run()
```

此时运行 `npm run dev` 可以在 ` http://localhost:8080/` 浏览器控制台看输出

## 更改 wat 文件

```wasm
(module
  (func (export "addTwo") (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.add))
```

to

```wasm
(module
  (import "console" "log" (func $log))
  (import "console" "error" (func $error))
  (func (export "add") (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $log
    call $error
    i32.add))

```

改为 `wasm` 调用 `js`

`www/index.js`

```js
async function run() {
  const importObject = {
    console: {
      log: () => {
        // 1. 调用 log
        console.log('log info')
      },
      error: () => {
        // 2. 调用 log error
        console.log('error info')
      },
    },
  }
  const response = await fetch('test.wasm')
  const buffer = await response.arrayBuffer()
  const wasm = await WebAssembly.instantiate(buffer, importObject) // 传入方法
  // 获取方法
  const addTwoFunction = wasm.instance.exports.addTwo
  const result = addTwoFunction(1, 2)
  console.log(result)
}

run()
```
