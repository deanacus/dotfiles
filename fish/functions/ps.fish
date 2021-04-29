function ps -d "My preferred ps command by default"
  if test @argv
    command ps -eo pid,state,user,comm
  else
    command ps $argv
  end
end


# I: idle
# R: runnable
# S: sleeping
# T: stopped
# U: uninterruptible
# Z: dead
# E: trying to exit.
# +: foreground