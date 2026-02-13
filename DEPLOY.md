# FlashBrowser 部署安装指南

## 快速开始

### 方式一：使用Android Studio (推荐)

#### 1. 环境准备

**系统要求：**
- Windows 10/11, macOS 10.14+, 或 Linux
- 8GB RAM (推荐16GB)
- 4GB 可用磁盘空间

**软件要求：**
- [Android Studio Hedgehog (2023.1.1)](https://developer.android.com/studio) 或更高版本
- [JDK 17](https://www.oracle.com/java/technologies/downloads/#java17) 或更高版本
- Android SDK API 29-36

#### 2. 导入项目

```bash
# 1. 解压项目文件
cd /path/to/FlashBrowser

# 2. 使用Android Studio打开
# File -> Open -> 选择 FlashBrowser 文件夹
```

#### 3. 配置SDK

```
1. 打开 File -> Settings -> Appearance & Behavior -> System Settings -> Android SDK
2. 安装以下SDK Platform:
   - Android 10.0 (API 29)
   - Android 11.0 (API 30)
   - Android 12.0 (API 31)
   - Android 13.0 (API 33)
   - Android 14.0 (API 34)
3. 安装 SDK Tools:
   - Android SDK Build-Tools 34
   - Android SDK Platform-Tools
   - Android SDK Tools
```

#### 4. 同步项目

```bash
# 点击 Android Studio 工具栏的 "Sync Now" 按钮
# 或运行命令:
./gradlew sync
```

#### 5. 构建APK

```bash
# Debug版本 (开发测试)
./gradlew assembleDebug

# Release版本 (正式发布)
./gradlew assembleRelease
```

#### 6. 安装到设备

**通过Android Studio:**
1. 连接Android设备 (开启USB调试)
2. 点击工具栏的 "Run" 按钮 (绿色三角形)
3. 选择目标设备

**通过ADB命令:**
```bash
# 安装Debug版本
adb install app/build/outputs/apk/debug/app-debug.apk

# 安装Release版本
adb install app/build/outputs/apk/release/app-release-unsigned.apk
```

---

### 方式二：命令行构建

#### 1. 安装依赖

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install openjdk-17-jdk android-sdk
```

**macOS:**
```bash
brew install openjdk@17
brew install android-sdk
```

**Windows:**
- 下载并安装 [JDK 17](https://www.oracle.com/java/technologies/downloads/#java17)
- 下载并安装 [Android SDK](https://developer.android.com/studio#command-tools)

#### 2. 配置环境变量

```bash
# ~/.bashrc 或 ~/.zshrc
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
```

#### 3. 构建项目

```bash
cd FlashBrowser

# 赋予gradlew执行权限 (Linux/macOS)
chmod +x gradlew

# 构建Debug APK
./gradlew assembleDebug

# 构建Release APK
./gradlew assembleRelease
```

#### 4. 签名Release版本

```bash
# 1. 生成密钥库
keytool -genkey -v \
    -keystore flashbrowser.keystore \
    -alias flashbrowser \
    -keyalg RSA \
    -keysize 2048 \
    -validity 10000

# 2. 配置签名 (编辑 app/build.gradle.kts)
# 参考 README.md 中的签名配置部分

# 3. 构建签名APK
./gradlew assembleRelease
```

---

### 方式三：CI/CD自动构建

#### GitHub Actions配置

创建 `.github/workflows/build.yml`:

```yaml
name: Build FlashBrowser

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up JDK 17
      uses: actions/setup-java@v3
      with:
        java-version: '17'
        distribution: 'temurin'
        
    - name: Setup Android SDK
      uses: android-actions/setup-android@v2
      
    - name: Cache Gradle packages
      uses: actions/cache@v3
      with:
        path: |
          ~/.gradle/caches
          ~/.gradle/wrapper
        key: ${{ runner.os }}-gradle-${{ hashFiles('**/*.gradle*', '**/gradle-wrapper.properties') }}
        
    - name: Grant execute permission for gradlew
      run: chmod +x gradlew
      
    - name: Build with Gradle
      run: ./gradlew assembleDebug
      
    - name: Upload APK
      uses: actions/upload-artifact@v3
      with:
        name: app-debug
        path: app/build/outputs/apk/debug/app-debug.apk
```

---

## 设备兼容性

### 支持的设备

| 品牌 | 型号 | Android版本 | 状态 |
|------|------|-------------|------|
| Samsung | Galaxy S20+ | Android 12 | ✅ 已测试 |
| Xiaomi | Mi 11 | Android 13 | ✅ 已测试 |
| OnePlus | 9 Pro | Android 12 | ✅ 已测试 |
| Google | Pixel 6 | Android 14 | ✅ 已测试 |
| Huawei | Mate 40 Pro | Android 10 | ✅ 已测试 |

### 最低要求

- **Android版本**: Android 10 (API 29) 或更高
- **RAM**: 3GB 或更多
- **存储空间**: 100MB 可用空间
- **处理器**: ARM64 (arm64-v8a)
- **GPU**: 支持OpenGL ES 2.0

### 推荐配置

- **Android版本**: Android 12 (API 31) 或更高
- **RAM**: 6GB 或更多
- **存储空间**: 500MB 可用空间
- **处理器**: Snapdragon 865 或更高
- **GPU**: Adreno 650 或更高

---

## 使用指南

### 首次启动

1. **授予权限**
   - 存储权限 (用于下载游戏)
   - 网络权限 (用于加载网页)

2. **初始设置**
   - 选择是否启用硬件加速
   - 选择是否使用桌面模式
   - 配置虚拟控制选项

### 基本操作

#### 浏览网页
```
1. 点击地址栏
2. 输入网址或搜索关键词
3. 点击键盘上的"前往"按钮
4. 等待页面加载
```

#### 玩Flash游戏
```
1. 访问游戏网站 (如 4399.com)
2. 找到想玩的游戏
3. 点击游戏链接
4. 等待Ruffle加载游戏
5. 使用虚拟鼠标/键盘控制游戏
```

#### 使用虚拟鼠标
```
1. 点击底部工具栏的鼠标图标
2. 在屏幕上滑动移动鼠标指针
3. 点击屏幕 = 左键点击
4. 双指点击 = 右键点击
5. 长按 = 拖拽
```

#### 使用虚拟键盘
```
1. 点击底部工具栏的键盘图标
2. 选择键盘模式 (ABC/数字)
3. 点击按键发送输入
4. 再次点击键盘图标关闭
```

#### 全屏模式
```
1. 点击底部工具栏的全屏图标
2. 游戏将全屏显示
3. 从顶部下滑显示控制栏
4. 点击退出全屏按钮
```

---

## 故障排除

### 常见问题

#### Q1: 应用无法安装
**原因:** 设备不兼容或签名问题
**解决:**
- 检查Android版本 >= 10
- 卸载旧版本后重新安装
- 确保使用正确的签名

#### Q2: 游戏无法加载
**原因:** 网络问题或Ruffle加载失败
**解决:**
- 检查网络连接
- 尝试切换网络 (WiFi/移动数据)
- 在设置中启用"使用本地Ruffle"
- 清除缓存后重试

#### Q3: 虚拟鼠标不工作
**原因:** 触摸事件冲突
**解决:**
- 确保虚拟鼠标已开启
- 重启应用
- 检查是否有其他应用占用屏幕

#### Q4: 游戏卡顿
**原因:** 设备性能不足
**解决:**
- 关闭其他后台应用
- 在设置中关闭硬件加速
- 降低游戏画质设置
- 使用性能更好的设备

#### Q5: 无法下载游戏
**原因:** 存储权限未授予
**解决:**
- 前往系统设置 -> 应用 -> FlashBrowser -> 权限
- 启用存储权限
- 重试下载

### 日志查看

```bash
# 查看应用日志
adb logcat -s FlashBrowser:D

# 查看所有日志
adb logcat | grep FlashBrowser

# 保存日志到文件
adb logcat -d > flashbrowser_log.txt
```

### 重置应用

```
1. 打开系统设置
2. 应用 -> FlashBrowser
3. 存储 -> 清除数据
4. 重新启动应用
```

---

## 更新维护

### 检查更新

```bash
# 更新项目代码
git pull origin main

# 更新依赖
./gradlew dependencies --refresh-dependencies

# 重新构建
./gradlew clean assembleDebug
```

### 版本管理

```
版本号格式: MAJOR.MINOR.PATCH

示例:
- 1.0.0 - 初始版本
- 1.1.0 - 新增功能
- 1.1.1 - Bug修复
- 2.0.0 - 重大更新
```

---

## 技术支持

### 获取帮助

- **GitHub Issues**: https://github.com/yourusername/FlashBrowser/issues
- **文档**: https://flashbrowser.readthedocs.io
- **邮件**: flashbrowser@example.com

### 反馈问题

请提供以下信息：
1. 设备型号和Android版本
2. 应用版本号
3. 问题描述和复现步骤
4. 错误日志 (如有)

---

## 附录

### 相关链接

- [Ruffle官网](https://ruffle.rs/)
- [Android开发者文档](https://developer.android.com/)
- [Kotlin文档](https://kotlinlang.org/docs/)
- [WebView文档](https://developer.android.com/reference/android/webkit/WebView)

### 开源组件

| 组件 | 版本 | 许可证 |
|------|------|--------|
| Ruffle | nightly-2024-01-15 | MIT/Apache-2.0 |
| AndroidX | 1.12.0 | Apache-2.0 |
| Kotlin | 1.9.20 | Apache-2.0 |
| OkHttp | 4.12.0 | Apache-2.0 |
| Gson | 2.10.1 | Apache-2.0 |

---

**祝使用愉快！**
