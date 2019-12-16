function clone -a user repo path -d "Clone a github repository"
  if test $path && test -d $path && test -z (ls $path)
    git clone git@github.com:$user/$repo.git $path
  end
end