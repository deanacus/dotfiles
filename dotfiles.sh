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
echo "Linking .zsh_profile"
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
echo "Linking .inputrc"
ln -sf ~/dotfiles/inputrc ~/.inputrc
echo "Linking .gitconfig"
  ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
  ln -sf ~/dotfiles/git/gitmessage ~/.gitmessage
if [[ $PLATFORM == 'C00136' ]]; then
  git config --global user.email "dean.harris@comparethemarket.com.au"
elif [[ $PLATFORM == 'Deans-MacBook-Pro.local' ]]; then
  git config --global user.email "dean@harris.tc"
fi

echo "Linking Vim config"
ln -sf ~/dotfiles/vim $HOME/.vim
echo "Linking tmux config"
ln -sf ~/dotfiles/tmux.conf $HOME/.tmux.conf
echo "Linking VSCode settings"
ln -sf ~/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
echo "Linking VSCode keybindings"
ln -sf ~/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
echo "Linking VSCode snippets"
ln -sf ~/dotfiles/vscode/snippets/ $HOME/Library/Application\ Support/Code/User/snippets/
echo "Linking .hyperjs"
ln -sf ~/dotfiles/hyper.js ~/.hyper.js
echo "Linking .eslintrc"
ln -sf ~/dotfiles/eslintrc ~/.eslintrc
echo "Linking .sass-lint.yml"
ln -sf ~/dotfiles/sass-lint.yaml ~/.sass-lint.yml
echo ""
echo "Your dotfiles have been installed"
