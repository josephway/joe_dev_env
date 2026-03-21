# Tmux IM Watcher

macOS 输入法状态监控程序，用于在 tmux 状态栏显示当前输入法状态（中文/英文）。

## 功能

- 实时监控 macOS 输入法切换
- 更新 tmux 状态栏显示当前输入法
- 中文输入法显示 `中`（深洋红色）
- 英文输入法显示 `EN`（布莱茵蓝）

## 编译

```bash
clang -framework Cocoa -framework Carbon tmux-im-watcher.m -o tmux-im-watcher
```

## 使用

1. 将编译后的二进制文件放到 `~/bin/` 或其他 PATH 目录
2. 在后台运行：
   ```bash
   # 直接运行（前台）
   ~/bin/tmux-im-watcher

   # 或作为 launchd 服务（推荐）
   ```
3. 切换输入法时，tmux 状态栏会自动更新

## Launchd 配置（可选）

创建 `~/Library/LaunchAgents/com.user.tmux-im-watcher.plist`：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.tmux-im-watcher</string>
    <key>ProgramArguments</key>
    <array>
        <string>/Users/joe/bin/tmux-im-watcher</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
```

加载服务：
```bash
launchctl load ~/Library/LaunchAgents/com.user.tmux-im-watcher.plist
```

## tmux 配置

在 `~/.tmux.conf` 中，状态栏会自动更新，无需额外配置。
