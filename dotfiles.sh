#!/bin/bash
#
# AUTHOR: Dean Harris
# DATE: 29/1/2013
# VERSION: 0.7
#
# DESCRIPTION:
# Stupid simple dotfile symlink creator.

PLATFORM=`uname`

echo ""
echo "Linking .bash_profile"
ln -sf ~/dotfiles/bash_profile ~/.bash_profile
echo "Linking .inputrc"
ln -sf ~/dotfiles/inputrc ~/.inputrc
if [[ $PLATFORM == 'MSYS_NT-6.1' ]]; then
  echo "Linking .gitconfig"
  ln -sf ~/dotfiles/gitconfig.work ~/.gitconfig
  echo "Linking VSCode settings"
  ln -sf ~/dotfiles/vscode.json $APPDATA/Code/User/settings.json
elif [[ $PLATFORM == 'Darwin' ]]; then
  echo "Linking .gitconfig"
  ln -sf ~/dotfiles/gitconfig ~/.gitconfig
  echo "Linking VSCode settings"
  ln -sf ~/dotfiles/vscode.json $HOME/Library/Application Support/Code/User/settings.json
fi
echo ""
echo "Your dotfiles have been installed"
