# Awesome Statusline

[![Claude Code Plugin](https://img.shields.io/badge/Claude%20Code-Plugin-blueviolet)](https://claude.ai/code)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Beautiful **Catppuccin-themed statusline** for Claude Code with **3 display modes**.

## Features

- **3 Display Modes**: Compact, Default, Full
- **Catppuccin Mocha Theme**: Beautiful gradient progress bars
- **Real-time Info**: Model, Git status, Context usage, API limits
- **Easy Mode Switching**: `/awesome-statusline-mode` command
- **Dynamic % Colors**: Percentage numbers match gradient end color (Bold)

## 3 Modes

### Compact (Short) - 2 lines
```
🤖Opus 📂~/projects/my-app 🌿(main)✅
🧠█████░░░░░ 5H██████░░░░ 7D████░░░░░░
```

### Default - 2 lines [DEFAULT]
```
🤖 Opus 4.5 | 🎨 Learning | 📂 ~/projects/my-app 🌿(main)✅
🧠 Context █████░░░░░ 47% | 5H ██████░░░░ 62% (1h2m) | 7D ████░░░░░░ 35% (Wed)
```

### Full (Long) - 5 lines
```
🤖 Opus 4.5 | ✅ clean | 🐍 base | 🎨 Learning
📂 /Users/user/projects/my-app 🌿(main) | 💰 1.23$ | ⏰ 12m
🧠 Context  ████████████░░░░░░░░ 56% used (105k/200k)
🚀 Usage 5H ██████████████░░░░░░ 67% (Reset 1h32m left)
⭐ Usage 7D ████████░░░░░░░░░░░░ 35% (Reset Wed 13:59)
```

## Installation

### Via Marketplace (Recommended)

```bash
# Add marketplace
/plugin marketplace add https://github.com/awesomejun/awesomejun-plugins-market.git

# Install plugin
/plugin install awesome-statusline@awesomejun-plugins-market

# Restart Claude Code
claude
```

### Direct Installation

```bash
/plugin install https://github.com/awesomejun/awesome-claude-statusline.git
```

## Usage

### Initial Setup

```bash
/awesome-statusline-start           # Interactive setup wizard
/awesome-statusline-start default   # Install Default mode directly
/awesome-statusline-start full      # Install Full mode directly
/awesome-statusline-start legacy    # Install 1.0.0 Legacy mode
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

## Mode Comparison

| Feature | Compact | Default | Full |
|---------|---------|---------|------|
| Lines | 2 | 2 | 5 |
| Bar Width | 10 | 10 | 20 |
| Model | Short (Opus) | Full (Opus 4.5) | Full |
| Output Style | - | Yes | Yes |
| Git Status | Icon | Icon | Detailed |
| Conda Env | - | - | Yes |
| Cost | - | - | Yes |
| Duration | - | - | Yes |
| Reset Time | - | Short | Full |
| % Bold+Gradient | - | Yes | Yes |

## Gradient Colors

All modes use the same beautiful Catppuccin gradients:

- **Context**: Pink -> Maroon -> Red
- **5H Usage**: Lavender -> Blue -> Red
- **7D Usage**: Yellow -> Peach -> Red

In Default and Full modes, the percentage number uses the **gradient end color** with **Bold** style.

## Requirements

- Claude Code CLI
- macOS (for Keychain access)
- `jq` (for JSON parsing)

## License

MIT License - See [LICENSE](LICENSE) file
