set -g fish_prompt_pwd_dir_length 0

# Git prompt
set -g __fish_git_prompt_showuntrackedfiles 'yes'
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showupstream 'yes'
set -g __fish_git_prompt_showstashstate 'yes'
set -g __fish_git_prompt_color_branch white --dim
set -g __fish_git_prompt_color_dirtystate red
set -g __fish_git_prompt_color_stagedstate brblue
set -g __fish_git_prompt_color_stashstate cyan
set -g __fish_git_prompt_color_upstream magenta
set -g __fish_git_prompt_color_untrackedfiles yellow

# Git Characters
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_stashstate '$'
set -g __fish_git_prompt_char_dirtystate '!'
set -g __fish_git_prompt_char_stagedstate '⭢'
set -g __fish_git_prompt_char_untrackedfiles '+'
set -g __fish_git_prompt_char_upstream_prefix ''
set -g __fish_git_prompt_char_upstream_equal ''
set -g __fish_git_prompt_char_upstream_ahead '⇡'
set -g __fish_git_prompt_char_upstream_behind '⇣'
set -g __fish_git_prompt_char_upstream_diverged '⇕'

function _print_in_color
  set -l string $argv[1]
  set -l color  $argv[2]

  set_color $color
  printf $string
  set_color normal
end

function fish_title
  prompt_pwd
end

function fish_host
  if test $WSL_DISTRO_NAME
    echo "$WSL_DISTRO_NAME\n"
  else
    echo "$NAME\n"
  end
end

function host
  if test $WSL_DISTRO_NAME
    echo "\n$WSL_DISTRO_NAME\n"
  else
    echo "\n$hostname\n"
  end
end

function fish_prompt
  _print_in_color (host) brblack
  _print_in_color (prompt_pwd) green
  __fish_git_prompt " %s"
  _print_in_color "\n❯ " magenta
end
