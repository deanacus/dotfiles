function ls -d "Make ls use exa"
  if type -q exa
    exa $argv
  else
    command ls $argv
  end
end
