# 🛒 Awesome Claude Plugins

[![Claude Code Marketplace](https://img.shields.io/badge/Claude%20Code-Marketplace-blueviolet)](https://claude.ai/code)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A curated collection of awesome plugins for Claude Code by [@awesomejun](https://github.com/awesomejun).

## 📦 Available Plugins

| Plugin | Version | Description |
|--------|---------|-------------|
| [awesome-statusline](./plugins/awesome-statusline) | 2.1.0 | Beautiful Catppuccin-themed statusline with 3 modes |

---

## 🎨 awesome-statusline

Beautiful **Catppuccin Mocha themed statusline** for Claude Code with real-time API usage monitoring.

### ✨ Features

| Feature | Description |
|---------|-------------|
| 🎨 **Catppuccin Theme** | Mocha dark theme with beautiful color palette |
| 📊 **3 Display Modes** | Compact, Default, Full - choose your style |
| 🌈 **Gradient Progress Bars** | 4-stage color gradients that change based on usage |
| 🚀 **API Usage Monitoring** | Real-time 5-hour and 7-day usage limits |
| 🧠 **Context Tracking** | Visual context window usage |
| 💾 **Auto-backup** | Automatically backs up existing statusline |
| 🔄 **Easy Restore** | One command to restore previous statusline |

### 📐 Display Modes

| Mode | Lines | Bar Width | Best For |
|------|-------|-----------|----------|
| **Compact** | 2 | 10 blocks | Narrow terminals, minimal info |
| **Default** | 2 | 10 blocks | Balanced information display |
| **Full** | 5 | 40 blocks | Detailed monitoring with cost & time |

#### Compact Mode (2 lines)
```
🤖Opus 📂~/project 🌿(main)✅
🧠██████████ 5H██████████ 7D██████████
```

#### Default Mode (2 lines)
```
🤖 Claude Opus 4.5 | 🎨 learning | 📂 ~/project 🌿(main)✅
🧠 Context ██████████ 25% | 5H ██████████ 15% (3h42m) | 7D ██████████ 8% (Sun)
```

#### Full Mode (5 lines)
```
🤖 Claude Opus 4.5 | 🎨 learning | ✅ clean ↑1 | 🐍 base
📂 /Users/kang/project 🌿(main) | 💰 0.15$ | ⏰ 5m
🧠 Context  ████████████████████████████████████████ 25% used (50k/200k)
🚀 5H Limit ████████████████████████████████████████ 15% (Resets in 3h42m)
⭐ 7D Limit ████████████████████████████████████████ 8% (Resets Jan 21 at 2pm)
```

### 🌈 Gradient Colors

Each progress bar uses a unique 4-stage gradient that changes color based on usage:

| Bar | 0-40% | 40-80% | 80-100% |
|-----|-------|--------|---------|
| **Context** | Mocha Maroon | Latte Maroon | Latte Red |
| **5H Limit** | Mocha Lavender | Latte Blue | Latte Red |
| **7D Limit** | Mocha Yellow | Latte Green | Latte Red |

### 🔧 Commands

| Command | Description |
|---------|-------------|
| `/awesome-statusline-start` | Interactive setup wizard |
| `/awesome-statusline-start compact` | Quick install Compact mode |
| `/awesome-statusline-start default` | Quick install Default mode |
| `/awesome-statusline-start full` | Quick install Full mode |
| `/awesome-statusline-start legacy` | Install 1.0.0 Legacy version |
| `/awesome-statusline-start restore` | Restore from backup |
| `/awesome-statusline-mode` | Switch between modes |

### 📋 Information Displayed

| Icon | Information | Modes |
|------|-------------|-------|
| 🤖 | Model name (Opus/Sonnet/Haiku) | All |
| 🎨 | Output style | Default, Full |
| ✅/📝 | Git status (clean/dirty) | All |
| ↑/↓ | Git ahead/behind upstream | Full |
| 🐍 | Conda environment | Default, Full |
| 📂 | Current directory path | All |
| 🌿 | Git branch | All |
| 💰 | Session cost | Full |
| ⏰ | Session duration | Full |
| 🧠 | Context window usage | All |
| 🚀 | 5-hour API limit | All |
| ⭐ | 7-day API limit | All |

---

## 🚀 Installation

### Step 1: Add This Marketplace

```bash
/plugin marketplace add awesomejun/awesome-claude-plugins
```

### Step 2: Install the Plugin

```bash
/plugin install awesome-statusline@awesome-claude-plugins
```

### Step 3: Restart Claude Code

```bash
# Exit and restart
claude
```

### Step 4: Run Setup Wizard

```bash
/awesome-statusline-start
```

---

## 📋 Marketplace Commands

```bash
# List available plugins
/plugin marketplace list

# Update marketplace
/plugin marketplace update awesome-claude-plugins

# Remove marketplace
/plugin marketplace remove awesome-claude-plugins
```

---

## 🔧 For Plugin Developers

Want to add your plugin to this marketplace?

1. Fork this repository
2. Add your plugin to `plugins/` directory
3. Add your plugin entry to `.claude-plugin/marketplace.json`
4. Submit a pull request

---

## 📄 License

MIT License - feel free to use and contribute!

---

Made with 💜 by [@awesomejun](https://github.com/awesomejun)
