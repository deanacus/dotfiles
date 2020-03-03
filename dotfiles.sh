#!/bin/bash
#
# AUTHOR: Dean Harris
# DATE: 29/1/2013
# VERSION: 0.7
#
# DESCRIPTION:
# Stupid simple dotfile symlink creator.

if [ ! -d $DOTFILESPATH ]; then
    git clone git://github.com/deanacus/dotfiles $DOTFILESPATH
fi

PLATFORM=`hostname`


SCRIPTPATH=$(readlink -f "$0")
DOTFILESPATH=$(dirname $(readlink -f "$0"))

if [[ $PLATFORM == 'MSI' ]]; then
  # Install on Windows
  echo ""
  echo "Linking fish config"
  ln -sfn $DOTFILESPATH/fish/ $HOME/.config/

  echo ""
  echo "Linking Hyper Config"
  ln -sf $DOTFILESPATH/hyper.js /mnt/c/Users/dean/AppData/Roaming/Hyper

  echo ""
  echo "Linking VSCode settings"
  ln -sf $DOTFILESPATH/vscode/settings.json $HOME/.vscode-server/data/Machine/settings.json

  echo ""
  echo "Linking Git configuration"
  ln -sf $DOTFILESPATH/git/gitconfig $HOME/.gitconfig

  echo ""
  echo "Your dotfiles have been installed"

else
  # Install on Unix/Mac
  echo ""
  echo "Linking fish config"
  ln -sf $DOTFILESPATH/fish/ $HOME/.config/

  echo ""
  echo "Linking Hyper Config"
  ln -sf $DOTFILESPATH/hyper.js $HOME/.hyper.js

  echo ""
  echo "Linking Spectacle Config"
  ln -sf $DOTFILESPATH/spectacle.json $HOME/Library/Application\ Support/Spectacle/Shortcuts.json

  echo ""
  echo "Linking VSCode settings"
  ln -sf $DOTFILESPATH/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

  echo ""
  echo "Linking Git configuration"
  ln -sf $DOTFILESPATH/git/gitconfig $HOME/.gitconfig

  echo ""
  echo "Your dotfiles have been installed"
fi