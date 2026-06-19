#!/bin/bash

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
FOLDERS="i3 kitty picom tmux hypr waybar wofi mimeapps.list ghostty"

for folder in $FOLDERS; do
    rsync -av --exclude='.git' ~/.config/"$folder" "$REPO_DIR/.config/"
done

cp ~/.zshrc "$REPO_DIR"

