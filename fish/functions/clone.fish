function clone -a user repo path -d "Clone a github repository"
  if test -n $path && test -d $path && test -z (ls $path)
    git clone git@github.com:$user/$repo.git $path
  else if test -n (ls $path)
    confirm "$path does not exist. Create it?"
    test 0 -eq $status && mkdir -p $path && git clone git@github.com:$user/$repo.git $path && cd $path
  else
    echo "Please provide a valid path to clone $repo to"
  end
end