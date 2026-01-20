---
name: awesome-statusline-remove
description: Awesome Statusline 설정 해제 및 삭제
allowed-tools:
  - Read
  - Edit
  - Bash
  - AskUserQuestion
argument-hint: "[settings|all]"
---

# Awesome Statusline 삭제/해제

Awesome Statusline을 비활성화하거나 완전히 제거합니다.

## 처리 로직

### 인자 처리

| 인자 | 동작 |
|------|------|
| (없음) | 대화형으로 선택 |
| `settings` | 설정만 해제 (스크립트 유지) |
| `all` | 완전 삭제 (설정 + 스크립트 + 백업) |

### 대화형 선택

```
어떻게 처리할까요?

[설정만 해제] - 스크립트는 유지, 나중에 다시 활성화 가능
[완전 삭제] - 설정 + 스크립트 + 백업 모두 삭제
```

## 실행 내용

### 설정만 해제 (settings)

`~/.claude/settings.json`에서 `statusLine` 항목만 제거:

```bash
jq 'del(.statusLine)' ~/.claude/settings.json > ~/.claude/settings.tmp && mv ~/.claude/settings.tmp ~/.claude/settings.json
```

**결과:**
- 기본 Claude Code 상태 표시줄로 복원
- `~/.claude/awesome-statusline.sh`는 유지 (재활성화 가능)

### 완전 삭제 (all)

```bash
# 1. 설정에서 statusLine 제거
jq 'del(.statusLine)' ~/.claude/settings.json > ~/.claude/settings.tmp && mv ~/.claude/settings.tmp ~/.claude/settings.json

# 2. 스크립트 파일 삭제
rm -f ~/.claude/awesome-statusline.sh

# 3. 백업 파일 삭제
rm -f ~/.claude/statusline-backup-*
```

**결과:**
- 기본 Claude Code 상태 표시줄로 복원
- 모든 관련 파일 삭제

## 예시 대화

### 대화형
```
사용자: /awesome-statusline-remove

Claude: 어떻게 처리할까요?

        [설정만 해제] [완전 삭제]

사용자: 설정만 해제

Claude: ✅ Statusline 설정이 해제되었습니다.

        📁 스크립트는 유지됨: ~/.claude/awesome-statusline.sh
        💡 다시 활성화: /awesome-statusline-start

        🔄 Claude Code를 재시작하면 적용됩니다.
```

### 빠른 실행
```
사용자: /awesome-statusline-remove all

Claude: ✅ Awesome Statusline이 완전히 삭제되었습니다.

        삭제된 항목:
        - settings.json의 statusLine 설정
        - ~/.claude/awesome-statusline.sh
        - ~/.claude/statusline-backup-* (2개)

        🔄 Claude Code를 재시작하면 적용됩니다.
```

## 중요 사항

- Claude Code 재시작 후 변경사항이 적용됩니다
- "설정만 해제"는 나중에 `/awesome-statusline-start`로 다시 활성화 가능
- "완전 삭제" 후에는 처음부터 다시 설치해야 합니다
