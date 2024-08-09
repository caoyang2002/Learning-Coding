#!/bin/bash

# 检测并获取已安装的包管理器
get_installed_package_manager() {
    local pm_list=(pnpm npm yarn bun)
    for pm in "${pm_list[@]}"; do
        if command -v "$pm" > /dev/null 2>&1; then
            echo "$pm"
            return 0
        fi
    done
    return 1
}

# 获取已安装的包管理器
package_manager=$(get_installed_package_manager)

# 检查是否找到包管理器
if [ -z "$package_manager" ]; then
    echo "No package manager installed."
    exit 1
else
    echo "The installed package manager is: $package_manager"
fi

# 使用已安装的包管理器安装包
echo "Starting to install packages with $package_manager."
# 假设 PACKAGE_NAMES 是你想要安装的包名数组
PACKAGE_NAMES=("package1" "package2" "package3") # 替换为你的包名列表

for package_name in "${PACKAGE_NAMES[@]}"; do
    if ! $package_manager list "$package_name" &> /dev/null; then
        echo "Installing $package_name with $package_manager."
        $package_manager install "$package_name"
    else
        echo "$package_name is already installed."
    fi
done
