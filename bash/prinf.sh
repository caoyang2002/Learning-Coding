#!/bin/bash

# 打印红色文本
printf '%b红色文本%b\n' "\033[31m" "\033[0m"

# 打印绿色文本
printf '%b绿色文本%b\n' "\033[32m" "\033[0m"

# 打印加粗蓝色文本
printf '%b加粗蓝色文本%b\n' "\033[1;34m" "\033[0m"

# 打印带有红色背景的白色文本
printf '%b白色文本在红色背景上%b\n' "\033[37;41m" "\033[0m"
