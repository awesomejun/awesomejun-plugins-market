# 🛒 Awesomejun Plugins Market

[![Claude Code Marketplace](https://img.shields.io/badge/Claude%20Code-Marketplace-blueviolet)](https://claude.ai/code)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A curated collection of awesome plugins for Claude Code by [@awesomejun](https://github.com/awesomejun).

## 📦 Available Plugins

| Plugin | Description | Version |
|--------|-------------|---------|
| [awesome-claude-statusline](https://github.com/awesomejun/awesome-claude-statusline) | Beautiful Catppuccin-themed 4-line statusline with interactive setup wizard | 1.0.0 |

## 🚀 Installation

### Step 1: Add This Marketplace

```bash
# Using HTTPS URL (recommended)
/plugin marketplace add https://github.com/awesomejun/awesomejun-plugins-market.git
```

### Step 2: Install a Plugin

```bash
# Install awesome-claude-statusline
/plugin install awesome-claude-statusline@awesomejun-plugins-market
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
/plugin marketplace update awesomejun-plugins-market

# Remove marketplace
/plugin marketplace remove awesomejun-plugins-market
```

## 🔧 For Plugin Developers

Want to add your plugin to this marketplace?

1. Fork this repository
2. Add your plugin entry to `.claude-plugin/marketplace.json`
3. Submit a pull request

### Plugin Entry Format

```json
{
  "name": "your-plugin-name",
  "source": "https://github.com/username/your-plugin.git",
  "description": "Brief description of your plugin",
  "version": "1.0.0",
  "author": {
    "name": "Your Name"
  },
  "keywords": ["keyword1", "keyword2"],
  "category": "tools"
}
```

## 📄 License

MIT License - feel free to use and contribute!

---

Made with 💜 by [@awesomejun](https://github.com/awesomejun)
