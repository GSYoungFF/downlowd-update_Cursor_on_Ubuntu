#!/bin/bash
# conda源切换脚本
# 保存为 conda_source_switch.sh，然后执行 chmod +x conda_source_switch.sh 运行

echo "==========================="
echo " Conda 源切换工具"
echo " 1. 切换到清华源"
echo " 2. 切换回默认源"
echo "==========================="
read -p "请输入选项 [1/2]: " choice

if [ "$choice" == "1" ]; then
    echo "切换到清华源..."
    conda config --remove-key channels >/dev/null 2>&1
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r/
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2/
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
    conda config --set show_channel_urls yes
    echo "✅ 已切换到清华源"

elif [ "$choice" == "2" ]; then
    echo "切换到默认源..."
    conda config --remove-key channels >/dev/null 2>&1
    conda config --add channels defaults
    conda config --set show_channel_urls yes
    echo "✅ 已切换到默认源"

else
    echo "❌ 无效选项"
    exit 1
fi

echo "当前 Conda 源配置："
conda config --show channels


