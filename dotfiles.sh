#!/bin/bash
#
# AUTHOR: Dean Harris
# DATE: 29/1/2013
# VERSION: 0.7
#
# DESCRIPTION:
# Stupid simple dotfile symlink creator.

echo ""
echo "Linking .bash_profile"
ln -sf ~/dotfiles/bash_profile ~/.bash_profile
echo ""
echo "Linking .inputrc"
ln -sf ~/dotfiles/inputrc ~/.inputrc
echo ""
echo "Are you at work?"
read enviro
echo "Linking .gitconfig"
if [ $enviro == "y" ]; then
  ln -sf ~/dotfiles/gitconfig.work ~/.gitconfig
else
  ln -sf ~/dotfiles/gitconfig ~/.gitconfig
fi
echo ""
echo "Your dotfiles have been installed"
