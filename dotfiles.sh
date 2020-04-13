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

OS=$(os)

# Shared config between home and work

echo ""
echo "Linking fish config"
if [ ! -d $HOME/.config/fish ]; then
  mkdir $HOME/.config/fish
fi
ln -sf $HOME/dotfiles/fish/config.fish $HOME/.config/fish/config.fish

echo ""
echo "Linking Git configuration"
ln -sf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig

echo ""
echo "Linking Vim configuration"
ln -sf $HOME/dotfiles/vim/vimrc $HOME/.vimrc
if [ ! -d $HOME/.vim ]; then
  mkdir -p $HOME/.vim/autoload
fi
ln -sf $HOME/dotfiles/vim/autoload/plug.vim $HOME/.vim/autoload/plug.vim

echo ""
echo "Linking NPM configuration"
ln -sf $HOME/dotfiles/npmrc $HOME/.npmrc

if [[ $OS == 'MSI' ]]; then
  # VSCode on WSL is technically a remote server, so
  # Put the file in the right spot
  echo ""
  echo "Linking VSCode settings in WSL"
  ln -sfn $HOME/dotfiles/vscode/settings.json $HOME/.vscode-server/data/Machine/settings.json

  # Link the same file for the host os version. Means I've got the same
  # config between remote and local environments (although VSCode can't tell)
  # echo ""
  # echo "Linking VSCode settings in Windows"
  # ln -sfn $HOME/dotfiles/vscode/settings.json $HOME/.vscode-server/data/Machine/settings.json
else
  echo ""
  echo "Linking Alacritty Config"
  ln -sf $HOME/dotfiles/alacritty.yml $HOME/.alacritty.yml

  echo ""
  echo "Linking Hyper Config"
  ln -sf $HOME/dotfiles/hyper.js $HOME/.hyper.js

  echo ""
  echo "Linking Spectacle Config"
  ln -sf $HOME/dotfiles/spectacle.json $HOME/Library/Application\ Support/Spectacle/Shortcuts.json

  echo ""
  echo "Linking VSCode settings"
  ln -sf $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
fi

echo ""
echo "Your dotfiles have been installed"
