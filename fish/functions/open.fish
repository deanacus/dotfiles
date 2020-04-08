function open -a path -d "Cross platform file manager launcher"
  switch $PLATFORM
    case windows
        explorer.exe $path
    case darwin
        open $path
    case linux
        echo I dunno what to do with this
    case ''
        echo "No platform set"
  end
end
