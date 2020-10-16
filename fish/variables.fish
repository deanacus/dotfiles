# This file contains fish universal variable definitions.
# VERSION  3.0
set -g EDITOR nvim
set -g fish_function_path ~/dotfiles/fish/functions $fish_function_path
set -g fish_user_paths ~/bin ~/dotfiles/bin ~/dotfiles/bin/local ~/.cargo/bin /usr/local/opt/fzf/bin /usr/local/sbin /usr/local/go/bin $fish_user_paths
set -U FZF_DEFAULT_COMMAND 'fd --type f'

set fish_greeting ""
set fish_color_command
set fish_color_comment yellow
set fish_color_end brmagenta
set fish_color_escape bryellow --bold
set fish_color_operator magenta
set fish_color_param cyan
set fish_color_quote yellow
set fish_color_redirection brblue
set fish_color_valid_path blue
set fish_color_error normal
set -g PLATFORM (eval os)
set -g gateway (cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}')
set -g --export DISPLAY "$gateway:0.0"
