function __fnm_autoload_hook --on-variable PWD --description 'Change Node version on directory change'
  status --is-command-substitution; and return
  fnm use --version-file-strategy recursive --silent-if-unchanged
end

__fnm_autoload_hook