function paste -d "paste some shit into the terminal"
  switch $PLATFORM
    case windows
      powershell.exe Get-Clipboard | sed 's/\r\n$//'
    case darwin
      pbpaste
    case linux
      echo I dunno what to do with this
    case ''
      echo "No platform set"
  end
end