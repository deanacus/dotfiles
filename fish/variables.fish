# This file contains fish universal variable definitions.
# VERSION  3.0
set -g EDITOR nvim
set -g fish_function_path ~/dotfiles/fish/functions $fish_function_path
set -g fish_user_paths ~/dotfiles/bin ~/dotfiles/bin/local /usr/local/opt/fzf/bin /usr/local/sbin $fish_user_paths
set -U FZF_DEFAULT_COMMAND 'fd --type f'
