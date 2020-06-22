# This file contains fish universal variable definitions.
# VERSION  3.0
set -U --export EDITOR nvim
set -g fish_function_path ~/dotfiles/fish/functions $fish_function_path
set -g fish_user_paths ~/dotfiles/bin ~/dotfiles/bin/local /usr/local/opt/fzf/bin /usr/local/sbin $fish_user_paths
set -U --export PLATFORM (eval os)
set -U fish_greeting ""
set -U fish_color_valid_path blue
set -U fish_color_error normal
set -U FZF_DEFAULT_COMMAND 'fd --type f'
set -U --export DISPLAY localhost:0.0 # Set up the display for WSL x11
