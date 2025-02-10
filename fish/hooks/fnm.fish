function _fnm_autoload --on-variable PWD
  status --is-command-substitution; and return;
  fnm use --silent-if-unchanged
end

_fnm_autoload