#!/bin/bash
#
# AUTHOR: Dean Harris
# DATE: 29/1/2013
# VERSION: 0.7
#
# DESCRIPTION:
# Stupid simple dotfile symlink creator.

SCRIPTPATH=$(readlink -f "$0")
DOTFILESPATH=$(dirname $(readlink -f "$0"))

if [ ! -d $DOTFILESPATH ]; then
    git clone git://github.com/deanacus/dotfiles $DOTFILESPATH
fi

PLATFORM=`hostname`

if [[ $PLATFORM == 'MSI' ]]; then
  # Install on Windows
  echo ""
  echo "Setting up your Windows environment"
  echo ""
  echo "Linking bash config"
  ln -sf $DOTFILESPATH/bash/bash_profile $HOME/.bash_profile

  echo ""
  echo "Linking Hyper Config"
  ln -sf $DOTFILESPATH/hyper.js /c/Users/dean/AppData/Roaming/Hyper

  echo ""
  echo "Linking VSCode settings"
  ln -sf $DOTFILESPATH/vscode/settings.json $HOME/AppData/Roaming/Code/User/settings.json

  echo ""
  echo "Linking Git configuration"
  ln -sf $DOTFILESPATH/git/gitconfig $HOME/.gitconfig

  echo ""
  echo "Your dotfiles have been installed"

else
  # Install on Unix/Mac
  echo ""
  echo "Linking fish config"
#   ln -sf $DOTFILESPATH/fish/ $HOME/.config/

  echo ""
  echo "Linking Hyper Config"
#   ln -sf $DOTFILESPATH/hyper.js $HOME/.hyper.js

  echo ""
  echo "Linking Spectacle Config"
#   ln -sf $DOTFILESPATH/spectacle.json $HOME/Library/Application\ Support/Spectacle/Shortcuts.json

  echo ""
  echo "Linking VSCode settings"
#   ln -sf $DOTFILESPATH/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

  echo ""
  echo "Linking Git configuration"
#   ln -sf $DOTFILESPATH/git/gitconfig $HOME/.gitconfig

  echo ""
  echo "Your dotfiles have been installed"
fi