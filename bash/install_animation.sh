#!/bin/bash

# 定义旋转字符数组
spinner="/-\|"

# 定义动画刷新间隔时间（毫秒）
delay=250

# 定义动画持续的时间（毫秒）
duration=$((5 * 1000))

# 定义安装动画的函数
show_spinner() {
    local i=0
    local temp

    while [ $i -lt $((10 * ($duration / $delay))) ]; do
        temp=${spinner:0:1}
        printf "\rProcessing... [%s]" "$temp" 
        spinner=${spinner:1}$temp
        sleep 0.$delay
        i=$((i + 1))
    done
    printf "\rDone!        \n"
}

# 模拟安装过程
install_packages() {
    echo "Starting installation..."
    show_spinner &
    local spinner_pid=$!

    # 模拟安装任务
    sleep $(($duration / 1000))

    # 杀死动画进程
    kill $spinner_pid
    wait $spinner_pid 2>/dev/null

    echo "Installation completed."
}

# 执行安装
install_packages
