#!/bin/sh
input=$(cat)
ts=$(date "+%a %d %b %H:%M:%S")
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // "?"')
model=$(echo "$input" | jq -r '.model.display_name // ""')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Build the status line mirroring the zsh PROMPT: yellow timestamp + cwd + model
line=$(printf '\033[33m[%s]\033[0m %s' "$ts" "$cwd")
[ -n "$model" ] && line="$line  $model"
[ -n "$remaining" ] && line="$line  ctx:$(printf '%.0f' "$remaining")%"
echo "$line"
