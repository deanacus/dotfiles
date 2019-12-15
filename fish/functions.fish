function home -d "Move to the home directory"
  cd ~
end

function up -d "Move up a directory"
  cd ../
end

function back -d "Move back to the previous directory"
  cd -
end

function sleep -d "Put your computer to sleep"
  pmset sleepnow
end

function prune-merged -d "Prune all of the merged branches from your local git repo"
  git checkout master && git fetch -p && git pull && git branch --merged master | grep -v '\* master\|^  master\|^  credit-cards' | xargs -n 1 git branch -d
end

function src -d "Source the shell config file to include any changes made since last launch"
  source ~/.config/fish/config.fish
end

function emulate -d "Launch the the iPhone simulator from XCode for debugging"
  open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app
end

function please -d "When something didn't work right"
  eval command sudo $history[1]
end

function fuck -d "When you're really annoyed that something didn't work right"
  eval command sudo $history[1]
end

function clone -a user repo path -d "Clone a github repository"
  if test $path && test -d $path && test -z (ls $path)
    git clone git@github.com:$user/$repo.git $path
  end
end