# FlashBrowser - Android Flash游戏浏览器

> 🎮 **在手机上玩4399、7k7k等Flash游戏！**

FlashBrowser是一款专为移动设备优化的Flash游戏浏览器，基于Ruffle开源项目实现Flash内容播放。

---

## ✨ 功能特点

| 功能 | 说明 |
|------|------|
| 🎮 **Flash支持** | 集成Ruffle播放器，支持SWF文件 |
| 🖱️ **虚拟鼠标** | 触摸控制鼠标，完美适配Flash游戏 |
| ⌨️ **虚拟键盘** | 支持方向键、WASD等游戏按键 |
| 📱 **全屏模式** | 沉浸式游戏体验 |
| ⚡ **硬件加速** | GPU加速，流畅运行 |
| 🎯 **游戏优化** | 专门适配4399、7k7k等网站 |

---

## 🚀 快速开始（5分钟获得APK）

### 方法一：GitHub自动构建（推荐⭐最简单）

**不需要懂代码，不需要安装任何软件！**

1. **注册GitHub账号**（免费）
   - 访问 https://github.com/join
   - 用邮箱注册

2. **创建仓库**
   - 登录GitHub
   - 点击右上角 **+** → **New repository**
   - 名称填 `FlashBrowser`
   - 选择 **Public**
   - 点击 **Create repository**

3. **上传代码**
   - 点击 **Add file** → **Upload files**
   - 把FlashBrowser文件夹里的**所有文件**拖进去
   - 点击 **Commit changes**

4. **等待构建**
   - 点击 **Actions** 标签
   - 点击 "I understand..." 启用
   - 等待5-10分钟（黄色→绿色✅）

5. **下载APK**
   - 点击最新的成功构建
   - 滚动到底部
   - 点击 **FlashBrowser-Debug-APK** 下载
   - 解压得到 `app-debug.apk`

6. **安装到手机**
   - 用微信/QQ把APK传到手机
   - 点击安装
   - 允许未知来源应用

📖 **详细教程**：[新手图文教程](新手图文教程.md) | [快速开始](快速开始.md)

---

### 方法二：本地一键构建（Windows/Mac）

**需要安装Java**

#### Windows
1. 安装JDK 17：https://www.oracle.com/java/technologies/downloads/#java17
2. 双击运行 `一键构建.bat`
3. 等待5-10分钟
4. APK会在桌面上

#### Mac
1. 安装Java：`brew install openjdk@17`
2. 双击运行 `一键构建.command`
3. 等待5-10分钟
4. APK会在桌面上

---

## 📱 系统要求

- **Android版本**：10.0 或更高（API 29+）
- **RAM**：3GB 或更多
- **存储空间**：100MB

**支持的设备**：
- ✅ Samsung Galaxy S10/S20/S21/S22/S23
- ✅ Xiaomi 小米 10/11/12/13
- ✅ OnePlus 一加 7/8/9/10/11
- ✅ Google Pixel 4/5/6/7/8
- ✅ Huawei 华为 P30/P40/Mate30/Mate40
- ✅ 其他Android 10+设备

---

## 🎮 使用指南

### 基本操作

1. **打开应用**
   - 启动FlashBrowser
   - 默认打开4399.com

2. **浏览网页**
   - 点击地址栏
   - 输入网址或搜索关键词
   - 点击前往

3. **玩Flash游戏**
   - 找到想玩的游戏
   - 点击游戏链接
   - 等待加载（会自动使用Ruffle播放器）

### 虚拟鼠标

1. 点击底部工具栏的 **鼠标图标**
2. 在屏幕上滑动移动鼠标指针
3. **单击** = 左键点击
4. **双指点击** = 右键点击
5. **长按** = 拖拽

### 虚拟键盘

1. 点击底部工具栏的 **键盘图标**
2. 选择模式：
   - **ABC模式**：方向键 + WASD
   - **数字模式**：数字键盘
3. 点击按键发送输入

### 全屏模式

1. 点击底部工具栏的 **全屏图标**
2. 游戏全屏显示
3. 从顶部下滑显示控制栏
4. 点击退出全屏

---

## ⚙️ 设置选项

在应用内点击菜单按钮，可以设置：

- **硬件加速**：开关GPU加速
- **广告拦截**：拦截网页广告
- **桌面模式**：模拟电脑浏览器
- **虚拟鼠标**：默认开启/关闭
- **虚拟键盘**：默认开启/关闭
- **自动全屏**：进入游戏自动全屏
- **保持屏幕常亮**：游戏时不熄屏
- **清除缓存**：清理临时文件

---

## ❓ 常见问题

### Q: 为什么有些游戏玩不了？
A: Ruffle还在开发中，部分高级Flash功能不支持。可以尝试：
- 更新到最新版本
- 切换网络（WiFi/移动数据）
- 清除缓存后重试

### Q: 虚拟鼠标不灵敏怎么办？
A:
- 清理屏幕
- 重启应用
- 关闭其他后台应用

### Q: 安装时提示"解析包错误"？
A:
- 重新下载APK
- 确保下载完整
- 检查Android版本>=10

### Q: 如何更新到新版本？
A:
1. 在GitHub重新上传代码
2. 等待自动构建
3. 下载新的APK
4. 安装覆盖旧版本

---

## 📁 项目文件说明

```
FlashBrowser/
├── 📄 快速开始.md           ← 先看这个！
├── 📄 新手图文教程.md        ← 超详细教程
├── 📄 简单构建教程.md        ← 其他构建方法
├── 📄 一键构建.bat          ← Windows一键构建
├── 📄 一键构建.command      ← Mac一键构建
├── 📁 .github/workflows/    ← GitHub自动构建配置
│   └── build.yml
├── 📁 app/                  ← 应用代码
│   └── src/main/
│       ├── java/           ← Kotlin代码
│       ├── res/            ← 界面资源
│       └── assets/         ← Ruffle资源
└── 📄 build.gradle.kts     ← 构建配置
```

---

## 🔧 自定义你的APK

### 修改应用名称

1. 打开 `app/src/main/res/values/strings.xml`
2. 找到 `app_name`
3. 改成你想要的名字
4. 重新构建

### 修改首页网址

1. 打开 `app/src/main/java/com/flashbrowser/MainActivity.kt`
2. 找到 `HOME_URL`
3. 改成你想要的网址
4. 重新构建

### 修改主题颜色

1. 打开 `app/src/main/res/values/colors.xml`
2. 修改颜色值
3. 重新构建

---

## 🛠️ 技术栈

- **语言**：Kotlin
- **平台**：Android 10+ (API 29-36)
- **Flash引擎**：Ruffle (WebAssembly)
- **浏览器内核**：Android WebView
- **构建工具**：Gradle

---

## 📄 开源协议

- 本项目：**MIT License**
- Ruffle：**MIT/Apache-2.0 Dual License**

---

## 🙏 致谢

- [Ruffle](https://ruffle.rs/) - Flash Player模拟器
- [Android](https://developer.android.com/) - 移动平台
- [Kotlin](https://kotlinlang.org/) - 编程语言

---

## 💬 需要帮助？

- 📖 查看 [新手图文教程](新手图文教程.md)
- 🔍 在GitHub Issues中搜索
- 💡 提问时提供：设备型号、Android版本、错误信息

---

**🎉 祝你玩得开心！**

如果这个项目对你有帮助，请给个Star ⭐
