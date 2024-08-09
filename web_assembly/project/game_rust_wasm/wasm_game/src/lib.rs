use wasm_bindgen::prelude::*;

#[wasm_bindgen]
extern "C"{
  pnb fn alert(s: &str);
}

#[wasm_bindgen]
pub fn hello(name: &str) {
    alert(name);
}
