---
name: awesome-statusline-mode
description: Awesome Statusline 2.0 모드를 변경합니다 (compact/default/full)
allowed-tools:
  - Read
  - Write
  - Edit
  - Bash
  - AskUserQuestion
argument-hint: "[compact|default|full]"
---

# Awesome Statusline Mode Switcher

Awesome Statusline 2.0의 모드를 변경합니다.

## 3가지 모드

| 모드 | 별칭 | 줄 수 | 바 크기 | 설명 |
|------|------|-------|---------|------|
| **compact** | short | 2줄 | 10블록 | 최소 정보, 좁은 터미널용 |
| **default** | - | 2줄 | 10블록 | 기본값, 균형잡힌 정보 |
| **full** | long | 5줄 | 20블록 | 상세 정보, 비용, 시간 포함 |

## 사용법

### 인자로 직접 지정
```
/awesome-statusline-mode compact   # Compact 모드로 변경
/awesome-statusline-mode default   # Default 모드로 변경 (기본값)
/awesome-statusline-mode full      # Full 모드로 변경
```

### 대화형 선택
```
/awesome-statusline-mode           # 모드 선택 UI 표시
```

## 처리 로직

### 1. 인자가 있는 경우

인자가 `compact`, `default`, `full` 중 하나면 바로 해당 모드로 변경:

1. 해당 스크립트를 `~/.claude/awesome-statusline.sh`로 복사
   - compact: `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline-compact.sh`
   - default: `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline-default.sh`
   - full: `${CLAUDE_PLUGIN_ROOT}/scripts/awesome-statusline-full.sh`

2. 실행 권한 부여: `chmod +x ~/.claude/awesome-statusline.sh`

3. `~/.claude/settings.json`의 `statusLine` 설정 확인/업데이트:
   ```json
   "statusLine": {
     "type": "command",
     "command": "~/.claude/awesome-statusline.sh"
   }
   ```

4. 완료 메시지 표시

### 2. 인자가 없는 경우

AskUserQuestion으로 모드 선택:

```
어떤 Statusline 모드를 사용하시겠습니까?

[Compact (Short)] - 2줄, 최소 정보
[Default] - 2줄, 기본값 (권장)
[Full (Long)] - 5줄, 상세 정보
```

선택 후 위와 동일하게 처리

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
