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

# Shared config between home and work

echo ""
echo "Linking fish config"
if [ ! -d $HOME/.config/fish ]; then
  mkdir $HOME/.config/fish
fi
ln -sfn $DOTFILESPATH/fish/config.fish $HOME/.config/fish/config.fish

echo ""
echo "Linking Git configuration"
ln -sfn $DOTFILESPATH/git/gitconfig $HOME/.gitconfig

echo ""
echo "Linking Vim configuration"
ln -sf $DOTFILESPATH/vim/vimrc $HOME/.vimrc

echo ""
echo "Linking NPM configuration"
ln -sf $DOTFILESPATH/npmrc $HOME/.npmrc

if [[ $PLATFORM == 'MSI' ]]; then
  # VSCode on WSL is technically a remote server, so
  # Put the file in the right spot
  echo ""
  echo "Linking VSCode settings in WSL"
  ln -sfn $DOTFILESPATH/vscode/settings.json $HOME/.vscode-server/data/Machine/settings.json

  # Link the same file for the host os version. Means I've got the same
  # config between remote and local environments (although VSCode can't tell)
  # echo ""
  # echo "Linking VSCode settings in Windows"
  # ln -sfn $DOTFILESPATH/vscode/settings.json $HOME/.vscode-server/data/Machine/settings.json
else
  echo ""
  echo "Linking Hyper Config"
  ln -sf $DOTFILESPATH/hyper.js $HOME/.hyper.js

  echo ""
  echo "Linking Spectacle Config"
  ln -sf $DOTFILESPATH/spectacle.json $HOME/Library/Application\ Support/Spectacle/Shortcuts.json

  echo ""
  echo "Linking VSCode settings"
  ln -sf $DOTFILESPATH/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
fi

echo ""
echo "Your dotfiles have been installed"
