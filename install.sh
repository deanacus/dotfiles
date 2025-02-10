#!/bin/bash

# MacOS Specific Stuff
APP_CONFIG_PATH="$HOME/Library/Application\ Support"
ln -s $HOME/dotfiles/hyper.js $HOME/.hyper.js
ln -s $HOME/dotfiles/vscode/settings.json $APP_CONFIG_PATH/Code/User/settings.json
ln -s $HOME/dotfiles/vscode/keybindings.json $APP_CONFIG_PATH/Code/User/keybindings.json

# Common stuff
ln -sF $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
ln -sF $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
ln -sF $HOME/dotfiles/npm/npmrc $HOME/.npmrc
ln -sF $HOME/dotfiles/ripgrep/ripgreprc $HOME/.ripgreprc
ln -sF $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim/init.lua
ln -sF $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf




#####


# #!/bin/sh

# XDG_CONFIG_HOME=$HOME/.config
# APP_SUPPORT=$HOME/Library/Application\ Support

# # Install shell config
# ln -sF $HOME/dotfiles/fish/functions $HOME/.config/fish/functions
# ln -sF $HOME/dotfiles/fish/config.fish $HOME/.config/fish/config.fish

# # git config
# ln -sF $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

# # tmux config
# ln -sF $HOME/dotfiles/tmux/tmux.conf $HOME/.tmux.conf

# # nvim config
# ln -sF $HOME/dotfiles/nvim/init.lua $HOME/.config/nvim/init.lua

# # npm config
# ln -sF $HOME/dotfiles/npm/npmrc $HOME/.npmrc

# # vscode config
# ln -sF $HOME/dotfiles/vscode/settings.json $APP_SUPPORT/Code/User/settings.json

# # hyper config
# $APP_SUPPORT/Hyper/.hyper.js
# ln -sF $HOME/dotfiles/hyper/hyper.js $APP_SUPPORT/Hyper/.hyper.js

# # ripgrep config
# ln -sF $HOME/dotfiles/ripgrep/ripgreprc $HOME/.config/ripgrep/config