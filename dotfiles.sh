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
echo "Linking .gitconfig"
ln -sf ~/dotfiles/gitconfig ~/.gitconfig

# Atom
if [ ! -d ~/.atom/ ]; then
  echo ""
  echo "Atom not installed"
else
  echo ""
  echo "Installing any Atom packages not already installed"
  PACKAGES="$(< ./atom/atom-packages)"
  for PACKAGE in $PACKAGES; do
    if [ ! -d ~/.atom/packages/$PACKAGE ]; then
        apm install $PACKAGE
    fi
  done
fi
echo ""
echo "Your dotfiles have been installed"
