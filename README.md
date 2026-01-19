<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</p>

<h1 align="center">
  <br>
  <pre>
   ___                                        _____ __        __            ___
  / _ |_    _____ ___ ___  __ _  ___   ___   / ___// /_____ _/ /___ _____ _/ (_)___  ___
 / __ | |/|/ / -_|_-&lt;/ _ \/  ' \/ -_) (_-&lt;   \__ \/ __/ __ `/ __/ // / -_) / / _ \/ -_)
/_/ |_|__,__/\__/___/\___/_/_/_/\__/ /___/  ___/ /\__/\_,_/\__/\_,_/\__/_/_/_//_/\__/
                                          /____/
  </pre>
  <br>
</h1>

<p align="center">
  <strong>🎨 Claude Code를 위한 아름다운 Catppuccin 테마 Statusline</strong>
</p>

<p align="center">
  <a href="#-데모">데모</a> ·
  <a href="#-빠른-설치">설치</a> ·
  <a href="#-모드">모드</a> ·
  <a href="#-명령어">명령어</a> ·
  <a href="#-기능">기능</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-2.1.0-blue?style=flat-square" alt="Version"/>
  <img src="https://img.shields.io/badge/Claude%20Code-Plugin-blueviolet?style=flat-square" alt="Claude Code Plugin"/>
  <img src="https://img.shields.io/badge/theme-Catppuccin%20Mocha-f5c2e7?style=flat-square" alt="Catppuccin Mocha"/>
  <img src="https://img.shields.io/badge/license-MIT-green?style=flat-square" alt="License"/>
</p>

---

## 🎬 데모

### Full 모드 (5줄, 40블록 바)
> 상세 모니터링에 적합. 비용, 시간, Git 동기화 상태까지 한눈에.

```
🤖 Claude Opus 4.5 | 🎨 learning | ✅ clean ↑1 | 🐍 base
📂 /Users/user/my-project 🌿(main) | 💰 0.15$ | ⏰ 5m
🧠 Context  ████████████████████████████████████████ 25% used (50k/200k)
🚀 5H Limit ████████████████████████████████████████ 15% (Resets in 3h42m)
⭐ 7D Limit ████████████████████████████████████████ 8% (Resets Jan 21 at 2pm)
```

### Default 모드 (2줄, 10블록 바)
> 균형 잡힌 정보량. 일반적인 사용에 적합.

```
🤖 Claude Opus 4.5 | 🎨 learning | 📂 ~/project 🌿(main)✅
🧠 Context ██████████ 25% | 5H ██████████ 15% (3h42m) | 7D ██████████ 8% (Sun)
```

### Compact 모드 (2줄, 10블록 바)
> 최소한의 정보. 좁은 터미널에 적합.

```
🤖Opus 📂~/project 🌿(main)✅
🧠██████████ 5H██████████ 7D██████████
```

### Legacy 모드 (4줄, 클래식 디자인)
> 1.0.0 버전의 심플한 디자인.

```
🧠 Claude Opus 4.5 | ✅ clean | 🐍 base | 🎨 learning
📂 /Users/user/project 🌿(main)
📝 Context ████████████████████████████████████████ 25% used
🚀 Usage 5H ██████████ 15% (3h42m) | 7D ██████████ 8% (Sun)
```

---

## 🚀 빠른 설치

### 1단계: 마켓플레이스 추가
```bash
/plugin marketplace add awesomejun/awesome-claude-plugins
```

### 2단계: 플러그인 설치
```bash
/plugin install awesome-statusline@awesome-claude-plugins
```

### 3단계: Claude Code 재시작
```bash
claude
```

### 4단계: 설치 마법사 실행
```bash
/awesome-statusline-start
```

> 💡 마법사가 버전 → 모드 → 설치 방식을 안내합니다!

---

## 📊 모드

| 모드 | 줄 수 | 바 크기 | 추천 용도 |
|:----:|:-----:|:-------:|-----------|
| **Compact** | 2줄 | 10블록 | 좁은 터미널, 최소 정보 |
| **Default** | 2줄 | 10블록 | 일반 사용, 균형 잡힌 정보 |
| **Full** | 5줄 | 40블록 | 상세 모니터링, 개발자용 |
| **Legacy** | 4줄 | 40/10블록 | 클래식 디자인 선호자 |

### 모드별 기능 비교

| 기능 | Compact | Default | Full | Legacy |
|------|:-------:|:-------:|:----:|:------:|
| 모델명 | 축약 (Opus) | 전체 (Claude Opus 4.5) | 전체 | 전체 |
| Output Style | ❌ | ✅ | ✅ | ✅ |
| Git 상태 | 아이콘 | 아이콘 | 상세 (+N !N ?N) | 아이콘 |
| Git ↑↓ 동기화 | ❌ | ❌ | ✅ | ❌ |
| Conda 환경 | ❌ | ❌ | ✅ | ✅ |
| 세션 비용 | ❌ | ❌ | ✅ (💰 1.23$) | ❌ |
| 세션 시간 | ❌ | ❌ | ✅ (⏰ 12m) | ❌ |
| 토큰 수 | ❌ | ❌ | ✅ (105k/200k) | ❌ |
| 리셋 시간 표시 | ❌ | 축약 (3h42m) | 상세 (Resets in 3h42m) | 축약 |
| % 볼드+그라데이션 | ❌ | ✅ | ✅ | ✅ |

---

## 🔧 명령어

### `/awesome-statusline-start` — 설치 마법사

| 명령어 | 설명 |
|--------|------|
| `/awesome-statusline-start` | 대화형 설치 (버전 → 모드 → 설치방식) |
| `/awesome-statusline-start compact` | Compact 모드 즉시 설치 |
| `/awesome-statusline-start default` | Default 모드 즉시 설치 |
| `/awesome-statusline-start full` | Full 모드 즉시 설치 |
| `/awesome-statusline-start legacy` | Legacy 1.0.0 즉시 설치 |
| `/awesome-statusline-start restore` | 백업에서 복원 |

### `/awesome-statusline-mode` — 모드 변경

| 명령어 | 설명 |
|--------|------|
| `/awesome-statusline-mode` | 대화형 모드 선택 |
| `/awesome-statusline-mode compact` | Compact로 변경 |
| `/awesome-statusline-mode default` | Default로 변경 |
| `/awesome-statusline-mode full` | Full로 변경 |
| `/awesome-statusline-mode legacy` | Legacy로 변경 |
| `/awesome-statusline-mode restore` | 백업에서 복원 |

---

## ✨ 기능

### 🎨 Catppuccin Mocha 테마
아름다운 Catppuccin Mocha 다크 테마 색상 팔레트 적용.

### 🌈 4단계 그라데이션 프로그레스 바
사용량에 따라 색상이 변하는 직관적인 시각화 (Catppuccin 테마):

| 바 | 0-40% | 40-80% | 80-100% |
|:--:|:-----:|:------:|:-------:|
| 🧠 **Context** | Mocha Maroon | Latte Maroon | 🔴 Latte Red |
| 🚀 **5H Limit** | Mocha Lavender | Latte Blue | 🔴 Latte Red |
| ⭐ **7D Limit** | Mocha Yellow | Latte Green | 🔴 Latte Red |

> ⚠️ 80% 이상이면 빨간색 경고! 퍼센트 숫자는 그라데이션 끝 색상과 동일 + 볼드 처리

### ↑↓ Git Ahead/Behind 표시 (Full 모드)
로컬 브랜치가 원격 대비 몇 커밋 앞서거나 뒤처져 있는지 표시:
- `↑1` — 로컬이 1커밋 앞섬 (push 필요)
- `↓2` — 원격이 2커밋 앞섬 (pull 필요)
- `↑1↓2` — 로컬 1커밋 앞섬, 원격 2커밋 앞섬

### 💾 자동 백업 & 복원
- 설치/변경 시 기존 statusline 자동 백업
- `~/.claude/statusline-backup-{timestamp}.sh`
- `/awesome-statusline-start restore`로 복원

### 🚀 실시간 API 사용량
- **5시간 제한** — 리셋까지 남은 시간 표시 (예: 3h42m)
- **7일 제한** — 리셋 날짜 표시 (예: Jan 21 at 2pm)

---

## 📋 표시 정보

| 아이콘 | 정보 | Compact | Default | Full | Legacy |
|:------:|------|:-------:|:-------:|:----:|:------:|
| 🤖 | 모델 (Opus/Sonnet/Haiku) | ✅ | ✅ | ✅ | ✅ |
| 🎨 | Output Style | ❌ | ✅ | ✅ | ✅ |
| ✅/📝 | Git 상태 (clean/dirty) | ✅ | ✅ | ✅ | ✅ |
| ↑/↓ | Git Ahead/Behind | ❌ | ❌ | ✅ | ❌ |
| 🐍 | Conda 환경 | ❌ | ❌ | ✅ | ✅ |
| 📂 | 디렉토리 경로 | ✅ | ✅ | ✅ | ✅ |
| 🌿 | Git 브랜치 | ✅ | ✅ | ✅ | ✅ |
| 💰 | 세션 비용 | ❌ | ❌ | ✅ | ❌ |
| ⏰ | 세션 시간 | ❌ | ❌ | ✅ | ❌ |
| 🧠 | Context 사용량 | ✅ | ✅ | ✅ | ✅ |
| 🚀 | 5시간 API 제한 | ✅ | ✅ | ✅ | ✅ |
| ⭐ | 7일 API 제한 | ✅ | ✅ | ✅ | ✅ |

---

## 📦 마켓플레이스 명령어

```bash
# 플러그인 목록 보기
/plugin marketplace list

# 마켓플레이스 업데이트
/plugin marketplace update awesome-claude-plugins

# 마켓플레이스 제거
/plugin marketplace remove awesome-claude-plugins
```

---

## ⚙️ 요구 사항

| 항목 | 설명 |
|------|------|
| **Claude Code CLI** | 최신 버전 권장 |
| **macOS** | Keychain을 통한 OAuth 토큰 접근 |
| **jq** | JSON 파싱 (`brew install jq`) |

---

## 🛠️ 플러그인 개발자용

이 마켓플레이스에 플러그인을 추가하고 싶으신가요?

1. 이 저장소를 Fork
2. `plugins/` 디렉토리에 플러그인 추가
3. `.claude-plugin/marketplace.json`에 플러그인 정보 추가
4. Pull Request 제출

---

## 📄 라이선스

MIT License — 자유롭게 사용하고 기여해주세요!

---

<p align="center">
  Made with 💜 by <a href="https://github.com/awesomejun">@awesomejun</a>
</p>

<p align="center">
  <sub>Powered by <a href="https://github.com/catppuccin/catppuccin">Catppuccin</a> 🐱</sub>
</p>
