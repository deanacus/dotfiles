fish_add_path $HOME/.local/bin /opt/homebrew/bin $HOME/.npm/bin $HOME/.cargo/bin /usr/local/go/bin

eval (fnm env --shell fish --version-file-strategy recursive)

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

if not contains $HOME/dotfiles/fish/functions $fish_function_path
  set -U fish_function_path $HOME/dotfiles/fish/functions $fish_function_path
end

source $HOME/dotfiles/fish/hooks/fnm.fish
