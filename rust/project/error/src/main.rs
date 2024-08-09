use std::fs;
use std::io;
use std::path::Path;

fn main() -> io::Result<()> {
    let move_file = "./main.move";
    let path = Path::new(move_file);

    // 检查文件是否存在
    if !path.exists() {
        // 检查路径是否指向一个文件
        if let Some(parent) = path.parent() {
            // 创建父目录
            fs::create_dir_all(parent)?;
        }

        // 创建文件
        let _file = fs::File::create(path)?;
        println!("[创建文件]: {}", move_file);
    } else {
        println!("[已存在]: {}", move_file);
    }

    let tmp_file = "./main.move";
    let move_code = "这里是 Move 代码"; // 假设这是你要写入的 Move 代码

    // 将接收到的 Move 代码写入临时文件
    match fs::write(tmp_file, move_code) {
        Ok(_) => {
            println!("[写入文件]: {}", tmp_file);
            Ok(())
        }
        Err(e) => {
            handle_error(&e);
            Err(e)
        }
    }
}

// 错误处理函数
fn handle_error(error: &io::Error) {
    match error.kind() {
        io::ErrorKind::NotFound => eprintln!("文件或目录未找到"),
        io::ErrorKind::PermissionDenied => eprintln!("没有权限"),
        io::ErrorKind::AlreadyExists => eprintln!("文件或目录已存在"),
        io::ErrorKind::Other => eprintln!("其他错误: {}", error),
        _ => eprintln!("未知错误: {}", error), // 使用 _ 来匹配所有其他错误类型
    }
}
