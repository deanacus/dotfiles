function copy -a input -d "Cross copy to clipboard"
  if test -z $input
    echo (set_color red)"Nothing to copy"(set_color normal)
    return 27
  end

  if test -f $input
    switch $PLATFORM
      case windows
        echo $input
          clip.exe < $input
      case darwin
          command cat $input | pbcopy
      case linux
          echo I dunno what to do with this
      case ''
          echo "No platform set"
    end
  end
end