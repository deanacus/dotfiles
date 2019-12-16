function gitToken -d "Just return my Github Access Token from my SECRETS file"
  if test -f $HOME/dotfiles/SECRETS
    echo (grep "GH_ACCESS_TOKEN" $HOME/dotfiles/SECRETS | sed 's/GH_ACCESS_TOKEN=//')
  end
end