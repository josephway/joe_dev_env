# joe_dev_env

我的开发环境配置文件。

## 内容

| 工具 | 路径 | 说明 |
|------|------|------|
| [Ghostty](https://ghostty.org/) | `ghostty/config` | 终端模拟器，Catppuccin Macchiato 主题 + JetBrains Mono Nerd Font |
| [Starship](https://starship.rs/) | `starship/starship.toml` | Shell 提示符，Catppuccin 配色，多语言版本显示 |
| [Tmux](https://github.com/tmux/tmux) | `tmux/tmux.conf` | 终端复用器，TPM 插件管理，vim 键位 |
| [Yazi](https://yazi-rs.github.io/) | `yazi/` | 终端文件管理器，Catppuccin Mocha Flamingo 主题 |
| [Vim](https://www.vim.org/) | `vim/vimrc` | 编辑器，输入法自动切换（普通模式英文） |
| [Claude HUD](https://github.com/jarrodwatts/claude-hud) | `claude-hud/` | Claude Code 状态栏，显示模型/上下文/配置信息 |

## 使用

```bash
# Ghostty
mkdir -p ~/.config/ghostty
cp ghostty/config ~/.config/ghostty/config

# Starship
cp starship/starship.toml ~/.config/starship.toml

# Tmux
cp tmux/tmux.conf ~/.tmux.conf
# 安装 TPM 插件管理器
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Yazi
mkdir -p ~/.config/yazi
cp yazi/theme.toml ~/.config/yazi/theme.toml
cp yazi/yazi.toml ~/.config/yazi/yazi.toml
cp yazi/Catppuccin-mocha.tmTheme ~/.config/yazi/Catppuccin-mocha.tmTheme

# Vim
cp vim/vimrc ~/.vimrc

# Claude HUD
mkdir -p ~/.claude/plugins
cp claude-hud/claude-hud-statusline.sh ~/.claude/plugins/claude-hud-statusline.sh
chmod +x ~/.claude/plugins/claude-hud-statusline.sh
# 然后在 ~/.claude/settings.json 中配置 statusLine:
# "statusLine": { "type": "command", "command": "/path/to/.claude/plugins/claude-hud-statusline.sh" }
```

## 依赖

- **字体**: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)
- **Tmux 插件**: TPM (tmux-plugins/tpm)
- **编辑器**: Zed (tmux-open 插件配置)
- **文件管理器**: Yazi (Homebrew: `brew install yazi`)
- **Vim 输入法切换**: [im-select](https://github.com/daipeihust/im-select) (macOS)
- **Claude HUD**: Node.js 18+，需先安装 claude-hud 插件 (`claude plugins add claude-hud`)
