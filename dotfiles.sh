#!/bin/bash
#
# AUTHOR: Dean Harris
# DATE: 29/1/2013
# VERSION: 0.7
#
# DESCRIPTION:
# Stupid simple dotfile symlink creator.

# Shared config between home and work

dotfiles=$HOME/dotfiles
config=$HOME/.config
appData=/mnt/c/Users/dean/AppData/Roaming

OS=$($dotfiles/bin/os)

# echo ""
# echo "Linking fish config"
# if [ ! -d $config/fish ]; then
#   mkdir $config/fish
# fi
# ln -sf $dotfiles/fish/config.fish $config/fish/config.fish

echo ""
echo "Linking ZSH configuration"
ln -sf $dotfiles/zsh/zshrc $HOME/.zshrc

echo ""
echo "Linking Git configuration"
ln -sf $dotfiles/git/gitconfig $HOME/.gitconfig

# echo ""
# echo "Linking Tmux configuration"
# ln -sf $dotfiles/tmux/tmux.conf $HOME/.tmux.conf

# echo ""
# echo "Linking Neovim configuration"
# if [ ! -d $config/nvim/autoload ]; then
#   mkdir -p $config/nvim/autoload
# fi
# if [ ! -f $config/nvim/autoload/plug.vim ]; then
#   curl -fLo $config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# fi
# ln -sf $dotfiles/vim/vimrc $config/nvim/init.vim

echo ""
echo "Linking NPM configuration"
ln -sf $dotfiles/npmrc $HOME/.npmrc


#######
# WSL #
#######

# echo ""
# echo "Linking VSCode settings"
# if [ ! -d $HOME/.vscode-server/data/Machine ]; then
#   mkdir -p $HOME/.vscode-server/data/Machine
# fi
# ln -sfn $dotfiles/vscode/settings.json $HOME/.vscode-server/data/Machine/settings.json

if [[ $OS == 'windows' ]]; then
  # VSCode on WSL is technically a remote server, so put the file in the right spot
  # echo ""
  # echo "Linking VSCode settings in WSL"
  # if [ ! -d $HOME/.vscode-server/data/Machine ]; then
  #   mkdir -p $HOME/.vscode-server/data/Machine
  # fi
  # ln -sfn $dotfiles/vscode/settings.json $HOME/.vscode-server/data/Machine/settings.json

  # Link the same file for the host os version. Means I've got the same
  # config between remote and local environments (although VSCode can't tell)
  # echo ""
  # echo "Linking VSCode settings in Windows"
  # ln -sf $dotfiles/vscode/settings.json $appData/Code/User/settings.json
  echo ""
else

  echo ""
  echo "Linking Hyper Config"
  ln -sf $dotfiles/hyper.js $HOME/.hyper.js

  echo ""
  echo "Linking VSCode settings"
  ln -sf $dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
fi

echo ""
echo "Your dotfiles have been installed"
