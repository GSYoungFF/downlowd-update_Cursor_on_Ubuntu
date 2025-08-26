#!/bin/bash
# 文件名: refresh_local_fonts.sh
# 功能: 只刷新用户本地字体 (~/.local/share/fonts) 并修复权限

FONT_DIR="$HOME/.local/share/fonts"

# 1. 检查字体目录是否存在
if [ ! -d "$FONT_DIR" ]; then
    echo "字体目录 $FONT_DIR 不存在。请先创建并放入字体文件。"
    exit 1
fi

# 2. 查找 TTF/OTF 字体文件
FONT_FILES=$(find "$FONT_DIR" -type f \( -iname "*.ttf" -o -iname "*.otf" \))
if [ -z "$FONT_FILES" ]; then
    echo "未找到 TTF/OTF 字体文件，请先放入 $FONT_DIR"
    exit 1
fi

# 3. 修复字体权限
echo "正在修复字体权限..."
chmod 644 $FONT_FILES

# 4. 只刷新用户本地字体缓存
echo "正在刷新用户本地字体缓存..."
fc-cache -fv "$FONT_DIR"

# 5. 验证字体是否被识别
echo "已加载以下字体："
fc-list | grep "$FONT_DIR" || echo "未识别到字体，请检查文件格式是否正确（TTF/OTF）"

echo "完成。请重启终端或应用程序以使用新字体。"
