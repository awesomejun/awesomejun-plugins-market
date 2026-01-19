# 🛒 Awesome Claude Plugins

[![Claude Code Marketplace](https://img.shields.io/badge/Claude%20Code-Marketplace-blueviolet)](https://claude.ai/code)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A curated collection of awesome plugins for Claude Code by [@awesomejun](https://github.com/awesomejun).

## 📦 Available Plugins

| Plugin | Version | Description |
|--------|---------|-------------|
| [awesome-statusline](./plugins/awesome-statusline) | 2.1.0 | Beautiful Catppuccin-themed statusline with 4 modes |

---

## 🎨 awesome-statusline

Beautiful **Catppuccin Mocha themed statusline** for Claude Code with real-time API usage monitoring, git status with ahead/behind tracking, and gradient progress bars.

### ✨ Features

| Feature | Description |
|---------|-------------|
| 🎨 **Catppuccin Theme** | Mocha dark theme with beautiful color palette |
| 📊 **4 Display Modes** | Compact, Default, Full, Legacy - choose your style |
| 🌈 **Gradient Progress Bars** | 4-stage color gradients that change based on usage |
| 🚀 **API Usage Monitoring** | Real-time 5-hour and 7-day usage limits with reset time |
| 🧠 **Context Tracking** | Visual context window usage with token count |
| ↑↓ **Git Ahead/Behind** | Shows commits ahead/behind upstream (Full mode) |
| 💾 **Auto-backup** | Automatically backs up existing statusline before changes |
| 🔄 **Easy Restore** | One command to restore previous statusline |

---

### 📐 Display Modes

| Mode | Version | Lines | Bar Width | Best For |
|------|---------|-------|-----------|----------|
| **Compact** | 2.1.0 | 2 | 10 blocks | Narrow terminals, minimal info |
| **Default** | 2.1.0 | 2 | 10 blocks | Balanced information display |
| **Full** | 2.1.0 | 5 | 40 blocks | Detailed monitoring with cost, time, git sync |
| **Legacy** | 1.0.0 | 4 | 40 blocks | Classic design, simple gradients |

---

### 🖥️ Mode Examples

#### Compact Mode (2 lines)
> 최소한의 정보만 표시. 좁은 터미널에 적합.

```
🤖Opus 📂~/project 🌿(main)✅
🧠██████████ 5H██████████ 7D██████████
```

**표시 정보:** 모델(축약) | 경로(축약) | 브랜치 | Git 상태 아이콘 | Context/5H/7D 바

---

#### Default Mode (2 lines)
> 균형 잡힌 정보 표시. 일반적인 사용에 적합.

```
🤖 Claude Opus 4.5 | 🎨 learning | 📂 ~/project 🌿(main)✅
🧠 Context ██████████ 25% | 5H ██████████ 15% (3h42m) | 7D ██████████ 8% (Sun)
```

**표시 정보:** 모델 | Output Style | 경로 | 브랜치 | Git 상태 | Context % | 5H % (리셋시간) | 7D % (리셋요일)

---

#### Full Mode (5 lines)
> 모든 정보를 상세하게 표시. 개발 모니터링에 적합.

```
🤖 Claude Opus 4.5 | 🎨 learning | ✅ clean ↑1 | 🐍 base
📂 /Users/user/project 🌿(main) | 💰 0.15$ | ⏰ 5m
🧠 Context  ████████████████████████████████████████ 25% used (50k/200k)
🚀 5H Limit ████████████████████████████████████████ 15% (Resets in 3h42m)
⭐ 7D Limit ████████████████████████████████████████ 8% (Resets Jan 21 at 2pm)
```

**Line 1:** 모델 | Output Style | Git 상태 + ↑ahead ↓behind | Conda 환경
**Line 2:** 전체 경로 + 브랜치 | 세션 비용 | 세션 시간
**Line 3-5:** Context/5H/7D 40블록 바 + 퍼센트 + 상세 리셋 시간

---

#### Legacy Mode (4 lines)
> 1.0.0 버전의 클래식 디자인. 심플한 그라데이션.

```
🧠 Claude Opus 4.5 | ✅ clean | 🐍 base | 🎨 learning
📂 /Users/user/project 🌿(main)
📝 Context ████████████████████████████████████████ 25% used
🚀 Usage 5H ██████████ 15% (3h42m) | 7D ██████████ 8% (Sun)
```

**표시 정보:** 모델(이모지 다름) | Git 상태 | Conda | Style | 경로 | 브랜치 | Context 바 | 5H/7D 인라인

---

### 🌈 Gradient Colors

사용량에 따라 색상이 변하는 4단계 그라데이션:

| Bar | 0-40% | 40-80% | 80-100% |
|-----|-------|--------|---------|
| **🧠 Context** | Mocha Maroon (핑크) | Latte Maroon (진핑크) | Latte Red (빨강) |
| **🚀 5H Limit** | Mocha Lavender (연보라) | Latte Blue (파랑) | Latte Red (빨강) |
| **⭐ 7D Limit** | Mocha Yellow (노랑) | Latte Green (초록) | Latte Red (빨강) |

> 80% 이상이면 빨간색으로 경고!

---

### 🔧 Commands

#### `/awesome-statusline-start` - 설치 마법사

| 사용법 | 설명 |
|--------|------|
| `/awesome-statusline-start` | 대화형 설치 마법사 (버전 → 모드 → 설치방식 선택) |
| `/awesome-statusline-start compact` | Compact 모드 바로 설치 |
| `/awesome-statusline-start default` | Default 모드 바로 설치 |
| `/awesome-statusline-start full` | Full 모드 바로 설치 |
| `/awesome-statusline-start legacy` | Legacy 1.0.0 바로 설치 |
| `/awesome-statusline-start restore` | 가장 최근 백업에서 복원 |

#### `/awesome-statusline-mode` - 모드 변경

| 사용법 | 설명 |
|--------|------|
| `/awesome-statusline-mode` | 대화형 모드 선택 UI |
| `/awesome-statusline-mode compact` | Compact 모드로 변경 |
| `/awesome-statusline-mode default` | Default 모드로 변경 |
| `/awesome-statusline-mode full` | Full 모드로 변경 |
| `/awesome-statusline-mode legacy` | Legacy 모드로 변경 |
| `/awesome-statusline-mode restore` | 백업에서 복원 |

---

### 📊 Mode Comparison

| Feature | Compact | Default | Full | Legacy |
|---------|:-------:|:-------:|:----:|:------:|
| **Lines** | 2 | 2 | 5 | 4 |
| **Bar Width** | 10 | 10 | 40 | 40 (Context) / 10 (Usage) |
| **Model Name** | Short (Opus) | Full | Full | Full |
| **Output Style** | ❌ | ✅ | ✅ | ✅ |
| **Git Status** | Icon | Icon | Detailed (+N !N ?N) | Icon |
| **Git ↑↓ Sync** | ❌ | ❌ | ✅ | ❌ |
| **Conda Env** | ❌ | ❌ | ✅ | ✅ |
| **Session Cost** | ❌ | ❌ | ✅ | ❌ |
| **Session Duration** | ❌ | ❌ | ✅ | ❌ |
| **Reset Time** | ❌ | Short (3h42m) | Full (Resets in 3h42m) | Short |
| **Token Count** | ❌ | ❌ | ✅ (50k/200k) | ❌ |
| **% Bold+Gradient** | ❌ | ✅ | ✅ | ✅ |

---

### 📋 Information Icons

| Icon | Information | Compact | Default | Full | Legacy |
|:----:|-------------|:-------:|:-------:|:----:|:------:|
| 🤖/🧠/🎵/⚡️ | Model | ✅ | ✅ | ✅ | ✅ |
| 🎨 | Output Style | ❌ | ✅ | ✅ | ✅ |
| ✅/📝 | Git Status | ✅ | ✅ | ✅ | ✅ |
| ↑/↓ | Git Ahead/Behind | ❌ | ❌ | ✅ | ❌ |
| 🐍 | Conda Environment | ❌ | ❌ | ✅ | ✅ |
| 📂 | Directory Path | ✅ | ✅ | ✅ | ✅ |
| 🌿 | Git Branch | ✅ | ✅ | ✅ | ✅ |
| 💰 | Session Cost | ❌ | ❌ | ✅ | ❌ |
| ⏰ | Session Duration | ❌ | ❌ | ✅ | ❌ |
| 🧠 | Context Usage | ✅ | ✅ | ✅ | ✅ |
| 🚀 | 5H API Limit | ✅ | ✅ | ✅ | ✅ |
| ⭐ | 7D API Limit | ✅ | ✅ | ✅ | ✅ |

---

### 💾 Backup & Restore

설치/변경 시 기존 statusline을 자동 백업합니다.

```
~/.claude/statusline-backup-20250119_120000.sh   # 스크립트 백업
~/.claude/statusline-backup-20250119_120000.json # 설정 백업
```

복원 방법:
```bash
/awesome-statusline-start restore   # 또는
/awesome-statusline-mode restore
```

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
claude
```

### Step 4: Run Setup Wizard

```bash
/awesome-statusline-start
```

설치 마법사가 버전(2.1.0/1.0.0) → 모드(Compact/Default/Full/Legacy) → 설치방식을 안내합니다.

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

## 🔧 Requirements

- **Claude Code CLI** (latest version)
- **macOS** (Keychain access for OAuth token)
- **jq** (JSON parsing) - `brew install jq`

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
