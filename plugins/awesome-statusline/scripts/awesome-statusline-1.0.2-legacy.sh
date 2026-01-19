#!/bin/bash
# ============================================================================
# Claude Code Simple Statusline (4-line) - Catppuccin Edition
# ============================================================================
# Line 1: Model | Git Status | Conda Env | 🎨 Output Style
# Line 2: 📂 Directory Path + 🌿(Branch)
# Line 3: 📝 Context Window (progress bar with gradient)
# Line 4: 🚀 5H + 7D Usage (progress bars with gradient)
# ============================================================================
# v1.0.2 - Fixed: echo -e → variables, added line clear \033[K
# ============================================================================

input=$(cat)

# Parse JSON input
MODEL=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
CURRENT_DIR=$(echo "$input" | jq -r '.workspace.current_dir // "."')
CONTEXT_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')
CURRENT_USAGE=$(echo "$input" | jq -r '.context_window.current_usage // null')
OUTPUT_STYLE=$(echo "$input" | jq -r '.output_style.name // ""')

# ============================================================================
# Colors (variables instead of functions to avoid newline issues)
# ============================================================================
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"
CLR="\033[K"  # Clear to end of line

# Catppuccin Mocha palette
C_PINK="\033[38;2;245;194;231m"
C_GREEN="\033[38;2;166;227;161m"
C_YELLOW="\033[38;2;249;226;175m"
C_PEACH="\033[38;2;250;179;135m"
C_RED="\033[38;2;243;139;168m"
C_MAROON="\033[38;2;235;160;172m"
C_TEAL="\033[38;2;148;226;213m"
C_SKY="\033[38;2;137;220;235m"
C_BLUE="\033[38;2;137;180;250m"
C_LAVENDER="\033[38;2;180;190;254m"
C_TEXT="\033[38;2;205;214;244m"
C_SUBTEXT="\033[38;2;166;173;200m"
C_OVERLAY="\033[38;2;108;112;134m"

# ============================================================================
# Gradient functions for progress bars
# ============================================================================

# Context gradient: Latte Yellow(0%) → Latte Red(50%) → Mauve(100%)
get_context_gradient_color() {
    local pct=$1
    local r g b

    if [[ $pct -lt 50 ]]; then
        # Latte Yellow (#df8e1d) → Latte Red (#d20f39)
        local t=$((pct * 2))
        r=$((223 + (210 - 223) * t / 100))
        g=$((142 + (15 - 142) * t / 100))
        b=$((29 + (57 - 29) * t / 100))
    else
        # Latte Red (#d20f39) → Mauve (#8839ef)
        local t=$(((pct - 50) * 2))
        r=$((210 + (136 - 210) * t / 100))
        g=$((15 + (57 - 15) * t / 100))
        b=$((57 + (239 - 57) * t / 100))
    fi

    echo "$r;$g;$b"
}

# Usage gradient: Mocha Green (#a6e3a1) → Latte Teal (#179299) → Latte Blue (#1e66f5)
get_usage_gradient_color() {
    local pct=$1
    local r g b

    if [[ $pct -lt 50 ]]; then
        # Mocha Green (#a6e3a1) → Latte Teal (#179299)
        local t=$((pct * 2))
        r=$((166 + (23 - 166) * t / 100))
        g=$((227 + (146 - 227) * t / 100))
        b=$((161 + (153 - 161) * t / 100))
    else
        # Latte Teal (#179299) → Latte Blue (#1e66f5)
        local t=$(((pct - 50) * 2))
        r=$((23 + (30 - 23) * t / 100))
        g=$((146 + (102 - 146) * t / 100))
        b=$((153 + (245 - 153) * t / 100))
    fi

    echo "$r;$g;$b"
}

# ============================================================================
# Progress bar generator with gradient
# ============================================================================
generate_progress_bar() {
    local pct=$1
    local width=$2
    local gradient_type=$3
    local bar=""

    local filled=$(( (pct * width + 50) / 100 ))
    [[ $filled -gt $width ]] && filled=$width

    # Get the color at the current percentage (for empty blocks and text)
    local end_color
    if [[ "$gradient_type" == "context" ]]; then
        end_color=$(get_context_gradient_color "$pct")
    else
        end_color=$(get_usage_gradient_color "$pct")
    fi

    # Build filled portion with gradient
    for ((i=0; i<filled; i++)); do
        local block_pct=$((i * 100 / width))
        local color
        if [[ "$gradient_type" == "context" ]]; then
            color=$(get_context_gradient_color "$block_pct")
        else
            color=$(get_usage_gradient_color "$block_pct")
        fi
        bar+="\033[38;2;${color}m█"
    done

    # Build empty portion (use the end color - same as last filled block)
    local empty=$((width - filled))
    for ((i=0; i<empty; i++)); do
        bar+="\033[38;2;${end_color}m░"
    done

    bar+="$RESET"
    printf "%b" "$bar"
}

# ============================================================================
# LINE 1: Model | Git Status | Conda Env
# ============================================================================

# Model with emoji - Opus gets Catppuccin Pink
case "$MODEL" in
    *Opus*) MODEL_DISPLAY="🧠 ${C_PINK}${MODEL}${RESET}" ;;
    *Sonnet*) MODEL_DISPLAY="🎵 ${C_LAVENDER}${MODEL}${RESET}" ;;
    *Haiku*) MODEL_DISPLAY="⚡️ ${C_SKY}${MODEL}${RESET}" ;;
    *) MODEL_DISPLAY="🤖 ${C_TEXT}${MODEL}${RESET}" ;;
esac

# Git status
GIT_STATUS=""
cd "$CURRENT_DIR" 2>/dev/null
if git rev-parse --git-dir > /dev/null 2>&1; then
    if git diff --quiet && git diff --cached --quiet 2>/dev/null; then
        GIT_STATUS="${C_GREEN}✅ clean${RESET}"
    else
        GIT_STATUS="${C_PEACH}🚧 dirty${RESET}"
    fi
else
    GIT_STATUS="${C_OVERLAY}no git${RESET}"
fi

# Conda environment
CONDA_ENV=""
if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    CONDA_ENV="${C_YELLOW}🐍 $CONDA_DEFAULT_ENV${RESET}"
else
    CONDA_ENV="${C_OVERLAY}no conda${RESET}"
fi

# Output style
OUTPUT_STYLE_DISPLAY=""
if [[ -n "$OUTPUT_STYLE" ]]; then
    OUTPUT_STYLE_DISPLAY=" | 🎨 ${C_LAVENDER}${OUTPUT_STYLE}${RESET}"
fi

LINE1="${BOLD}${MODEL_DISPLAY}${RESET} | ${GIT_STATUS} | ${CONDA_ENV}${OUTPUT_STYLE_DISPLAY}"

# ============================================================================
# LINE 2: 🌿 Git Branch + Directory Path
# ============================================================================

# Directory path
DIR_DISPLAY="📂 ${C_BLUE}${CURRENT_DIR}${RESET}"

# Git branch with 🌿 emoji (darker green)
GIT_BRANCH_DISPLAY=""
cd "$CURRENT_DIR" 2>/dev/null
if git rev-parse --git-dir > /dev/null 2>&1; then
    BRANCH=$(git branch --show-current 2>/dev/null)
    if [[ -n "$BRANCH" ]]; then
        # Darker green: #40a02b (Catppuccin Latte green, more saturated)
        GIT_BRANCH_DISPLAY=" \033[38;2;64;160;43m🌿(${BRANCH})${RESET}"
    fi
fi

LINE2="${DIR_DISPLAY}${GIT_BRANCH_DISPLAY}"

# ============================================================================
# LINE 3: 🚀 Context Window with Progress Bar
# ============================================================================

CONTEXT_PERCENT=0
if [[ "$CURRENT_USAGE" != "null" && -n "$CURRENT_USAGE" ]]; then
    INPUT_TOKENS=$(echo "$CURRENT_USAGE" | jq -r '.input_tokens // 0')
    CACHE_CREATE=$(echo "$CURRENT_USAGE" | jq -r '.cache_creation_input_tokens // 0')
    CACHE_READ=$(echo "$CURRENT_USAGE" | jq -r '.cache_read_input_tokens // 0')
    CURRENT_TOKENS=$((INPUT_TOKENS + CACHE_CREATE + CACHE_READ))
    if [[ "$CONTEXT_SIZE" -gt 0 ]]; then
        CONTEXT_PERCENT=$((CURRENT_TOKENS * 100 / CONTEXT_SIZE))
    fi
fi

# Get end color for text
CTX_END_COLOR=$(get_context_gradient_color "$CONTEXT_PERCENT")
CTX_BAR=$(generate_progress_bar "$CONTEXT_PERCENT" 40 "context")

LINE3="📝 \033[38;2;${CTX_END_COLOR}mContext${RESET} ${CTX_BAR} \033[38;2;${CTX_END_COLOR}m${CONTEXT_PERCENT}% used${RESET}"

# ============================================================================
# LINE 4: ⏰ Usage Limits (5H + 7D) with Progress Bars
# ============================================================================

# Get OAuth token from Keychain
get_usage_data() {
    local token
    token=$(security find-generic-password -s "Claude Code-credentials" -w 2>/dev/null | jq -r '.claudeAiOauth.accessToken // empty' 2>/dev/null)

    if [[ -z "$token" ]]; then
        echo ""
        return 1
    fi

    # Cache file (5 min TTL)
    local cache_file="/tmp/.claude_usage_cache"
    local cache_age=300

    if [[ -f "$cache_file" ]]; then
        local file_age=$(($(date +%s) - $(stat -f %m "$cache_file" 2>/dev/null || echo 0)))
        if [[ "$file_age" -lt "$cache_age" ]]; then
            cat "$cache_file"
            return 0
        fi
    fi

    # Fetch from API
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

    echo ""
    return 1
}

# Format reset time as "Xh Xm" for 5H
format_time_remaining() {
    local iso_ts="$1"
    [[ -z "$iso_ts" || "$iso_ts" == "null" ]] && return

    local normalized=$(echo "$iso_ts" | sed 's/\.[0-9]*//')
    local mac_ts=$(echo "$normalized" | sed 's/+00:00/+0000/; s/Z$/+0000/; s/+\([0-9][0-9]\):\([0-9][0-9]\)/+\1\2/')
    local reset_epoch=$(date -j -f "%Y-%m-%dT%H:%M:%S%z" "$mac_ts" "+%s" 2>/dev/null)

    [[ -z "$reset_epoch" ]] && return

    local now_epoch=$(date +%s)
    local remaining=$((reset_epoch - now_epoch))
    [[ $remaining -lt 0 ]] && remaining=0

    local hours=$((remaining / 3600))
    local minutes=$(((remaining % 3600) / 60))
    echo "${hours}h${minutes}m"
}

# Format reset time (day only, no time) for 7D
format_reset() {
    local iso_ts="$1"
    [[ -z "$iso_ts" || "$iso_ts" == "null" ]] && return

    local normalized=$(echo "$iso_ts" | sed 's/\.[0-9]*//')
    local mac_ts=$(echo "$normalized" | sed 's/+00:00/+0000/; s/Z$/+0000/; s/+\([0-9][0-9]\):\([0-9][0-9]\)/+\1\2/')
    local reset_epoch=$(date -j -f "%Y-%m-%dT%H:%M:%S%z" "$mac_ts" "+%s" 2>/dev/null)

    [[ -z "$reset_epoch" ]] && return

    # Only show day of week
    date -j -f "%s" "$reset_epoch" "+%a" 2>/dev/null
}

# Build Line 4
USAGE_DATA=$(get_usage_data)

if [[ -n "$USAGE_DATA" ]]; then
    FIVE_HOUR=$(echo "$USAGE_DATA" | jq -r '.five_hour.utilization // 0' | xargs printf "%.0f")
    FIVE_RESET=$(echo "$USAGE_DATA" | jq -r '.five_hour.resets_at // empty')
    SEVEN_DAY=$(echo "$USAGE_DATA" | jq -r '.seven_day.utilization // 0' | xargs printf "%.0f")
    SEVEN_RESET=$(echo "$USAGE_DATA" | jq -r '.seven_day.resets_at // empty')

    FIVE_RESET_FMT=$(format_time_remaining "$FIVE_RESET")
    SEVEN_RESET_FMT=$(format_reset "$SEVEN_RESET")

    # Generate progress bars with gradient (shorter width for inline)
    FIVE_BAR=$(generate_progress_bar "$FIVE_HOUR" 10 "usage")
    SEVEN_BAR=$(generate_progress_bar "$SEVEN_DAY" 10 "usage")

    # Get end colors for text
    FIVE_END_COLOR=$(get_usage_gradient_color "$FIVE_HOUR")
    SEVEN_END_COLOR=$(get_usage_gradient_color "$SEVEN_DAY")

    LINE4="🚀 \033[38;2;${FIVE_END_COLOR}mUsage 5H${RESET} ${FIVE_BAR} \033[38;2;${FIVE_END_COLOR}m${FIVE_HOUR}%${RESET} ${C_OVERLAY}(${FIVE_RESET_FMT})${RESET} | \033[38;2;${SEVEN_END_COLOR}m7D${RESET} ${SEVEN_BAR} \033[38;2;${SEVEN_END_COLOR}m${SEVEN_DAY}%${RESET} ${C_OVERLAY}(${SEVEN_RESET_FMT})${RESET}"
else
    LINE4="${C_OVERLAY}🚀 Usage: unavailable${RESET}"
fi

# ============================================================================
# OUTPUT (using printf with line clear)
# ============================================================================
printf "%b%b\n" "$LINE1" "$CLR"
printf "%b%b\n" "$LINE2" "$CLR"
printf "%b%b\n" "$LINE3" "$CLR"
printf "%b%b\n" "$LINE4" "$CLR"
