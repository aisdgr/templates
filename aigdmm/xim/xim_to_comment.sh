#!/usr/bin/env bash
# ----------------------------------------
# XIM → Git Commit Message Converter
#
# Version: 1.1.1
# Author : AIDDM / XIM
#
# CHANGELOG
# ----------
# v1.1.0
# - Robust enum block parsing (TYPE / TARGET / LANGUAGE)
# - Fix missing scope(test) issue
# - Structure-driven parsing (not layout-driven)
#
# v1.1.1
# - Fix: capture full DETAIL block instead of first line only
# - DETAIL is now treated as a free-form block until next section
# - Improved robustness against formatting and blank lines
# ----------------------------------------

set -e

# ---------- help ----------
show_help() {
  cat <<'EOF'
XIM → Git Commit Message Converter (v1.1.1)

USAGE:
  ./xim_to_comment.sh <xim-file.md>

EXAMPLES:
  # Preview commit message
  ./xim_to_comment.sh xim.md

  # Save commit message to file (cross-platform safe)
  ./xim_to_comment.sh xim.md > .git/COMMIT_MSG
  git commit -F .git/COMMIT_MSG

DESCRIPTION:
  Convert a XIM (Execution / eXchange Implementation Memo)
  into a deterministic Git commit message.

MAPPING RULES:
  - TYPE:
      add, change -> feat
      fix         -> fix
      refactor    -> refactor

  - TARGET:
      test -> scope(test)
      doc  -> scope(doc)
      code -> no scope

  - PURPOSE -> commit subject
  - DETAIL  -> commit body (first section, full block)
  - Others  -> appended as commit body context

DESIGN NOTES:
  - XIM is treated as a contract, not a prompt
  - Parsing is structure-based, not layout-based
  - Output is deterministic and reproducible
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

# Parse enum value under a block like:
# - TYPE
#   - add
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

# PURPOSE: single-line subject
PURPOSE=$(awk '
  /^## PURPOSE/ {getline; print; exit}
' "$XIM_FILE" | trim)

# DETAIL: free-form block until next section
DETAIL=$(awk '
  /^## DETAIL/ {in_detail=1; next}
  /^## / {in_detail=0}
  in_detail {print}
' "$XIM_FILE" | sed '/^[[:space:]]*$/d')

TYPE_RAW=$(parse_enum_block "TYPE")
TARGET_RAW=$(parse_enum_block "TARGET")
LANGUAGE_RAW=$(parse_enum_block "LANGUAGE")

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

# ---------- body ----------
BODY_LINES=()

# DETAIL is the first body section
if [[ -n "$DETAIL" ]]; then
  BODY_LINES+=("$DETAIL")
fi

# blank line separator
BODY_LINES+=("")

# Append remaining XIM context (excluding PURPOSE / DETAIL blocks)
BODY=$(awk '
  BEGIN {skip=0}
  /^## PURPOSE/ {skip=1; next}
  /^## DETAIL/  {skip=1; next}
  /^## /        {skip=0}
  !skip {print}
' "$XIM_FILE")

BODY_LINES+=("$BODY")

# ---------- output ----------
echo "$SUBJECT"
echo
printf "%s\n" "${BODY_LINES[@]}"
