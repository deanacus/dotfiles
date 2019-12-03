#!/bin/bash
#
# AUTHOR: Dean Harris
# DATE: 29/1/2013
# VERSION: 0.7
#
# DESCRIPTION:
# Stupid simple dotfile symlink creator.

if [ ! -d ~/dotfiles ]; then
    git clone git://github.com/deanacus/dotfiles ~/dotfiles
fi

PLATFORM=`hostname`

# Setup Fish
echo ""
echo "Linking config.fish"
ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/fish/variables.fish ~/.config/fish/fish_variables

echo ""
echo "Linking .gitconfig"
  ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
if [[ $PLATFORM == 'C00136' ]]; then
  git config --global user.email "dean.harris@comparethemarket.com.au"
else
  git config --global user.email "dean@harris.tc"
fi

echo ""
echo "Linking Hyper Config"
ls -sf ~/dotfiles/hyper.js ~/.hyper.js

echo ""
echo "Linking Spectacle Config"
ls -sf ~/dotfiles/spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json

echo ""
echo "Linking VSCode settings"
ln -sf ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

echo ""
echo "Your dotfiles have been installed"
