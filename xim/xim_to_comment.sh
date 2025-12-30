#!/usr/bin/env bash
# ----------------------------------------
# XIM → Git Commit Message Converter
#
# Version: 1.2.1
# Author : AIDDM / XIM
#
# CHANGELOG
# ----------
# v1.2.1
# - Hide System Auto Injection (confidential)
# - Include User File Injection as commit context
# - User inputs affect reproducibility and must be visible
#
# v1.2.0
# - Align with XIM vNext structure
# ----------------------------------------

set -e

# ---------- help ----------
show_help() {
  cat <<'EOF'
XIM → Git Commit Message Converter (v1.2.1)

USAGE:
  ./xim_to_comment.sh <xim-file.md>

DESCRIPTION:
  Convert a XIM (Execution Intent Manifest)
  into a deterministic Git commit message.

SECURITY MODEL:
  - System Auto Injection is confidential and hidden
  - User File Injection is visible for audit & traceability
EOF
}

# ---------- argument handling ----------
if [[ $# -eq 0 ]]; then
  show_help
  exit 0
fi

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  show_help
  exit 0
fi

XIM_FILE="$1"

if [[ ! -f "$XIM_FILE" ]]; then
  echo "❌ XIM file not found: $XIM_FILE" >&2
  exit 1
fi

# ---------- helpers ----------
trim() {
  sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}

parse_enum_block() {
  local block="$1"
  awk -v block="$block" '
    $0 ~ "^- " block "$" {found=1; next}
    found && $0 ~ /^ *- / {
      gsub(/^ *- */, "", $0)
      print
      exit
    }
  ' "$XIM_FILE" | trim
}

# ---------- extract core fields ----------
PURPOSE=$(awk '/^## PURPOSE/ {getline; print; exit}' "$XIM_FILE" | trim)

DETAIL=$(awk '
  /^## DETAIL/ {in_detail=1; next}
  /^## / {in_detail=0}
  in_detail {print}
' "$XIM_FILE" | sed '/^[[:space:]]*$/d')

TYPE_RAW=$(parse_enum_block "TYPE")
TARGET_RAW=$(parse_enum_block "TARGET")

# ---------- map TYPE ----------
case "$TYPE_RAW" in
  add|change) GIT_TYPE="feat" ;;
  fix)        GIT_TYPE="fix" ;;
  refactor)   GIT_TYPE="refactor" ;;
  *)          GIT_TYPE="feat" ;;
esac

# ---------- map TARGET ----------
case "$TARGET_RAW" in
  test) GIT_SCOPE="test" ;;
  doc)  GIT_SCOPE="doc" ;;
  code) GIT_SCOPE="" ;;
  *)    GIT_SCOPE="" ;;
esac

# ---------- subject ----------
if [[ -n "$GIT_SCOPE" ]]; then
  SUBJECT="${GIT_TYPE}(${GIT_SCOPE}): ${PURPOSE}"
else
  SUBJECT="${GIT_TYPE}: ${PURPOSE}"
fi

# ---------- extract User File Injection ----------
USER_INPUTS=$(awk '
  /^### User File Injection/ {in_user=1; next}
  /^## / {in_user=0}
  in_user && /^- / {print}
' "$XIM_FILE")

# ---------- output ----------
echo "$SUBJECT"
echo

if [[ -n "$DETAIL" ]]; then
  echo "$DETAIL"
  echo
fi

if [[ -n "$USER_INPUTS" ]]; then
  echo "User Inputs:"
  echo "$USER_INPUTS"
fi
