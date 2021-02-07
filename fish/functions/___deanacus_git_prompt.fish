function ___deanacus_git_prompt
set -l ___deanacus_status_untracked_color blue
set -l ___deanacus_status_dirty_color yellow
set -l ___deanacus_status_staged_color cyan
set -l ___deanacus_status_stashed_color magenta
set -l ___deanacus_remote_color red
set -l ___deanacus_status_untracked_char '✚'
set -l ___deanacus_status_dirty_char '✱'
set -l ___deanacus_status_staged_char '✘'
set -l ___deanacus_status_stashed_char '❖'
set -l ___deanacus_remote_ahead_char '⇡'
set -l ___deanacus_remote_behind_char '⇣'
set -l ___deanacus_remote_diverged_char '⇕'

set -l ___deanacus_index (command git status --porcelain -b)

set -l ___deanacus_remote_status (echo $___deanacus_index | head -n1 | grep -Eo "\[.*\]")
set -l ___deanacus_remote_ahead (echo $___deanacus_remote_status | grep -Eo "ahead (\d+)" | sed 's/ahead //')
set -l ___deanacus_remote_behind (echo $___deanacus_remote_status | grep -Eo "behind (\d+)" | sed 's/behind //')

# set -l ___deanacus_local_untracked (echo $___deanacus_index | command grep -E '^ A ')
# # set -l ___deanacus_local_dirty (echo $___deanacus_index | command grep -E '^ [CDMRU] ')
# # set -l ___deanacus_local_staged (echo $___deanacus_index | command grep -E '^[ACDMRU]')
# set -l ___deanacus_local_stashed (git rev-parse --verify refs/stash)

## Untracked
if test -n (echo $___deanacus_index | command grep -E '^ A ')
  set_color $___deanacus_status_untracked_color
  printf "$___deanacus_status_untracked_char"
  set_color normal
end

## Dirty
if test -n (echo $___deanacus_index | command grep -E '^ [CDMRU] ')
  set_color $___deanacus_status_dirty_color
  printf $___deanacus_status_dirty_char
  set_color normal
end

## Staged
if test -n (echo $___deanacus_index | command grep -E '^[ACDMRU]')
  set_color $___deanacus_status_staged_color
  printf $___deanacus_status_staged_char
  set_color normal
end

## Stashed
if test -n (echo (command git rev-parse --verify refs/stash 2>/dev/null))
  set_color $___deanacus_status_stashed_color
  printf $___deanacus_status_stashed_char
  set_color normal
end

if test -n "$___deanacus_remote_ahead"
  printf "$___deanacus_remote_ahead$___deanacus_remote_ahead_char"
end
if test -n "$___deanacus_remote_behind"
  printf "$___deanacus_remote_behind_char$___deanacus_remote_behind"
end


end