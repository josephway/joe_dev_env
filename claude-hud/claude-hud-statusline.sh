#!/usr/bin/env bash
# Claude HUD statusline wrapper
plugin_dir="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/plugins/cache/claude-hud/claude-hud/0.0.12"
if [ -f "${plugin_dir}/dist/index.js" ]; then
  exec /Users/mini/.volta/bin/node "${plugin_dir}/dist/index.js"
else
  echo "claude-hud: plugin not found at ${plugin_dir}"
fi
