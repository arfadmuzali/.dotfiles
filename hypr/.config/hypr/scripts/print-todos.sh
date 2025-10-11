#!/bin/bash

# file location
FILE="$HOME/.config/todo/todos.json"

# check file
if [[ ! -f "$FILE" ]]; then
  echo "File $FILE tidak ditemukan."
  exit 1
fi

descriptions=$(jq -r '.[].Description' "$FILE")

if [[ -z "$descriptions" ]]; then
  exit 0
fi

while IFS= read -r desc; do
  notify-send "Todo" "$desc"
done <<< "$descriptions"

