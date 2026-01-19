#!/bin/bash
# ============================================================================
# Awesome Statusline - COMPACT (Short) Mode
# ============================================================================
# Line 1: 🤖Model 📂path 🌿(branch)✅
# Line 2: 🧠bar 5Hbar 7Dbar
# ============================================================================

input=$(cat)

# Parse JSON input
MODEL=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
CURRENT_DIR=$(echo "$input" | jq -r '.workspace.current_dir // "."')
CONTEXT_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')
CURRENT_USAGE=$(echo "$input" | jq -r '.context_window.current_usage // null')

# ============================================================================
# Colors
# ============================================================================
RESET="\033[0m"
BOLD="\033[1m"

cat_teal() { echo -e "\033[38;2;148;226;213m"; }
cat_green() { echo -e "\033[38;2;166;227;161m"; }
cat_subtext() { echo -e "\033[38;2;166;173;200m"; }
cat_lavender() { echo -e "\033[38;2;180;190;254m"; }
cat_yellow() { echo -e "\033[38;2;249;226;175m"; }
cat_overlay() { echo -e "\033[38;2;108;112;134m"; }
latte_green() { echo -e "\033[38;2;64;160;43m"; }
latte_red() { echo -e "\033[38;2;210;15;57m"; }
latte_yellow() { echo -e "\033[38;2;223;142;29m"; }

# ============================================================================
# Gradient Functions
# ============================================================================
get_context_gradient_color() {
    local pct=$1
    local r g b
    if [[ $pct -lt 30 ]]; then
        local t=$((pct * 100 / 30))
        r=$((245 + (230 - 245) * t / 100))
        g=$((194 + (69 - 194) * t / 100))
        b=$((231 + (83 - 231) * t / 100))
    elif [[ $pct -lt 70 ]]; then
        local t=$(((pct - 30) * 100 / 40))
        r=$((230 + (210 - 230) * t / 100))
        g=$((69 + (15 - 69) * t / 100))
        b=$((83 + (57 - 83) * t / 100))
    else
        r=210; g=15; b=57
    fi
    echo "$r;$g;$b"
}

# 5H: Mocha Lavender → Latte Blue → Latte Red
get_usage_gradient_color() {
    local pct=$1
    local r g b
    if [[ $pct -lt 50 ]]; then
        local t=$((pct * 2))
        r=$((180 + (30 - 180) * t / 100))
        g=$((190 + (102 - 190) * t / 100))
        b=$((254 + (245 - 254) * t / 100))
    else
        local t=$(((pct - 50) * 2))
        r=$((30 + (210 - 30) * t / 100))
        g=$((102 + (15 - 102) * t / 100))
        b=$((245 + (57 - 245) * t / 100))
    fi
    echo "$r;$g;$b"
}

# 7D: Mocha Yellow → Latte Peach → Latte Red
get_usage_7d_gradient_color() {
    local pct=$1
    local r g b
    if [[ $pct -lt 50 ]]; then
        local t=$((pct * 2))
        r=$((249 + (254 - 249) * t / 100))
        g=$((226 + (100 - 226) * t / 100))
        b=$((175 + (11 - 175) * t / 100))
    else
        local t=$(((pct - 50) * 2))
        r=$((254 + (210 - 254) * t / 100))
        g=$((100 + (15 - 100) * t / 100))
        b=$((11 + (57 - 11) * t / 100))
    fi
    echo "$r;$g;$b"
}

generate_bar() {
    local pct=$1
    local width=$2
    local type=$3
    local bar=""
    local filled=$(( (pct * width + 50) / 100 ))
    [[ $filled -gt $width ]] && filled=$width

    local end_color
    case "$type" in
        context) end_color=$(get_context_gradient_color "$pct") ;;
        7d) end_color=$(get_usage_7d_gradient_color "$pct") ;;
        *) end_color=$(get_usage_gradient_color "$pct") ;;
    esac

    for ((i=0; i<filled; i++)); do
        local block_pct=$((i * 100 / width))
        local color
        case "$type" in
            context) color=$(get_context_gradient_color "$block_pct") ;;
            7d) color=$(get_usage_7d_gradient_color "$block_pct") ;;
            *) color=$(get_usage_gradient_color "$block_pct") ;;
        esac
        bar+="\033[38;2;${color}m█"
    done

    for ((i=0; i<width-filled; i++)); do
        bar+="\033[38;2;${end_color}m░"
    done

    echo -e "$bar$RESET"
}

# ============================================================================
# Line 1: Model + Directory + Git
# ============================================================================

# Model (short name, bold) - extract just model name without version for compact
SHORT_MODEL=$(echo "$MODEL" | sed 's/Claude //; s/ [0-9.]*//')
MODEL_DISPLAY="🤖${BOLD}$(cat_teal)${SHORT_MODEL}${RESET}"

# Directory (with ~ for home)
HOME_DIR="${HOME:-/Users/$USER}"
DIR_DISPLAY="📂$(cat_subtext)${CURRENT_DIR/$HOME_DIR/~}${RESET}"

# Git
GIT_DISPLAY=""
cd "$CURRENT_DIR" 2>/dev/null
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null)
    [[ -n "$BRANCH" ]] && GIT_DISPLAY="$(latte_green)🌿(${BRANCH})${RESET}"

    STAGED=$(git diff --cached --name-only 2>/dev/null | wc -l | tr -d ' ')
    UNSTAGED=$(git diff --name-only 2>/dev/null | wc -l | tr -d ' ')
    UNTRACKED=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d ' ')

    if [[ "$STAGED" -eq 0 && "$UNSTAGED" -eq 0 && "$UNTRACKED" -eq 0 ]]; then
        GIT_DISPLAY="${GIT_DISPLAY}$(cat_green)✅${RESET}"
    else
        STATUS=""
        [[ "$STAGED" -gt 0 ]] && STATUS="${STATUS}+"
        [[ "$UNSTAGED" -gt 0 ]] && STATUS="${STATUS}!"
        [[ "$UNTRACKED" -gt 0 ]] && STATUS="${STATUS}?"
        GIT_DISPLAY="${GIT_DISPLAY}$(latte_yellow)📝${STATUS}${RESET}"
    fi
fi

LINE1="${MODEL_DISPLAY} ${DIR_DISPLAY} ${GIT_DISPLAY}"

# ============================================================================
# Line 2: Progress Bars Only
# ============================================================================

# Context
CONTEXT_PERCENT=0
if [[ "$CURRENT_USAGE" != "null" && -n "$CURRENT_USAGE" ]]; then
    INPUT_TOKENS=$(echo "$CURRENT_USAGE" | jq -r '.input_tokens // 0')
    CACHE_CREATE=$(echo "$CURRENT_USAGE" | jq -r '.cache_creation_input_tokens // 0')
    CACHE_READ=$(echo "$CURRENT_USAGE" | jq -r '.cache_read_input_tokens // 0')
    CURRENT_TOKENS=$((INPUT_TOKENS + CACHE_CREATE + CACHE_READ))
    [[ "$CONTEXT_SIZE" -gt 0 ]] && CONTEXT_PERCENT=$((CURRENT_TOKENS * 100 / CONTEXT_SIZE))
fi

CTX_BAR=$(generate_bar "$CONTEXT_PERCENT" 10 "context")

# Usage data
get_usage_data() {
    local token
    token=$(security find-generic-password -s "Claude Code-credentials" -w 2>/dev/null | jq -r '.claudeAiOauth.accessToken // empty' 2>/dev/null)
    [[ -z "$token" ]] && return 1

    local cache_file="/tmp/.claude_usage_cache"
    if [[ -f "$cache_file" ]]; then
        local file_age=$(($(date +%s) - $(stat -f %m "$cache_file" 2>/dev/null || echo 0)))
        [[ "$file_age" -lt 300 ]] && cat "$cache_file" && return 0
    fi

    local response
    response=$(curl -s --max-time 3 \
        -H "Authorization: Bearer $token" \
        -H "Content-Type: application/json" \
        -H "anthropic-beta: oauth-2025-04-20" \
        "https://api.anthropic.com/api/oauth/usage" 2>/dev/null)

    if [[ -n "$response" ]] && echo "$response" | jq -e '.five_hour' &>/dev/null; then
        echo "$response" > "$cache_file"
        echo "$response"
        return 0
    fi
    return 1
}

USAGE_DATA=$(get_usage_data)

if [[ -n "$USAGE_DATA" ]]; then
    FIVE_HOUR=$(echo "$USAGE_DATA" | jq -r '.five_hour.utilization // 0' | xargs printf "%.0f")
    SEVEN_DAY=$(echo "$USAGE_DATA" | jq -r '.seven_day.utilization // 0' | xargs printf "%.0f")

    FIVE_BAR=$(generate_bar "$FIVE_HOUR" 10 "5h")
    SEVEN_BAR=$(generate_bar "$SEVEN_DAY" 10 "7d")

    LINE2="🧠${CTX_BAR} $(cat_lavender)5H${RESET}${FIVE_BAR} $(cat_yellow)7D${RESET}${SEVEN_BAR}"
else
    LINE2="🧠${CTX_BAR} $(cat_overlay)Usage: N/A${RESET}"
fi

# ============================================================================
# Output
# ============================================================================
echo -e "$LINE1"
echo -e "$LINE2"
