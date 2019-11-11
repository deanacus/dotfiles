set fish_prompt_pwd_dir_length 0

# Git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_dirtystate FCBC47
set __fish_git_prompt_color_stagedstate green
set __fish_git_prompt_color_upstream cyan

# Git Characters
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '⇢'
set __fish_git_prompt_char_upstream_prefix ' '
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '⇡'
set __fish_git_prompt_char_upstream_behind '⇣'
set __fish_git_prompt_char_upstream_diverged '⇡⇣'

function _print_in_color
  set -l string $argv[1]
  set -l color  $argv[2]

  set_color $color
  printf $string
  set_color normal
end

function _prompt_color_for_status
  if test $argv[1] -eq 0
    echo magenta
  else
    echo red
  end
end

function fish_title
  echo (basename $PWD)
end

function fish_prompt
  set -l last_status $status

  _print_in_color "\n"(prompt_pwd) green

  if test (__fish_git_prompt)
    printf " on"
  end

  __fish_git_prompt " %s"

  _print_in_color "\n❯ " magenta

  set_color normal
end


alias home="cd ~"
alias up="cd ../"
alias back="cd -"
alias edit="code -n"
alias getall="wget -e robots=off -r -nc -np -q"
alias fuck="sudo fc -s"
alias please="sudo fc -s"
alias prune-merged="git checkout master && git fetch -p && git pull && git branch --merged master | grep -v '\* master\|^  master\|^  credit-cards' | xargs -n 1 git branch -d"
alias src="source ~/.config/fish/config.fish"
alias emulate="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias sleep="pmset sleepnow"

# Environment Variables

set -g -x EVEREST_DEPLOY_ENV local