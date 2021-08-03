# Normalize `open` across Linux, macOS, and Windows.
# This is needed to make the `o` function (see below) cross-platform.
if [ ! $(uname -s) = 'Darwin' ]; then
  alias open='explorer.exe';
fi

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}


# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

function update() {
sudo softwareupdate --install --all \
  && brew update \
  && brew upgrade \
  && brew cleanup \
  && npm install -g npm \
  && npm update -g
}

function dockerCleanup() {
  local running=$(docker ps -q)
  local containers=$(docker ps -a -q)
  local images=$(docker images -a -q)
  local volumes=$(docker volume ls -q)
  local networks=$(docker network ls | grep -v "host|bridge|none" | wc -l)

  if [ -n "$running" ]; then
    echo "Killing all running containers"
    docker kill $(echo $running) > /dev/null
  fi

  if [ -n "$containers" ]; then
    echo "Removing all existing containers"
    docker rm $(echo $containers) -f > /dev/null
  fi

  if [ -n "$images" ]; then
    echo "Removing all existing images"
    docker rmi $(echo $images) -f > /dev/null
  fi

  if [ -n "$volumes" ]; then
    echo "Removing all existing volumes"
    docker volume rm $(echo $volumes) -f > /dev/null
  fi

  if [ -n "$networks" ]; then
    echo "Removing all existing networks"
    docker network prune -f > /dev/null
  fi

  dockerClearCache
  echo "Done"
}

function flushLogs() {
  for file in ~/dev/rpt/symfony/var/logs/*.log; do
    echo "" > $file
  done
}

function extract() {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

function pls() {
  if [ "$1" ]; then
    sudo $@
  else
    sudo $(fc -ln -1)
  fi
}

# Tmux create session
function tnew() {
  tmux new-session -s $@
}

# Tmux script to rename window
function tname() {
  tmux rename-window $@
}

# Kill a specific tmux session
function tkill() {
  tmux kill-session -t $@
}

function symfonyRefresh() {
  cd ~/dev/rpt/symfony
  mysql --verbose -D xygaming -u root -e "DROP DATABASE IF EXISTS \`xygaming\`;"
  php bin/console doctrine:database:drop -f
  php bin/console doctrine:database:create
  php bin/console doctrine:migrations:migrate -n
  php bin/console doctrine:fixtures:load -n
  php bin/console assets:install
  rm -Rf var/cache/*
  truncate -s 0 var/logs/*.log
}
