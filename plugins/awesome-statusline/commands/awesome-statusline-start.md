---
name: awesome-statusline-start
description: Awesome Statusline 설치 마법사 - 버전, 모드, 커스터마이징 선택
allowed-tools:
  - Read
  - Write
  - Edit
  - Bash
  - AskUserQuestion
argument-hint: "[compact|default|full|legacy|restore]"
---

# Awesome Statusline Setup Wizard

Claude Code의 Awesome Statusline을 설치하는 대화형 마법사입니다.

## 버전 정보

| 버전 | 모드 | 설명 |
|------|------|------|
| **2.0.0** (기본) | Compact / Default / Full | 새로운 3-mode 시스템, 40블록 바, 4단계 그라데이션 |
| **1.0.0** (Legacy) | Single | 기존 단일 모드, 심플한 디자인 |

## 2.0.0 모드 상세

| 모드 | 줄 수 | 바 크기 | 설명 |
|------|-------|---------|------|
| **Compact** | 2줄 | 10블록 | 최소 정보, 좁은 터미널용 |
| **Default** | 2줄 | 20블록 | 균형잡힌 정보 |
| **Full** | 5줄 | 40블록 | 상세 정보, 비용, 시간, 커스텀 그라데이션 |

## 설정 플로우

### Step 1: 버전 선택

AskUserQuestion으로 물어봅니다:

```
어떤 버전을 설치하시겠습니까?

[2.0.0 (Recommended)] - 3-mode 시스템, 새로운 디자인
[1.0.0 Legacy] - 기존 심플 디자인
```

### Step 2a: 2.0.0 선택 시 - 모드 선택

```
어떤 모드로 시작하시겠습니까?

[Compact (Short)] - 2줄, 최소 정보
[Default (Recommended)] - 2줄, 균형잡힌 정보
[Full (Long)] - 5줄, 상세 정보
```

### Step 2b: 모드 선택 후 - 설치 방식

```
설치 방식을 선택하세요:

[기본 설치 (Recommended)] - 선택한 모드 바로 설치
[커스터마이즈] - 색상, 표시 정보 등 커스텀 설정
```

### Step 2c: 1.0.0 Legacy 선택 시

바로 Legacy 스크립트 설치:
- `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline.sh`를 `~/.claude/awesome-statusline.sh`로 복사

## 처리 로직

### 인자 처리

| 인자 | 동작 |
|------|------|
| (없음) | 대화형 버전/모드 선택 시작 |
| `compact` | 2.0.0 Compact 모드 바로 설치 |
| `default` | 2.0.0 Default 모드 바로 설치 |
| `full` | 2.0.0 Full 모드 바로 설치 |
| `legacy` 또는 `1.0.0` | 1.0.0 Legacy 바로 설치 |
| `restore` | 가장 최근 백업에서 복원 |

### 설치 경로

**2.0.0 버전:**
- Compact: `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline-compact.sh`
- Default: `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline-default.sh`
- Full: `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline-full.sh`

**1.0.0 Legacy:**
- `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline.sh`

모든 버전은 `~/.claude/awesome-statusline.sh`로 복사됩니다.

### settings.json 업데이트

```json
"statusLine": {
  "type": "command",
  "command": "~/.claude/awesome-statusline.sh"
}
```

## 기존 설정 백업

기존 statusline이 있으면 자동 백업:

```bash
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
EXISTING_SCRIPT=$(jq -r '.statusLine.command // empty' ~/.claude/settings.json)
if [[ -n "$EXISTING_SCRIPT" && -f "${EXISTING_SCRIPT/#\~/$HOME}" ]]; then
    cp "${EXISTING_SCRIPT/#\~/$HOME}" ~/.claude/statusline-backup-${TIMESTAMP}.sh
fi
jq '.statusLine' ~/.claude/settings.json > ~/.claude/statusline-backup-${TIMESTAMP}.json
```

## 예시 대화

### 기본 설치 (2.0.0)
```
사용자: /awesome-statusline-start

Claude: 안녕하세요! Awesome Statusline 설치 마법사입니다.

        어떤 버전을 설치하시겠습니까?

        [2.0.0 (Recommended)] [1.0.0 Legacy]

사용자: 2.0.0

Claude: 어떤 모드로 시작하시겠습니까?

        [Compact] [Default (Recommended)] [Full]

사용자: Full

Claude: 설치 방식을 선택하세요:

        [기본 설치 (Recommended)] [커스터마이즈]

사용자: 기본 설치

Claude: ✅ Awesome Statusline 2.0.0 Full 모드가 설치되었습니다!

        📁 스크립트: ~/.claude/awesome-statusline.sh
        🎨 모드: Full (5줄, 40블록 바)

        🔄 Claude Code를 재시작하면 적용됩니다.

        💡 모드 변경: /awesome-statusline-mode
```

### Legacy 설치
```
사용자: /awesome-statusline-start legacy

Claude: ✅ Awesome Statusline 1.0.0 Legacy가 설치되었습니다!

        📁 스크립트: ~/.claude/awesome-statusline.sh
        🎨 버전: 1.0.0 (Classic Design)

        🔄 Claude Code를 재시작하면 적용됩니다.

        💡 2.0.0으로 업그레이드: /awesome-statusline-start 2.0
```

### 커스터마이즈 선택 시

**테마 선택:**
- Catppuccin Mocha (기본, 다크 테마)
- Catppuccin Latte (라이트 테마)
- 사용자 정의

**표시할 정보 선택 (multiSelect):**
- 모델 정보 (🧠 Opus, 🎵 Sonnet, ⚡️ Haiku)
- Git 상태 (✅ clean / 🚧 dirty)
- Conda 환경 (🐍 env-name)
- Output Style (🎨 learning)
- 디렉토리 경로 (📂 path)
- Git 브랜치 (🌿 branch)
- Context 사용량 (📝 progress bar)
- API 사용량 (🚀 5H/7D progress bars)

**프로그레스 바 스타일:**
- 그라데이션 (기본)
- 단색
- 미니멀

## 복원 (Restore)

```
사용자: /awesome-statusline-start restore

Claude: 📦 백업 파일을 찾았습니다:
        1. statusline-backup-20250119_052500.sh (가장 최근)
        2. statusline-backup-20250118_143000.sh

        [가장 최근 백업으로 복원] [목록에서 선택]
```

## 중요 사항

- 기존 statusline은 자동으로 백업됩니다
- 백업 위치: `~/.claude/statusline-backup-{timestamp}.*`
- 모드 변경은 `/awesome-statusline-mode` 사용
- Claude Code 재시작 후 적용됩니다
