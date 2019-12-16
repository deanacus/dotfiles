function confirm -a message
  while true
    read -p 'echo "$message (y/n):"' -l confirmation

    switch $confirmation
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end