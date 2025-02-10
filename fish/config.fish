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

# Set the environment variables for fnm
eval (fnm env --shell fish --version-file-strategy recursive)

# Source the hook for fnm
source $HOME/dotfiles/fish/hooks/fnm.fish

# Add local binaries to path
if not contains $HOME/.local/bin $fish_user_paths
  fish_add_path $HOME/.local/bin
end

# Add Homebrew binaries to path
if not contains /opt/homebrew/bin $fish_user_paths
  fish_add_path /opt/homebrew/bin
end

# Add NPM binaries to path
if not contains $HOME/.npm/bin $fish_user_paths
  fish_add_path $HOME/.npm/bin
end

# Add Rust binaries to path
if not contains $HOME/.cargo/bin $fish_user_paths
  fish_add_path $HOME/.cargo/bin
end

# Add my functions to function_path
if not contains $HOME/dotfiles/fish/functions $fish_function_path
  set -U fish_function_path $HOME/dotfiles/fish/functions $fish_function_path
end