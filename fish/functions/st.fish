function st

set -l __prompt_git_status_untracked "\033[36m ❖ \033[0m" # ❖
set -l __prompt_git_status_added "\033[32m ✚ \033[0m" # + ✚
set -l __prompt_git_status_modified "\033[35m ✱ \033[0m" # ✱
set -l __prompt_git_status_renamed '\033[33m » \033[0m' # »
set -l __prompt_git_status_deleted '\033[31m ✘ \033[0m' # ✘
set -l __prompt_git_status_unmerged '\033[31m ≠ \033[0m' # ≠
set -l __prompt_states untracked added modified renamed deleted unmerged

set -l __prompt_git_upstream_ahead '\033[32m ⇡ \033[0m'
set -l __prompt_git_upstream_behind '\033[32m ⇣ \033[0m'
set -l __prompt_git_upstream_diverged '\033[31m ⇕ \033[0m'

set -l __prompt_git_stash '\033[35m $ \033[0m'

set -l __local_state ''
set -l __prompt_status ''
set -l __prompt_stash ''
set -l __prompt_upstream ''


# Get the porcelain current state of the current working tree
set -l __git_status (command git status --porcelain 2>/dev/null -b)

# take the first column of each row, which is the individual file status
set -l __file_statuses (string split \n $__git_status | string sub --start 1 --length 2)

# upstream status
set -l __upstream_status (string match -r "\[.*\]" $__git_status | string trim -c=[])

# ahead status
set -l __upstread_ahead string match -r "ahead (\d)"

# behind status

# ahead status
set -l __upstread_behind string match -r "behind (\d)"

# interate over the file statuses and update the prompt as required
for i in $__file_statuses
  if test (string match '\?\?' $i)
    set __local_state untracked $__local_state
  end
  if test (string match '*A*' $i)
    set __local_state added $__local_state
  end
  if test (string match '*M*' $i)
    set __local_state modified $__local_state
  end
  if test (string match '*R*' $i)
    set __local_state renamed $__local_state
  end
  if test (string match '*D*' $i)
    set __local_state deleted $__local_state
  end
  if test (string match '*U*' $i)
    set __local_state unmerged $__local_state
  end
end

if test -n "$__upstream_status"
  if test (string match '*ahead*behind*' $__upstream_status)
    set __prompt_upstream "\033[31m$__prompt_git_upstream_diverged\033[0m"
  else if test (string match '*ahead*' $__upstream_status)
    set __prompt_upstream "\033[32m$__prompt_git_upstream_ahead\033[0m"
  else if test (string match '*behind*' $__upstream_status)
    set __prompt_upstream "\033[33m$__prompt_git_upstream_behind\033[0m"
  end
end

if test -n (echo (command git rev-parse --verify refs/stash 2>/dev/null))
  set __prompt_stash $__prompt_git_stash
end

echo $__local_state
for i in $__prompt_states
  contains $i $__local_state
  if test $status -eq 0
    set -l __prompt_char __prompt_git_status_$i
    set __prompt_status "$__prompt_status$$__prompt_char"
  end
end
 \
set __prompt_status (string trim $__prompt_status)


printf "$__prompt_status $__prompt_upstream"
printf $__prompt_stash
end
