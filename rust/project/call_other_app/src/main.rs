use std::process::Command;

fn main() {
    // 调用 `echo` 命令，打印 "Hello, World!" 到标准输出
    let output = Command::new("echo")
        .arg("Hello, World!")
        .output()
        .expect("Failed to execute command");

    // 将命令的标准输出转换为字符串，并打印输出
    let stdout = String::from_utf8_lossy(&output.stdout);
    println!("echo output: {}", stdout);

    // 检查命令是否成功执行
    if output.status.success() {
        println!("Command executed successfully");
    } else {
        eprintln!("Command failed: {}", output.status);
    }
}

