#!/bin/bash

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
FOLDERS="i3 kitty picom tmux hypr waybar wofi mimeapps.list"

mkdir -p ~/.config

for folder in $FOLDERS; do
    rsync -av --exclude='.git' "$REPO_DIR/.config/$folder" ~/.config/
done

cp "$REPO_DIR/.zshrc" ~/.zshrc
