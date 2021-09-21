function getPrompt() {
  echo "$(gprompt)"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd getPrompt

PROMPT=$'%F{magenta}❯%f '
