<p align="center">
  <img src="plugins/awesome-statusline/assets/hero.jpeg" alt="Awesome Statusline" width="100%"/>
</p>

<h1 align="center">Awesome Claude Plugins</h1>

<p align="center">
  <strong>🎨 Claude Code를 위한 아름다운 플러그인 마켓플레이스</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Claude%20Code-Plugin%20Marketplace-blueviolet?style=flat-square" alt="Claude Code Plugin Marketplace"/>
  <img src="https://img.shields.io/badge/theme-Catppuccin%20Mocha-f5c2e7?style=flat-square" alt="Catppuccin Mocha"/>
  <img src="https://img.shields.io/badge/license-MIT-green?style=flat-square" alt="License"/>
</p>

<p align="center">
  <a href="#-플러그인-목록">플러그인 목록</a> ·
  <a href="#-빠른-시작">빠른 시작</a> ·
  <a href="#-awesome-statusline">Awesome Statusline</a> ·
  <a href="#-마켓플레이스-명령어">마켓플레이스 명령어</a>
</p>

---

## 📦 플러그인 목록

| 플러그인 | 버전 | 설명 |
|---------|------|------|
| [**Awesome Statusline**](plugins/awesome-statusline) | v2.1.0 | Catppuccin 테마 Statusline + 실시간 API 모니터링 |

---

## 🚀 빠른 시작

<p align="center">
  <img src="plugins/awesome-statusline/assets/install-demo.gif" alt="Installation Demo" width="100%"/>
</p>

### 1단계: Claude Code 실행
터미널에서 Claude Code CLI를 실행합니다:
```bash
claude
```

### 2단계: 마켓플레이스 추가
Claude Code 내에서 아래 슬래시 커맨드를 입력합니다:
```
/plugin marketplace add awesomejun/awesome-claude-plugins
```

### 3단계: 플러그인 설치
동일하게 Claude Code 내에서 설치 명령어를 입력합니다:
```
/plugin install awesome-statusline@awesome-claude-plugins
```

### 4단계: 설치 마법사 실행
설치가 완료되면 마법사를 통해 원하는 모드를 선택합니다:
```
/awesome-statusline-start
```

> 💡 마법사가 버전 → 모드 → 설치 방식을 단계별로 안내합니다!

---

## 🎨 Awesome Statusline

<table>
<tr>
<td width="60">✨</td>
<td><strong>코딩할 때 "간지"가 중요하신 분</strong></td>
</tr>
<tr>
<td>😮‍💨</td>
<td><strong><code>/context</code>, <code>/usage</code> 들어가서 사용량 체크하기 귀찮으신 분</strong></td>
</tr>
<tr>
<td>🖥️</td>
<td><strong>CLI를 쓰지만 GUI의 갬성을 버릴 수 없는 분</strong></td>
</tr>
</table>

> **Awesome Statusline**은 이런 분들을 위해 만들어졌습니다!

<p align="center">
  <img src="plugins/awesome-statusline/assets/feature-overview.jpeg" alt="Awesome Statusline Feature Overview" width="100%"/>
</p>

**Catppuccin 테마**의 아름다운 그라데이션 프로그레스 바로 **Context**, **5H/7D API 제한**을 실시간으로 모니터링하세요. 더 이상 슬래시 커맨드를 입력할 필요 없이, 터미널 상단에서 한눈에 모든 정보를 확인할 수 있습니다.

### ✨ 주요 기능

| | 기능 | 설명 |
|:--:|------|------|
| 🌈 | **Catppuccin 테마** | 아름다운 4단계 그라데이션 프로그레스 바 |
| 📊 | **실시간 모니터링** | 모델, Git 상태, Context 사용량, API 제한 (5H/7D) |
| 🔄 | **간편한 모드 전환** | `/awesome-statusline-mode` 명령어로 즉시 변경 |
| 🎨 | **4가지 디스플레이 모드** | Compact, Default, Full, Legacy |
| 🛠️ | **커스터마이징** | 쉘 스크립트 기반으로 자유롭게 수정 가능 |
| 💾 | **자동 백업** | 기존 statusline 자동 백업 및 복원 지원 |

---

## 📐 디스플레이 모드

### Full 모드 (5줄, 40블록 바)

가장 상세한 정보를 제공하는 모드입니다. **세션 비용**, **경과 시간**, **Git 동기화 상태(ahead/behind)**, **가상 환경**, 그리고 **정확한 토큰 수(94k/200k)**까지 모든 정보를 한눈에 볼 수 있습니다. 넓은 터미널에서 개발 현황을 완벽하게 파악하고 싶은 사용자에게 추천합니다.

<p align="center">
  <img src="plugins/awesome-statusline/assets/demo-full.png" alt="Full Mode"/>
</p>

```bash
# 바로 설치
/awesome-statusline-start full

# 모드 변경
/awesome-statusline-mode full
```

<details>
<summary>📌 Full 모드 상세 설명</summary>

| 항목 | 표시 | 의미 |
|------|------|------|
| `📝 +2 !1` | Git 상태 | 2개 staged, 1개 modified |
| `↑3` | Ahead | 3커밋 push 필요 |
| `🐍 base` | 가상 환경 | 활성화된 환경 |
| `💰 2.47$` | 비용 | 세션 누적 비용 |
| `⏰ 35m` | 시간 | 세션 경과 시간 |
| `94k/200k` | 토큰 | 현재/최대 컨텍스트 |

</details>

---

### Default 모드 (2줄, 10블록 바)

균형 잡힌 정보량을 제공하는 표준 모드입니다. **모델명**, **Output Style**, **Git 브랜치/상태**, **Context/5H/7D 사용량**을 2줄에 압축하여 보여줍니다. 리셋 시간도 `(12m)`, `(Fri)` 형태로 간결하게 표시됩니다. 대부분의 사용자에게 권장하는 기본 모드입니다.

<p align="center">
  <img src="plugins/awesome-statusline/assets/demo-default.png" alt="Default Mode"/>
</p>

```bash
# 바로 설치
/awesome-statusline-start default

# 모드 변경
/awesome-statusline-mode default
```

<details>
<summary>📌 Default 모드 상세 설명</summary>

| 항목 | 표시 | 의미 |
|------|------|------|
| `✅` | Git 상태 | clean (변경 없음) |
| `38%` | Context | 컨텍스트 사용률 |
| `89%` | 5H | ⚠️ 5시간 제한 임박! |
| `(12m)` | 리셋 | 12분 후 5H 리셋 |
| `(Fri)` | 7D 리셋 | 금요일에 리셋 |

</details>

---

### Compact 모드 (2줄, 10블록 바)

최소한의 공간에 핵심 정보만 표시하는 모드입니다. 모델명은 **Opus**처럼 축약되고, 퍼센트 숫자 없이 **프로그레스 바만** 표시됩니다. 좁은 터미널 창이나 화면 분할 환경에서 공간을 절약하면서도 사용량을 시각적으로 파악하고 싶을 때 적합합니다.

<p align="center">
  <img src="plugins/awesome-statusline/assets/demo-compact.png" alt="Compact Mode"/>
</p>

```bash
# 바로 설치
/awesome-statusline-start compact

# 모드 변경
/awesome-statusline-mode compact
```

<details>
<summary>📌 Compact 모드 상세 설명</summary>

| 항목 | 표시 | 의미 |
|------|------|------|
| `Opus` | 모델 | 축약 표시 |
| `📝` | Git | dirty (변경 있음) |
| 바만 표시 | 사용량 | % 숫자 없이 시각화만 |

</details>

---

### Legacy 모드 (4줄, 클래식 디자인)

v1.0.2의 오리지널 디자인을 유지하는 클래식 모드입니다. 40블록의 넓은 Context 바와 10블록의 Usage 바 조합, **가상 환경** 표시, 그리고 심플한 2단계 그라데이션 색상이 특징입니다. 기존 버전에 익숙하거나 클래식한 디자인을 선호하는 사용자에게 추천합니다.

<p align="center">
  <img src="plugins/awesome-statusline/assets/demo-legacy.png" alt="Legacy Mode"/>
</p>

```bash
# 바로 설치
/awesome-statusline-start legacy

# 모드 변경
/awesome-statusline-mode legacy
```

<details>
<summary>📌 Legacy 모드 상세 설명</summary>

| 항목 | 표시 | 의미 |
|------|------|------|
| `Sonnet 4` | 모델 | 다른 모델 예시 |
| `🎨 explanatory` | 스타일 | Output Style |
| `73%` | Context | 컨텍스트 사용률 |
| `(2h31m)` | 5H 리셋 | 2시간 31분 후 |
| `(Mon)` | 7D 리셋 | 월요일에 리셋 |

</details>

---

## 📊 모드 비교

| 기능 | Compact | Default | Full | Legacy |
|------|:-------:|:-------:|:----:|:------:|
| **줄 수** | 2 | 2 | 5 | 4 |
| **바 너비** | 10블록 | 10블록 | 40블록 | 40블록 |
| **모델명** | 축약 (Opus) | 전체 (Opus 4.5) | 전체 (Opus 4.5) | 전체 (Opus 4.5) |
| **Output Style** | ❌ | ✅ | ✅ | ✅ |
| **Git 상태** | ✅ | ✅ | ✅ | ✅ |
| **Git 세부상태** (+N !N ?N) | ❌ | ❌ | ✅ | ❌ |
| **Git ↑↓** (ahead/behind) | ❌ | ❌ | ✅ | ❌ |
| **가상 환경** | ❌ | ❌ | ✅ | ✅ |
| **세션 비용** (💰) | ❌ | ❌ | ✅ | ❌ |
| **세션 시간** (⏰) | ❌ | ❌ | ✅ | ❌ |
| **리셋 시간** | ❌ | 축약 (1h2m) | 전체 | 축약 |
| **그라데이션 바** | ✅ | ✅ | ✅ | ✅ |
| **% Bold 색상** | ❌ | ✅ | ✅ | ✅ |

---

## 🌈 그라데이션 색상

### 2.1.0 모드 (Compact, Default, Full)

사용량에 따라 4단계로 색상이 변화합니다:

| 바 | 0-40% | 40-80% | 80-100% |
|-----|-------|--------|---------|
| **Context** | Mocha Maroon | Latte Maroon | 🔴 Latte Red |
| **5H Limit** | Mocha Lavender | Latte Blue | 🔴 Latte Red |
| **7D Limit** | Mocha Yellow | Latte Green | 🔴 Latte Red |

> ⚠️ **80% 이상이면 빨간색 경고!** 사용량 관리에 즉각적인 피드백 제공

### 1.0.2 Legacy

| 바 | 0-50% | 50-100% |
|-----|-------|---------|
| **Context** | Latte Yellow | Latte Red → Mauve |
| **Usage (5H/7D)** | Mocha Green | Latte Teal → Blue |

---

## 🔧 명령어

### `/awesome-statusline-start` — 설치 마법사

| 명령어 | 설명 |
|--------|------|
| `/awesome-statusline-start` | 대화형 설치 (버전 → 모드 → 설치방식) |
| `/awesome-statusline-start compact` | Compact 모드 즉시 설치 |
| `/awesome-statusline-start default` | Default 모드 즉시 설치 |
| `/awesome-statusline-start full` | Full 모드 즉시 설치 |
| `/awesome-statusline-start legacy` | Legacy 1.0.2 즉시 설치 |
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

## 📦 마켓플레이스 명령어

Claude Code 내에서 아래 명령어들을 사용할 수 있습니다:

```bash
# 마켓플레이스 추가
/plugin marketplace add awesomejun/awesome-claude-plugins

# 플러그인 설치
/plugin install awesome-statusline@awesome-claude-plugins

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
