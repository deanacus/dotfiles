function repo -a name -d "Create a new Github repo, prompt to initialise it in the current dir if it isn't current a repo, or ask if the remote should be added to this repo if it is."
  if test $name
    curl \
      -X POST \
      -H "Authorization: token $GITHUB_ACCESS_TOKEN" \
      -d "{\"name\":\"$name\"}" \
      https://api.github.com/user/repos
  else
    echo "Repo name required."
  end

  set url (eval getRepo $name)

  if test -d $PWD/.git
    set_color green;
    if test (confirm "Set current repo remote to new repo?")
      git remote add origin $url
    else
      echo "Fuck"
    end
    set_color normal;
  else
    set_color green;
    if test (confirm "Initialise new repo in $PWD and add new Github repo as remote?")
      git remote add origin $url
    else
      echo "Fuck"
    end
    set_color normal;
  end

end