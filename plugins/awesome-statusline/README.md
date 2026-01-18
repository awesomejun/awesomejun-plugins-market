# Awesome Statusline

[![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-blueviolet)](https://claude.ai/code)
[![Version](https://img.shields.io/badge/version-2.1.0-blue)](https://github.com/awesomejun/awesome-claude-plugins)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Beautiful **Catppuccin-themed statusline** for Claude Code with **3 display modes** and real-time API usage monitoring.

## ✨ Features

- 🎨 **3 Display Modes**: Compact, Default, Full
- 🌈 **Catppuccin Mocha Theme**: Beautiful 4-stage gradient progress bars
- 📊 **Real-time Monitoring**: Model, Git status, Context usage, API limits (5H/7D)
- 🔄 **Easy Mode Switching**: `/awesome-statusline-mode` command
- 💾 **Auto-backup**: Automatically backs up existing statusline
- 🌟 **Dynamic Colors**: Percentage numbers match gradient end color (Bold)

## 📐 Display Modes

### Compact (Short) - 2 lines, 10-block bars
```
🤖Opus 📂~/projects/my-app 🌿(main)✅
🧠██████████ 5H██████████ 7D██████████
```

### Default - 2 lines, 10-block bars
```
🤖 Claude Opus 4.5 | 🎨 learning | 📂 ~/projects/my-app 🌿(main)✅
🧠 Context ██████████ 47% | 5H ██████████ 62% (1h2m) | 7D ██████████ 35% (Wed)
```

### Full (Long) - 5 lines, 40-block bars
```
🤖 Claude Opus 4.5 | 🎨 learning | ✅ clean ↑1 | 🐍 base
📂 /Users/user/projects/my-app 🌿(main) | 💰 1.23$ | ⏰ 12m
🧠 Context  ████████████████████████████████████████ 56% used (105k/200k)
🚀 5H Limit ████████████████████████████████████████ 67% (Resets in 1h32m)
⭐ 7D Limit ████████████████████████████████████████ 35% (Resets Jan 21 at 2pm)
```

## 🚀 Installation

### Via Marketplace (Recommended)

```bash
# Add marketplace
/plugin marketplace add awesomejun/awesome-claude-plugins

# Install plugin
/plugin install awesome-statusline@awesome-claude-plugins

# Restart Claude Code
claude

# Run setup wizard
/awesome-statusline-start
```

## 🔧 Usage

### Initial Setup

```bash
/awesome-statusline-start           # Interactive setup wizard
/awesome-statusline-start compact   # Install Compact mode directly
/awesome-statusline-start default   # Install Default mode directly
/awesome-statusline-start full      # Install Full mode directly
/awesome-statusline-start legacy    # Install 1.0.0 Legacy mode
/awesome-statusline-start restore   # Restore from backup
```

### Switch Mode

```bash
/awesome-statusline-mode compact   # Compact mode
/awesome-statusline-mode default   # Default mode
/awesome-statusline-mode full      # Full mode
/awesome-statusline-mode legacy    # 1.0.0 Legacy mode
/awesome-statusline-mode restore   # Restore from backup

/awesome-statusline-mode           # Interactive selection
```

## 📊 Mode Comparison

| Feature | Compact | Default | Full |
|---------|---------|---------|------|
| Lines | 2 | 2 | 5 |
| Bar Width | 10 blocks | 10 blocks | 40 blocks |
| Model | Short (Opus) | Full (Claude Opus 4.5) | Full |
| Output Style | ❌ | ✅ | ✅ |
| Git Status | Icon only | Icon only | Detailed (+N !N ?N) |
| Git ↑↓ (ahead/behind) | ❌ | ❌ | ✅ |
| Conda Env | ❌ | ❌ | ✅ |
| Cost | ❌ | ❌ | ✅ |
| Duration | ❌ | ❌ | ✅ |
| Reset Time | ❌ | Short (1h2m) | Full (Resets in 1h32m) |
| % Bold+Gradient | ❌ | ✅ | ✅ |

## 🌈 Gradient Colors

4-stage gradients that change based on usage level:

| Bar | 0-40% | 40-80% | 80-100% |
|-----|-------|--------|---------|
| **Context** | Mocha Maroon | Latte Maroon | Latte Red |
| **5H Limit** | Mocha Lavender | Latte Blue | Latte Red |
| **7D Limit** | Mocha Yellow | Latte Green | Latte Red |

## 📋 Requirements

- Claude Code CLI
- macOS (for Keychain OAuth token access)
- `jq` (for JSON parsing)

## 📄 License

MIT License - See [LICENSE](LICENSE) file
