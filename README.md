# 🛒 Awesome Claude Plugins

[![Claude Code Marketplace](https://img.shields.io/badge/Claude%20Code-Marketplace-blueviolet)](https://claude.ai/code)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A curated collection of awesome plugins for Claude Code by [@awesomejun](https://github.com/awesomejun).

## 📦 Available Plugins

| Plugin | Description |
|--------|-------------|
| [awesome-statusline](./plugins/awesome-statusline) | Beautiful Catppuccin-themed statusline with 3 modes |

### 🎨 awesome-statusline

Beautiful **Catppuccin Mocha themed statusline** for Claude Code.

**Features:**
- 🎨 Catppuccin Mocha theme with gradient progress bars
- 📊 3 modes: Compact, Default, Full
- 💡 Auto-setup when statusline is not configured
- 📦 **Auto-backup**: Automatically backs up your existing statusline before replacing
- 🔄 **Easy restore**: Restore previous statusline with `/make-statusline-awesome restore`

**Commands:**
```bash
/make-statusline-awesome              # Quick setup (default theme)
/make-statusline-awesome customize    # Customize theme and options
/make-statusline-awesome restore      # Restore previous statusline
/statusline-mode                      # Switch between Compact/Default/Full
```

## 🚀 Installation

### Step 1: Add This Marketplace

```bash
/plugin marketplace add awesomejun/awesome-claude-plugins
```

### Step 2: Install a Plugin

```bash
/plugin install awesome-statusline@awesome-claude-plugins
```

### Step 3: Restart Claude Code

```bash
# Exit current session and restart
claude
```

## 📋 Marketplace Commands

```bash
# List available plugins
/plugin marketplace list

# Update marketplace
/plugin marketplace update awesome-claude-plugins

# Remove marketplace
/plugin marketplace remove awesome-claude-plugins
```

## 🔧 For Plugin Developers

Want to add your plugin to this marketplace?

1. Fork this repository
2. Add your plugin to `plugins/` directory
3. Add your plugin entry to `.claude-plugin/marketplace.json`
4. Submit a pull request

## 📄 License

MIT License - feel free to use and contribute!

---

Made with 💜 by [@awesomejun](https://github.com/awesomejun)
