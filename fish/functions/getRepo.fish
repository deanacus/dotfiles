function getRepo -a name
  if test $name
    curl https://api.github.com/repos/deanacus/$name \
      -s \
      -H "Authorization: token $githubToken" \
      | jq '.git_url' \
      | sed 's/\"//g'
  end
end