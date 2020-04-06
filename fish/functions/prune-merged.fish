function prune-merged -d "Prune all of the merged branches from your local git repo"
  git checkout master; and git fetch -p; and git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs -n 1 git branch -D
end