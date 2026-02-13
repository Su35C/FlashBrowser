#!/bin/bash

# FlashBrowser APK 一键构建脚本 (Mac/Linux)

echo "=========================================="
echo "   FlashBrowser APK 一键构建工具"
echo "=========================================="
echo ""

# 检查Java
if ! command -v java &> /dev/null; then
    echo "❌ 错误：未检测到Java环境"
    echo ""
    echo "请先安装JDK 17："
    echo "  Mac: brew install openjdk@17"
    echo "  Linux: sudo apt install openjdk-17-jdk"
    echo ""
    exit 1
fi

echo "✅ Java环境已检测"
echo ""

# 检查gradlew
if [ ! -f "gradlew" ]; then
    echo "❌ 错误：找不到gradlew文件"
    echo "请确保在FlashBrowser文件夹中运行此脚本"
    exit 1
fi

echo "🚀 开始构建APK..."
echo "这个过程可能需要5-10分钟，请耐心等待"
echo ""

# 给gradlew执行权限
chmod +x gradlew

# 构建Debug APK
./gradlew assembleDebug

if [ $? -ne 0 ]; then
    echo ""
    echo "❌ 构建失败！"
    echo "请检查网络连接，或查看上面的错误信息"
    exit 1
fi

echo ""
echo "✅ 构建成功！"
echo ""
echo "📦 APK文件位置："
echo "   $(pwd)/app/build/outputs/apk/debug/app-debug.apk"
echo ""

# 复制到桌面（Mac）
if [ -d "$HOME/Desktop" ]; then
    cp "app/build/outputs/apk/debug/app-debug.apk" "$HOME/Desktop/FlashBrowser.apk" 2>/dev/null
    if [ -f "$HOME/Desktop/FlashBrowser.apk" ]; then
        echo "📱 APK已复制到桌面：FlashBrowser.apk"
    fi
fi

echo ""
echo "=========================================="
echo "   构建完成！"
echo "=========================================="
echo ""
read -p "按回车键退出..."
