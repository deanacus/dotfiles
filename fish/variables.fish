# This file contains fish universal variable definitions.
# VERSION  3.0

# Make neovim my editor
set -g EDITOR nvim

# Add my own function path
set -g fish_function_path ~/dotfiles/fish/functions $fish_function_path

# Add my own "bin" folder to $PATH
set -g fish_user_paths ~/bin $fish_user_paths
# Add another person "bin" folder to $PATH, this time from ~/dotfiles
set -g fish_user_paths ~/dotfiles/bin $fish_user_paths
# Add go to $PATH
set -g fish_user_paths /usr/local/go/bin $fish_user_paths
# Add globally installed composer packages to $PATH
set -g fish_user_paths ~/.composer/vendor/bin $fish_user_paths


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
