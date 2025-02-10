#!/bin/bash
#
# AUTHOR: Dean Harris
# DATE: 29/1/2013
# VERSION: 0.7
#
# DESCRIPTION:
# Stupid simple dotfile symlink creator.

# Shared config between home and work

dotfiles=$HOME/dotfiles
config=$HOME/.config

OS=$($dotfiles/bin/os)

# echo ""
# echo "Linking fish config"
# if [ ! -d $config/fish ]; then
#   mkdir $config/fish
# fi
# ln -sf $dotfiles/fish/config.fish $config/fish/config.fish

# echo ""
# echo "Linking ZSH configuration"
# ln -sf $dotfiles/zsh/zshrc $HOME/.zshrc

echo ""
echo "Linking Git configuration"
ln -sf $dotfiles/git/gitconfig $HOME/.gitconfig

echo ""
echo "Linking Tmux configuration"
ln -sf $dotfiles/tmux/tmux.conf $HOME/.tmux.conf

echo ""
echo "Linking Neovim configuration"
ln -sf $dotfiles/vim/vimrc $config/nvim/init.vim

echo ""
echo "Linking NPM configuration"
ln -sf $dotfiles/npmrc $HOME/.npmrc

echo ""
echo "Linking Hyper Config"
ln -sf $dotfiles/hyper.js $HOME/.hyper.js

echo ""
echo "Linking VSCode settings"
ln -sf $dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

echo ""
echo "Your dotfiles have been installed"
