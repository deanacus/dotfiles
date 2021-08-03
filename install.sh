#!/bin/bash

# MacOS Specific Stuff
if [[ -n "$(uname -a | grep -Ei "darwin")" ]]; then
  APP_CONFIG_PATH="$HOME/Library/Application\ Support"
  ln -s $HOME/dotfiles/hyper.js $HOME/.hyper.js
  ln -s $HOME/dotfiles/vscode/settings.json $APP_CONFIG_PATH/Code/User/settings.json
  ln -s $HOME/dotfiles/vscode/keybindings.json $APP_CONFIG_PATH/Code/User/keybindings.json
fi

# WSL Specific
if [[ -n "$(uname -a | grep -Ei ".*linux.*microsoft.*")" ]]; then
  APP_CONFIG_PATH="/mnt/c/users/dean/AppData"

  if [[ ! -d "$APP_CONFIG_PATH/Roaming/alacritty/" ]]; then
    mkdir -p $APP_CONFIG_PATH/Roaming/alacritty/
  fi

  if [[ ! -d "$HOME/.config/nvim" ]]; then
    mkdir -p $HOME/.config/nvim
  fi

  # Terminal Apps
  cp $HOME/dotfiles/terminals/windows/settings.json $APP_CONFIG_PATH/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json

  # VSCode
  cp $HOME/dotfiles/vscode/settings.json $APP_CONFIG_PATH/Roaming/Code/User/settings.json
  cp $HOME/dotfiles/vscode/windows.keybindings.json $APP_CONFIG_PATH/Roaming/Code/User/keybindings.json
fi

# Common stuff
ln -sf $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
ln -sf $HOME/dotfiles/npm/npmrc $HOME/.npmrc
ln -sf $HOME/dotfiles/ripgrep/ripgreprc $HOME/.ripgreprc
ln -sf $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim/init.lua
ln -sf $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf