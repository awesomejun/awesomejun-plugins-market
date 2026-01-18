---
name: awesome-statusline-mode
description: Awesome Statusline 모드를 변경합니다 (compact/default/full/legacy)
allowed-tools:
  - Read
  - Write
  - Edit
  - Bash
  - AskUserQuestion
argument-hint: "[compact|default|full|legacy|restore]"
---

# Awesome Statusline Mode Switcher

Awesome Statusline의 모드를 변경합니다.

## 모드 종류

### 2.0.0 모드 (3가지)

| 모드 | 줄 수 | 바 크기 | 설명 |
|------|-------|---------|------|
| **compact** | 2줄 | 10블록 | 최소 정보, 좁은 터미널용 |
| **default** | 2줄 | 20블록 | 기본값, 균형잡힌 정보 |
| **full** | 5줄 | 40블록 | 상세 정보, 비용, 시간, 커스텀 그라데이션 |

### 1.0.0 Legacy

| 모드 | 줄 수 | 설명 |
|------|-------|------|
| **legacy** | 4줄 | 기존 심플 디자인 (1.0.0) |

## 인자 처리

| 인자 | 동작 |
|------|------|
| (없음) | 대화형 모드 선택 |
| `compact` | 2.0.0 Compact 모드로 변경 |
| `default` | 2.0.0 Default 모드로 변경 |
| `full` | 2.0.0 Full 모드로 변경 |
| `legacy` 또는 `1.0.0` | 1.0.0 Legacy 모드로 변경 |
| `restore` | 가장 최근 백업에서 복원 |

## 사용법

### 인자로 직접 지정
```
/awesome-statusline-mode compact   # Compact 모드로 변경
/awesome-statusline-mode default   # Default 모드로 변경
/awesome-statusline-mode full      # Full 모드로 변경
/awesome-statusline-mode legacy    # 1.0.0 Legacy로 변경
/awesome-statusline-mode restore   # 백업에서 복원
```

### 대화형 선택
```
/awesome-statusline-mode           # 모드 선택 UI 표시
```

## 처리 로직

### 1. 인자가 있는 경우

인자에 따라 해당 스크립트를 `~/.claude/awesome-statusline.sh`로 복사:

| 인자 | 소스 스크립트 |
|------|---------------|
| `compact` | `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline-compact.sh` |
| `default` | `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline-default.sh` |
| `full` | `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline-full.sh` |
| `legacy` / `1.0.0` | `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline.sh` |

실행 권한 부여 후 완료 메시지 표시.

### 2. 인자가 없는 경우

AskUserQuestion으로 모드 선택:

```
어떤 Statusline 모드를 사용하시겠습니까?

[Compact] - 2줄, 최소 정보
[Default (Recommended)] - 2줄, 균형잡힌 정보
[Full] - 5줄, 상세 정보
[Legacy 1.0.0] - 기존 심플 디자인
```

선택 후 해당 스크립트 복사

### 3. restore 인자

가장 최근 백업 파일에서 복원:
- `~/.claude/statusline-backup-*.sh` 검색
- 가장 최근 파일을 `~/.claude/awesome-statusline.sh`로 복사

## 예시 대화

### 인자 사용
```
사용자: /awesome-statusline-mode compact

Claude: ✅ Statusline 모드가 **Compact (Short)**로 변경되었습니다!

        📁 스크립트: ~/.claude/awesome-statusline.sh

        🔄 Claude Code를 재시작하면 적용됩니다.

        미리보기:
        🤖Opus 📂~/projects/my-app 🌿(main)✅
        🧠█████░░░░░ 5H██████░░░░ 7D████░░░░░░
```

### 대화형 선택
```
사용자: /awesome-statusline-mode

Claude: 어떤 Statusline 모드를 사용하시겠습니까?

        [Compact (Short)] [Default - 권장] [Full (Long)]

사용자: Full

Claude: ✅ Statusline 모드가 **Full (Long)**로 변경되었습니다!

        📁 스크립트: ~/.claude/awesome-statusline.sh

        🔄 Claude Code를 재시작하면 적용됩니다.

        미리보기:
        🤖 Opus 4.5 | ✅ clean | 🐍 base | 🎨 Learning
        📂 /Users/user/projects/my-app 🌿(main) | 💰 1.23$ | ⏰ 12m
        🧠 Context  ████████████░░░░░░░░ 56% used (105k/200k)
        🚀 Usage 5H ██████████████░░░░░░ 67% (Reset 1h32m left)
        ⭐ Usage 7D ████████░░░░░░░░░░░░ 35% (Reset Wed 13:59)
```

## 중요 사항

- 모드 변경 시 기존 커스텀 스크립트는 덮어씌워집니다
- 커스텀 수정을 유지하려면 백업 후 변경하세요
- Claude Code 재시작 후 적용됩니다
