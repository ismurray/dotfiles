#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

# Git config
if [ -f "$DOTFILES_DIR/.gitconfig" ]; then
  ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
  echo "  Linked .gitconfig"
fi

# Pry config (colorized Rails console)
if [ -f "$DOTFILES_DIR/.pryrc" ]; then
  ln -sf "$DOTFILES_DIR/.pryrc" "$HOME/.pryrc"
  echo "  Linked .pryrc"
fi

# Shell aliases (sourced by .bashrc/.zshrc)
if [ -f "$DOTFILES_DIR/.bash_aliases" ]; then
  ln -sf "$DOTFILES_DIR/.bash_aliases" "$HOME/.bash_aliases"
  echo "  Linked .bash_aliases"

  # Ensure .bash_aliases is sourced from .bashrc if not already
  if [ -f "$HOME/.bashrc" ] && ! grep -q 'bash_aliases' "$HOME/.bashrc"; then
    echo '[ -f ~/.bash_aliases ] && source ~/.bash_aliases' >> "$HOME/.bashrc"
    echo "  Added .bash_aliases sourcing to .bashrc"
  fi

  # Same for zsh if present
  if [ -f "$HOME/.zshrc" ] && ! grep -q 'bash_aliases' "$HOME/.zshrc"; then
    echo '[ -f ~/.bash_aliases ] && source ~/.bash_aliases' >> "$HOME/.zshrc"
    echo "  Added .bash_aliases sourcing to .zshrc"
  fi
fi

# Readline config (better history search, tab completion)
if [ -f "$DOTFILES_DIR/.inputrc" ]; then
  ln -sf "$DOTFILES_DIR/.inputrc" "$HOME/.inputrc"
  echo "  Linked .inputrc"
fi

# Claude Code settings
mkdir -p "$HOME/.claude"
if [ -f "$DOTFILES_DIR/.claude/settings.json" ]; then
  ln -sf "$DOTFILES_DIR/.claude/settings.json" "$HOME/.claude/settings.json"
  echo "  Linked Claude Code settings"
fi

# Claude Code user commands
if [ -d "$DOTFILES_DIR/.claude/commands" ]; then
  ln -sfn "$DOTFILES_DIR/.claude/commands" "$HOME/.claude/commands"
  echo "  Linked Claude Code commands ($(ls "$DOTFILES_DIR/.claude/commands" | wc -l | tr -d ' ') commands)"
fi

# VS Code settings for Codespaces
# In Codespaces, user settings live at this path for the remote server
VSCODE_SETTINGS_DIR="$HOME/.vscode-remote/data/Machine"
if [ -f "$DOTFILES_DIR/vscode-settings.json" ]; then
  mkdir -p "$VSCODE_SETTINGS_DIR"
  ln -sf "$DOTFILES_DIR/vscode-settings.json" "$VSCODE_SETTINGS_DIR/settings.json"
  echo "  Linked VS Code settings"
fi

echo "Dotfiles installed successfully!"
