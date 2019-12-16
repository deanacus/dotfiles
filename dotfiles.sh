#!/bin/bash
#
# AUTHOR: Dean Harris
# DATE: 29/1/2013
# VERSION: 0.7
#
# DESCRIPTION:
# Stupid simple dotfile symlink creator.

if [ ! -d $HOME/dotfiles ]; then
    git clone git://github.com/deanacus/dotfiles $HOME/dotfiles
fi

PLATFORM=`hostname`

echo ""
echo "Linking fish config"
ln -sf $HOME/dotfiles/fish/ $HOME/.config/

echo ""
echo "Linking Hyper Config"
ln -sf $HOME/dotfiles/hyper.js $HOME/.hyper.js

echo ""
echo "Linking Spectacle Config"
ln -sf $HOME/dotfiles/spectacle.json $HOME/Library/Application\ Support/Spectacle/Shortcuts.json

echo ""
echo "Linking VSCode settings"
ln -sf $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

echo ""
echo "Linking Git configuration"
  ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

if [[ $PLATFORM == 'C00136' ]]; then
  git config --global user.email "dean.harris@comparethemarket.com.au"
else
  git config --global user.email "dean@harris.tc"
fi

echo ""
echo "Your dotfiles have been installed"
