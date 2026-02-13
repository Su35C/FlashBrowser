@echo off
chcp 65001 >nul
title FlashBrowser 一键构建工具
color 0A

echo ==========================================
echo    FlashBrowser APK 一键构建工具
echo ==========================================
echo.

:: 检查是否安装了Java
java -version >nul 2>&1
if errorlevel 1 (
    echo ❌ 错误：未检测到Java环境
    echo.
    echo 请先安装JDK 17：
    echo https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.exe
    echo.
    pause
    exit /b 1
)

echo ✅ Java环境已检测
echo.

:: 检查gradlew是否存在
if not exist "gradlew" (
    echo ❌ 错误：找不到gradlew文件
    echo 请确保在FlashBrowser文件夹中运行此脚本
    pause
    exit /b 1
)

echo 🚀 开始构建APK...
echo 这个过程可能需要5-10分钟，请耐心等待
echo.

:: 给gradlew执行权限（在Windows上不需要，但为了兼容）
:: 构建Debug APK
call .\gradlew.bat assembleDebug

if errorlevel 1 (
    echo.
    echo ❌ 构建失败！
    echo 请检查网络连接，或查看上面的错误信息
    pause
    exit /b 1
)

echo.
echo ✅ 构建成功！
echo.
echo 📦 APK文件位置：
echo    %CD%\app\build\outputs\apk\debug\app-debug.apk
echo.

:: 复制APK到桌面（方便找到）
set "DESKTOP=%USERPROFILE%\Desktop"
copy "app\build\outputs\apk\debug\app-debug.apk" "%DESKTOP%\FlashBrowser.apk" >nul 2>&1
if exist "%DESKTOP%\FlashBrowser.apk" (
    echo 📱 APK已复制到桌面：FlashBrowser.apk
)

echo.
echo ==========================================
echo    构建完成！
echo ==========================================
echo.
pause
