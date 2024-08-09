# 1. 生成 wasm 文件，导入 npm 项目

# Rust

## 安装 wasm-pack

https://rustwasm.github.io/wasm-pack/installer/

```bash
curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
```

或者

```bash
cargo install wasm-pack
```

## 在 `Cargo.toml` 中配置

- 配置 `creatt-type`
- 配置 `wasm-bindgen`
- 配置 `wasm-opt`

```toml
[package]
name = "wasm_game"
version = "0.1.0"
edition = "2021"

[dependencies]
wasm-bindgen = "0.2.78"

[lib]
crate-type = ["cdylib"]

[package.metadata.wasm-pack.profile.release]
wasm-opt = false
```

## 编写 `hello` 方法

`lib.rs`

```rust
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
extern{
  pnb fn alert(s: &str);
}

#[wasm_bindgen]
pub fn hello(name: &str) {
    alert(name);
}
```

# JS

- `wasm-pack build --target web` 生成包含 wasm 文件的 pkg 包

> 可能失败 `https://static.rust-lang.org/dist/rust-std-1.33.0-wasm32-unknown-unknown.tar.gz`

- 在 npm 中的 package.json 导入 pkg 包
- 调用 hello 方法
