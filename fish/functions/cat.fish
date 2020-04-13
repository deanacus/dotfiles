function cat -d "Make cat use bat"
  if type -q bat
    bat $argv
  else
    command cat $argv
  end
end
