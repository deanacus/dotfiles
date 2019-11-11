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

echo ""
echo "Linking config.fish"
ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
echo ""
echo "Linking .inputrc"
ln -sf ~/dotfiles/inputrc ~/.inputrc
echo ""
echo "Linking .gitconfig"
  ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
if [[ $PLATFORM == 'C00136' ]]; then
  git config --global user.email "dean.harris@comparethemarket.com.au"
else
  git config --global user.email "dean@harris.tc"
fi

echo "Linking VSCode settings"
ln -sf ~/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
echo ""
echo "Your dotfiles have been installed"
