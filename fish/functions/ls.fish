function ls -d "Use exa by default if it exists"
  if type -q eza
    eza --group-directories-first --header --git --no-permissions --no-time $argv
  else
    command ls $argv
  end
end