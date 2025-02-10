#!/usr/bin/env bash

DOT_DIR="$HOME/dotfiles"
XDG_CONFIG_HOME="$HOME/.config"
APP_CONFIG_PATH="$HOME/Library/Application\ Support"

# Fish
ln -sfn "$DOT_DIR/fish/config.fish" "$XDG_CONFIG_HOME/fish/config.fish"

# Git
ln -sfn "$DOT_DIR/git/gitconfig" "$HOME/.gitconfig"

# Hyper
ln -sfn "$DOT_DIR/hyper/config.js" "$APP_CONFIG_PATH/Hyper/.hyper.js"

# NPM
ln -sfn "$DOT_DIR/npm/npmrc" "$HOME/.npmrc"

# NeoVim
ln -sfn "$DOT_DIR/nvim" "$XDG_CONFIG_HOME/nvim"

# Ripgrep
ln -sfn "$DOT_DIR/ripgrep/ripgreprc" "$XDG_CONFIG_HOME/ripgrep/config"

# Tmux
ln -sfn "$DOT_DIR/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

# VS Code
ln -sfn "$DOT_DIR/vscode/settings.json" "$APP_CONFIG_PATH/Code/User/settings.json"
ln -sfn "$DOT_DIR/vscode/keybindings.json" "$APP_CONFIG_PATH/Code/User/keybindings.json"

