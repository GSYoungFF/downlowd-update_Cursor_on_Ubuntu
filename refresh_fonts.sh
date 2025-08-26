#!/bin/bash
# 文件名: refresh_fonts.sh
# 功能: 自动刷新用户字体缓存并修复权限问题

FONT_DIR="$HOME/.local/share/fonts"

# 1. 检查字体目录是否存在
if [ ! -d "$FONT_DIR" ]; then
    echo "字体目录 $FONT_DIR 不存在。"
    exit 1
fi

# 2. 检查字体文件
FONT_FILES=$(find "$FONT_DIR" -type f \( -iname "*.ttf" -o -iname "*.otf" \))
if [ -z "$FONT_FILES" ]; then
    echo "未找到 TTF/OTF 字体文件，请先放入 $FONT_DIR"
    exit 1
fi

# 3. 修复权限
echo "正在修复字体权限..."
chmod 644 $FONT_FILES

# 4. 刷新用户字体缓存
echo "正在刷新用户字体缓存..."
fc-cache -fv "$FONT_DIR"

# 5. 刷新系统字体缓存（可选，保证全局可用）
echo "正在刷新系统字体缓存..."
sudo fc-cache -fv

# 6. 提示完成
echo "字体缓存已刷新完成。请重启终端或应用程序以使用新字体。"

