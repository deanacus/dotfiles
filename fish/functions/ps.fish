function ps -d "My preferred ps command by default"
  if test -z "$argv"
    command ps -eo pid,user,%mem,args,bsdstart --sort=-%mem,-bsdstart
  else
    command ps $argv
  end
end