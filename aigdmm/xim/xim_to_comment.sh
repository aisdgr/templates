#!/usr/bin/env bash
# ----------------------------------------
# XIM → Git Commit Message Converter
# ----------------------------------------
# Author: AIDDM / XIM
# ----------------------------------------

set -e

# ---------- help ----------
show_help() {
  cat <<'EOF'
XIM → Git Commit Message Converter

USAGE:
  ./xim_to_comment.sh <xim-file.md>

EXAMPLES:
  # Preview commit message
  ./xim_to_comment.sh xim.md

  # Commit directly using XIM as source
  git commit -F <(./xim_to_comment.sh xim.md)

  # Save commit message to file
  ./xim_to_comment.sh xim.md > COMMIT_MSG.txt
  git commit -F COMMIT_MSG.txt

DESCRIPTION:
  This script converts a XIM (Execution / eXchange Implementation Memo)
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
  - DETAIL  -> first body line
  - Others  -> commit body

NOTES:
  - XIM is treated as a contract, not a prompt.
  - This tool performs structure mapping only (no AI inference).
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

# ---------- extract fields ----------
PURPOSE=$(awk '/^## PURPOSE/{getline; print}' "$XIM_FILE" | trim)
DETAIL=$(awk '/^## DETAIL/{getline; print}' "$XIM_FILE" | trim)

TYPE_RAW=$(awk '
  /^## EXECUTION INTENT/ {flag=1}
  flag && /- TYPE/ {getline; getline; print; exit}
' "$XIM_FILE" | trim)

TARGET_RAW=$(awk '
  /^## EXECUTION INTENT/ {flag=1}
  flag && /- TARGET/ {getline; getline; print; exit}
' "$XIM_FILE" | trim)

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

if [[ -n "$DETAIL" ]]; then
  BODY_LINES+=("$DETAIL")
fi

BODY_LINES+=("")

BODY=$(awk '
  BEGIN {skip=0}
  /^## PURPOSE/ {skip=1; next}
  /^## DETAIL/ {skip=1; next}
  /^## / {skip=0}
  !skip {print}
' "$XIM_FILE")

BODY_LINES+=("$BODY")

# ---------- output ----------
echo "$SUBJECT"
echo
printf "%s\n" "${BODY_LINES[@]}"
