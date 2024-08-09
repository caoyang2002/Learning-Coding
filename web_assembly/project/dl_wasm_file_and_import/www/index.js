async function run() {
  const importObject = {
    console: {
      log: () => {
        console.log('log inf')
      },
      error: () => {
        console.log('error info')
      },
    },
  }
  const response = await fetch('call_log.wasm')
  const buffer = await response.arrayBuffer()
  debugger // 可以在这里调试
  const wasm = await WebAssembly.instantiate(buffer, importObject)
  // 获取方法
  const addFunction = wasm.instance.exports.add
  const result = addFunction(1, 2)
  console.log(result)
}

run()
