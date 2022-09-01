# This file contains fish universal variable definitions.
# VERSION  3.0

# Make neovim my editor
set -g EDITOR nvim

set -x WORKDIR ~/dev/rpt

# Add my own function path
set -g fish_function_path ~/dotfiles/fish/functions $fish_function_path

# Add my own "bin" folder to $PATH
set -g fish_user_paths ~/bin $fish_user_paths
set -g fish_user_paths /home/deanacus/.local/bin $fish_user_paths

set -g fish_user_paths ~/dotfiles/git/extras $fish_user_paths
set -g fish_user_paths ~/dotfiles/git/extras/utils $fish_user_paths
set -g fish_user_paths ~/.cargo/bin $fish_user_paths

set -g RIPGREP_CONFIG_PATH ~/.ripgreprc

# Add another person "bin" folder to $PATH, this time from ~/dotfiles
set -g fish_user_paths ~/dotfiles/bin $fish_user_paths
# Add go to $PATH
set -g fish_user_paths /usr/local/go/bin $fish_user_paths
# Add globally installed composer packages to $PATH
set -g fish_user_paths ~/.composer/vendor/bin $fish_user_paths

set -gx PATH "/tmp/fnm_multishells/16402_1648615657683/bin" $PATH;
set -gx FNM_MULTISHELL_PATH "/tmp/fnm_multishells/16402_1648615657683";
set -gx FNM_VERSION_FILE_STRATEGY "recursive";
set -gx FNM_DIR "/home/deanacus/.fnm";
set -gx FNM_LOGLEVEL "info";
set -gx FNM_NODE_DIST_MIRROR "https://nodejs.org/dist";
set -gx FNM_ARCH "x64";


set -U FZF_DEFAULT_COMMAND 'fd --type f'

set -x PASTEL_COLOR_MODE 24bit

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
set -g PLATFORM (eval platform)
set -x DISPLAY (eval display)

