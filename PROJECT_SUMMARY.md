# FlashBrowser 项目总结

## 项目概述

FlashBrowser是一款专为Android设备设计的Flash游戏浏览器，基于Ruffle开源项目实现Flash内容播放。该项目使用Kotlin语言和Android WebView技术构建，支持Android 10-16 (API 29-36)。

## 核心功能实现

### 1. Flash支持
- ✅ 集成Ruffle WebAssembly播放器
- ✅ 自动检测.swf文件并注入播放器
- ✅ 处理CORS跨域问题
- ✅ 支持CDN和本地两种Ruffle加载方式

### 2. 移动端适配
- ✅ 虚拟鼠标模式 (触摸=鼠标移动，点击=左键)
- ✅ 虚拟键盘 (支持Flash的Key.isDown检测)
- ✅ 全屏模式切换
- ✅ 桌面模式User-Agent

### 3. 性能优化
- ✅ WebView硬件加速
- ✅ Ruffle配置: prefer_wgpu: false
- ✅ 智能缓存系统
- ✅ 资源预加载

### 4. 游戏网站优化
- ✅ 4399.com 专门优化
- ✅ 7k7k.com 专门优化
- ✅ 支持Kongregate、Newgrounds等国际站点

## 项目结构

```
FlashBrowser/
├── app/src/main/
│   ├── java/com/flashbrowser/
│   │   ├── MainActivity.kt          # 主界面
│   │   ├── GameActivity.kt          # 全屏游戏
│   │   ├── SettingsActivity.kt      # 设置页面
│   │   ├── ruffle/
│   │   │   └── RuffleInjector.kt    # Ruffle注入器
│   │   ├── ui/
│   │   │   ├── VirtualMouseView.kt  # 虚拟鼠标
│   │   │   └── VirtualKeyboardView.kt # 虚拟键盘
│   │   ├── utils/
│   │   │   ├── UrlUtils.kt          # URL工具
│   │   │   └── PreferenceManager.kt # 设置管理
│   │   ├── cache/
│   │   │   └── GameCacheManager.kt  # 缓存管理
│   │   └── service/
│   │       └── DownloadService.kt   # 下载服务
│   ├── res/                         # UI资源
│   └── assets/ruffle/               # Ruffle资源
└── build.gradle.kts                 # 构建配置
```

## 技术栈

| 技术 | 版本 | 用途 |
|------|------|------|
| Kotlin | 1.9.20 | 开发语言 |
| Android SDK | 34 | 目标平台 |
| Min SDK | 29 | 最低支持Android 10 |
| Ruffle | nightly | Flash播放器 |
| OkHttp | 4.12.0 | 网络请求 |
| Gson | 2.10.1 | JSON处理 |
| DiskLruCache | 2.0.2 | 磁盘缓存 |

## 关键代码实现

### Ruffle注入器
```kotlin
class RuffleInjector(private val context: Context) {
    fun injectRuffle(webView: WebView, url: String) {
        val ruffleScript = generateRuffleScript()
        webView.evaluateJavascript(ruffleScript, null)
    }
    
    fun generateRuffleHtml(swfUrl: String): String {
        // 生成包含Ruffle的HTML页面
    }
}
```

### 虚拟鼠标
```kotlin
class VirtualMouseView(context: Context) : View(context) {
    override fun onTouchEvent(event: MotionEvent): Boolean {
        // 触摸转鼠标事件
        when (event.action) {
            MotionEvent.ACTION_MOVE -> onMouseEvent?.invoke("move", x, y)
            MotionEvent.ACTION_DOWN -> onMouseEvent?.invoke("click", x, y)
        }
        return true
    }
}
```

### SWF拦截
```kotlin
override fun shouldOverrideUrlLoading(view: WebView?, request: WebResourceRequest?): Boolean {
    val url = request?.url?.toString() ?: return false
    if (UrlUtils.isSwfUrl(url)) {
        handleSwfUrl(url)
        return true
    }
    return false
}
```

## 部署步骤

### 1. 环境准备
- Android Studio Hedgehog (2023.1.1)+
- JDK 17+
- Android SDK API 29-36

### 2. 构建命令
```bash
# 同步依赖
./gradlew sync

# 构建Debug版本
./gradlew assembleDebug

# 构建Release版本
./gradlew assembleRelease
```

### 3. 安装命令
```bash
# 通过ADB安装
adb install app/build/outputs/apk/debug/app-debug.apk
```

## 使用说明

### 基本操作
1. 打开应用，默认访问4399.com
2. 在地址栏输入网址或搜索关键词
3. 点击Flash游戏链接
4. 应用自动加载Ruffle播放器

### 虚拟控制
- **虚拟鼠标**: 点击底部鼠标图标开启，触摸移动指针，单击=左键
- **虚拟键盘**: 点击底部键盘图标开启，支持方向键和常用游戏按键
- **全屏模式**: 点击全屏图标进入沉浸式游戏体验

### 设置选项
- 硬件加速开关
- 广告拦截开关
- 桌面模式切换
- 缓存管理
- 虚拟控制默认状态

## 兼容性

### 支持的设备
- Android 10+ (API 29+)
- ARM64处理器
- OpenGL ES 2.0+

### 测试设备
- Samsung Galaxy S20+ (Android 12)
- Xiaomi Mi 11 (Android 13)
- Google Pixel 6 (Android 14)

## 已知问题

1. **部分Flash游戏无法运行**: Ruffle仍在开发中，部分高级Flash功能未完全支持
2. **虚拟鼠标精度**: 在部分设备上可能需要调整灵敏度
3. **性能问题**: 大型Flash游戏可能需要高端设备

## 未来计划

- [ ] 支持更多Flash API
- [ ] 游戏手柄支持
- [ ] 本地SWF文件播放
- [ ] 游戏录制功能
- [ ] 云存档同步

## 开源协议

- 本项目: MIT License
- Ruffle: MIT/Apache-2.0 Dual License

## 致谢

- [Ruffle](https://ruffle.rs/) - Flash Player模拟器
- [Android](https://developer.android.com/) - 移动平台
- [Kotlin](https://kotlinlang.org/) - 开发语言

---

**项目创建日期**: 2024年
**版本**: 1.0.0
**开发者**: FlashBrowser Team
