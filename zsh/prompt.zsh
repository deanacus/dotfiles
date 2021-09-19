# prompt_git_precmd() {
#   gprompt
# }

function getPrompt() {
  echo
  echo $(gprompt)
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd getPrompt

PROMPT=$'%F{magenta}❯%f '


# zle -N zle-keymap-select
# zle -N zle-line-init

# function zle-line-init zle-keymap-select {
#     PROMPT=$($SLICK_PATH prompt -k "$KEYMAP" -d ${slick_prompt_data:-""})
#     zle && zle reset-prompt
# }