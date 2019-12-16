function prune-merged -d "Prune all of the merged branches from your local git repo"
  git checkout master && git fetch -p && git pull && git branch --merged master | grep -v '\* master\|^  master\|^  credit-cards' | xargs -n 1 git branch -d
end