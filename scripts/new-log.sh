#!/usr/bin/env bash
# Creates days/day-NNN.md from templates/day.md. Never overwrites.
set -euo pipefail

day="${1:?usage: make log DAY=<number>}"
num=$(printf "%03d" "$day")
out="days/day-$num.md"

if [ -e "$out" ]; then
  echo "error: $out already exists, not overwriting" >&2
  exit 1
fi

sed -e "s/{{DAY}}/$num/g" -e "s/{{DATE}}/$(date +%Y-%m-%d)/g" templates/day.md > "$out"
echo "$out"
