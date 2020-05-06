function copy -d "Cross platform copy to clipboard command"
  switch $PLATFORM
    case windows
        echo -n "$argv" | clip.exe
    case darwin
        echo -n "$argv" | pbcopy
    case linux
        echo I dunno what to do with this
    case ''
        echo "No platform set"
  end
end