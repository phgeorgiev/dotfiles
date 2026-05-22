#!/bin/bash
# Combined statusline: caveman badge + model + context % + 5h session % + 7d week % + cost.
# Claude Code pipes JSON to stdin (see https://code.claude.com/docs/en/statusline).

INPUT=$(cat)

# 1) Caveman badge.
CAVEMAN_SCRIPT="$HOME/.claude/plugins/cache/caveman/caveman/ef6050c5e184/hooks/caveman-statusline.sh"
[ -x "$CAVEMAN_SCRIPT" ] && bash "$CAVEMAN_SCRIPT"

JQ=$(command -v jq) || exit 0
[ -z "$INPUT" ] && exit 0

# Color helpers.
GREEN=$'\033[38;5;82m'
YELLOW=$'\033[38;5;220m'
RED=$'\033[38;5;196m'
DIM=$'\033[38;5;245m'
RESET=$'\033[0m'
SEP=" ${DIM}|${RESET} "

# pct_color N → echo color code based on threshold.
pct_color() {
  awk -v p="$1" 'BEGIN{
    if (p<50) print "'"$GREEN"'";
    else if (p<80) print "'"$YELLOW"'";
    else print "'"$RED"'";
  }'
}

# 2) Staleness detection. Hash (session_id, api_duration_ms, rate_limits).
STALE_SECS=30
STATE_FILE="$HOME/.claude/.statusline-state"
FINGERPRINT=$(printf '%s' "$INPUT" | "$JQ" -c '{s:.session_id, d:.cost.total_api_duration_ms, r:.rate_limits}' | shasum | awk '{print $1}')
NOW=$(date +%s)

LAST_HASH=""
LAST_TS=$NOW
if [ -f "$STATE_FILE" ]; then
  read -r LAST_HASH LAST_TS < "$STATE_FILE"
fi
if [ "$FINGERPRINT" = "$LAST_HASH" ]; then
  : # keep LAST_TS
else
  LAST_TS=$NOW
  printf '%s %s\n' "$FINGERPRINT" "$NOW" > "$STATE_FILE"
fi
AGE=$((NOW - LAST_TS))
STALE=0
[ "$AGE" -gt "$STALE_SECS" ] && STALE=1

# 3) Extract fields. Use Unit-Separator (\x1f) as delimiter. Whitespace IFS would
# collapse adjacent empties via `read` → fields shift when used_percentage is null.
SEP_CHAR=$'\x1f'
FIELDS_STR=$(printf '%s' "$INPUT" | "$JQ" -j --arg s "$SEP_CHAR" '
  [
    (.model.display_name // .model.id // ""),
    (.context_window.used_percentage // ""),
    (.context_window.context_window_size // ""),
    (.context_window.total_input_tokens // ""),
    (.rate_limits.five_hour.used_percentage // ""),
    (.rate_limits.seven_day.used_percentage // ""),
    (.cost.total_cost_usd // "")
  ] | map(tostring) | join($s)')
IFS=$'\x1f' read -r MODEL CTX_PCT CTX_SIZE CTX_IN FIVE SEVEN USD <<<"$FIELDS_STR"

segments=()

# Model.
[ -n "$MODEL" ] && segments+=("🤖 $MODEL")

# Context window — require numeric, non-empty, non-zero size.
if [ -n "$CTX_PCT" ] && [ -n "$CTX_SIZE" ] && [ "$CTX_SIZE" != "0" ]; then
  CTX_PCT_INT=$(awk -v p="$CTX_PCT" 'BEGIN{print int(p)+(p>int(p)?1:0)}')
  CTX_K=$((${CTX_IN:-0}/1000))
  CTX_SZ_K=$((CTX_SIZE/1000))
  C=$(pct_color "$CTX_PCT")
  segments+=("🧠 ${C}${CTX_K}k/${CTX_SZ_K}k (${CTX_PCT_INT}%)${RESET}")
fi

# Rate limits.
fmt_rl() {
  local icon="$1" label="$2" pct="$3"
  local c mark int
  if [ "$STALE" = "1" ]; then c="$DIM"; mark="~"; else c=$(pct_color "$pct"); mark=""; fi
  int=$(awk -v p="$pct" 'BEGIN{print int(p)+(p>int(p)?1:0)}')
  printf '%s %s%s %s%s%%%s' "$icon" "$c" "$label" "$mark" "$int" "$RESET"
}
[ -n "$FIVE" ]  && segments+=("$(fmt_rl '🔥' '5h' "$FIVE")")
[ -n "$SEVEN" ] && segments+=("$(fmt_rl '📅' '7d' "$SEVEN")")

# Cost.
if [ -n "$USD" ]; then
  if awk -v u="$USD" 'BEGIN{exit !(u>0)}'; then
    segments+=("$(printf '💰 $%.2f' "$USD")")
  fi
fi

if [ "${#segments[@]}" -gt 0 ]; then
  printf ' '
  out=""
  for s in "${segments[@]}"; do
    [ -n "$out" ] && out="${out}${SEP}"
    out="${out}${s}"
  done
  printf '%s' "$out"
fi
