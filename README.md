# joe_dev_env

我的开发环境配置文件。

## 内容

| 工具 | 路径 | 说明 |
|------|------|------|
| [Ghostty](https://ghostty.org/) | `ghostty/config` | 终端模拟器，Catppuccin Macchiato 主题 + JetBrains Mono Nerd Font |
| [Starship](https://starship.rs/) | `starship/starship.toml` | Shell 提示符，Catppuccin 配色，多语言版本显示 |
| [Tmux](https://github.com/tmux/tmux) | `tmux/tmux.conf` | 终端复用器，TPM 插件管理，vim 键位 |

## 使用

```bash
# Ghostty
ln -sf $(pwd)/ghostty/config ~/.config/ghostty/config

# Starship
ln -sf $(pwd)/starship/starship.toml ~/.config/starship.toml

# Tmux
ln -sf $(pwd)/tmux/tmux.conf ~/.tmux.conf
# 安装 TPM 插件管理器
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## 依赖

- **字体**: [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)
- **Tmux 插件**: TPM (tmux-plugins/tpm)
- **编辑器**: Zed (tmux-open 插件配置)
