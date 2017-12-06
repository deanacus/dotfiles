#!/bin/bash
#
# AUTHOR: Dean Harris
# DATE: 29/1/2013
# VERSION: 0.7
#
# DESCRIPTION:
# Stupid simple dotfile symlink creator.

PLATFORM=`hostname`

echo ""
echo "Linking .bash_profile"
ln -sf ~/dotfiles/bash_profile ~/.bash_profile
echo "Linking .inputrc"
ln -sf ~/dotfiles/inputrc ~/.inputrc
echo "Linking .gitconfig"
  ln -sf ~/dotfiles/gitconfig ~/.gitconfig
  ln -sf ~/dotfiles/gitmessage ~/.gitmessage
if [[ $PLATFORM == 'C00136' ]]; then
  git config --global user.email "dean.harris@comparethemarket.com.au"
elif [[ $PLATFORM == 'Deans-MacBook-Pro.local' ]]; then
  git config --global user.email "dean@harris.tc"
fi

echo "Linking VSCode settings"
ln -sf ~/dotfiles/vscode.json $HOME/Library/Application\ Support/Code/User/settings.json
echo "Linking .hyperjs"
ln -sf ~/dotfiles/hyperjs ~/.hyperjs
echo "Linking .jsbeautifyrc"
ln -sf ~/dotfiles/jsbeautifyrc ~/.jsbeautifyrc
echo ""
echo "Your dotfiles have been installed"
