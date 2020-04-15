#!/bin/bash
#
# AUTHOR: Dean Harris
# DATE: 29/1/2013
# VERSION: 0.7
#
# DESCRIPTION:
# Stupid simple dotfile symlink creator.

OS=$(os)

# Shared config between home and work

dotfiles=$HOME/dotfiles
config=$HOME/.config
home=$HOME
appData=/mnt/c/Users/dean/AppData/Roaming

echo ""
echo "Linking fish config"
if [ ! -d $config/fish ]; then
  mkdir $config/fish
fi
ln -sf $dotfiles/fish/config.fish $config/fish/config.fish

echo ""
echo "Linking Git configuration"
ln -sf $dotfiles/git/gitconfig $HOME/.gitconfig

echo ""
echo "Linking Vim configuration"
ln -sf $dotfiles/vim/vimrc $HOME/.vimrc
ln -sf $dotfiles/vim/vimrc $config/nvim/init.vim

echo ""
echo "Linking NPM configuration"
ln -sf $dotfiles/npmrc $HOME/.npmrc

if [[ $OS == 'windows' ]]; then
  # VSCode on WSL is technically a remote server, so
  # Put the file in the right spot
  echo ""
  echo "Linking VSCode settings in WSL"
  ln -sfn $dotfiles/vscode/settings.json $HOME/.vscode-server/data/Machine/settings.json

  # Link the same file for the host os version. Means I've got the same
  # config between remote and local environments (although VSCode can't tell)
  echo ""
  echo "Linking VSCode settings in Windows"
  ln -sf $dotfiles/vscode/settings.json $appData/Code/User/settings.json
else
  echo ""
  echo "Linking Alacritty Config"
  ln -sf $dotfiles/alacritty.yml $HOME/.alacritty.yml

  echo ""
  echo "Linking Hyper Config"
  ln -sf $dotfiles/hyper.js $HOME/.hyper.js

  echo ""
  echo "Linking Spectacle Config"
  ln -sf $dotfiles/spectacle.json $HOME/Library/Application\ Support/Spectacle/Shortcuts.json

  echo ""
  echo "Linking VSCode settings"
  ln -sf $dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
fi

echo ""
echo "Your dotfiles have been installed"
