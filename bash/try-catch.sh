#!/bin/bash

# 定义一个处理错误的函数
handle_error() {
    echo "An error occurred"
    exit 1  # 可选：在处理完错误后退出脚本或者执行其他操作
}

# 设置 trap，捕获 ERR 信号（即错误）
trap 'handle_error' ERR

# 模拟一个可能会出错的命令
non_existing_command

# 如果上面的命令失败，trap 会捕获 ERR 信号，调用 handle_error 函数处理错误
echo "This line will not be executed due to the error"
