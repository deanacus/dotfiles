function cat -d "Use bat by default if it exists"
  if type -q bat
    bat $argv
  else
    command cat $argv
  end
end
