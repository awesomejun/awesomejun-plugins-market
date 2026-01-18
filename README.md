# 🛒 Awesomejun Plugins Market

[![Claude Code Marketplace](https://img.shields.io/badge/Claude%20Code-Marketplace-blueviolet)](https://claude.ai/code)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A curated collection of awesome plugins for Claude Code by [@awesomejun](https://github.com/awesomejun).

## 📦 Available Plugins

| Plugin | Description | Version |
|--------|-------------|---------|
| [awesome-claude-statusline](https://github.com/awesomejun/awesome-claude-statusline) | Beautiful Catppuccin-themed 4-line statusline with interactive setup wizard | 1.0.0 |

### 🎨 awesome-claude-statusline

Beautiful **Catppuccin Mocha themed 4-line statusline** for Claude Code.

**Features:**
- 🎨 Catppuccin Mocha theme with gradient progress bars
- 📊 4-line display: Model, Git, Conda, Context, API Usage
- 💡 Auto-setup when statusline is not configured
- 📦 **Auto-backup**: Automatically backs up your existing statusline before replacing
- 🔄 **Easy restore**: Restore previous statusline with `/make-statusline-awesome restore`

**Commands:**
```bash
/make-statusline-awesome              # Quick setup (default theme)
/make-statusline-awesome customize    # Customize theme and options
/make-statusline-awesome restore      # Restore previous statusline
```

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

## 🔄 Automatic Backup (awesome-claude-statusline)

**Your existing statusline is always safe!**

When you install and run the statusline setup:

1. ✅ Your existing script is backed up to `~/.claude/statusline-backup-{timestamp}.sh`
2. ✅ Your existing settings are saved to `~/.claude/statusline-backup-{timestamp}.json`
3. ✅ Restore anytime with `/make-statusline-awesome restore`

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
  "source": {
    "source": "url",
    "url": "https://github.com/username/your-plugin.git"
  },
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
