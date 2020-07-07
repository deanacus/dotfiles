#!/bin/bash

#Development Environment

# apache2
# redis
# mariadb-server
# mongodb
# php
# php-bcmath
# php-common
# php-curl
# php-mbstring
# php-mysql
# php-xml
# php-zip
# nodejs

# Dev Tools

# Neovim
# FZF
# FD
# Ripgrep
# Bat

# System Config

# mysql allow non root access

# Set come color variables so we can make shit look pretty

black="\033[30m"
red="\033[31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
magenta="\033[35m"
cyan="\033[36m"
white="\033[37m"
reset="\033[0m"

print_color() {
 printf "$1$2$reset"
}

heading() {
  print_color $yellow "\n\n$1"
}

subheading() {
  print_color $cyan "\n\n$1"
}

message() {
  printf "\n"
  print_color $blue "$1"
}

success() {
  printf "\n"
  print_color $green "\xE2\x9C\x94 "
  print_color $blue "$1"
}

password_prompt=$(printf "\033[1m\033[30mEnter your password\033[0m\n>")

clear

heading "Windows Subsystem For Linux Setup Script"

sudo -p "$password_prompt" -v

sudo apt-get update > /dev/null &&

subheading "Development Environment"

sudo apt-get install -y apache2 > /dev/null &&
success "Apache" &&

sudo apt-get install -y mariadb-server > /dev/null &&
success "Mariadb" &&

sudo apt-get install -y mongodb > /dev/null &&
success "MongoDB" &&

sudo apt-get install -y redis-server > /dev/null &&
success "MongoDB" &&

sudo apt-get install -y php php-bcmath php-common php-curl php-mbstring php-mysql php-xml php-zip > /dev/null &&
success "PHP" &&


subheading "Development Tools"

sudo apt-add-repository ppa:fish-shell/release-3 > /dev/null &&
sudo apt install fish > /dev/null &&
success "Fish" &&

sudo apt-get install -y neovim > /dev/null &&
success "Neovim" &&

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - > /dev/null &&
sudo apt-get install -y nodejs > /dev/null &&
success "Node" &&

sudo apt-get install fzf > /dev/null &&
success "FZF" &&

curl -fLo /tmp/fd.deb https://github.com/sharkdp/fd/releases/download/v8.1.1/fd-musl_8.1.1_amd64.deb > /dev/null &&
sudo dpkg -i /tmp/fd.deb > /dev/null
success "FD" &&

curl -fLo /tmp/ripgrep.deb https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb > /dev/null &&
sudo dpkg -i /tmp/ripgrep.deb > /dev/null &&
success "Ripgrep" &&

curl -fLo /tmp/bat.deb https://github.com/sharkdp/bat/releases/download/v0.15.4/bat-musl_0.15.4_amd64.deb > /dev/null &&
sudo dpkg -i /tmp/bat.deb > /dev/null &&
success "Bat" &&

subheading "Personalising Environment"

if [ ! -d $HOME/dotfiles ]; then
  git clone git@github.com:deanacus/dotfiles.git $HOME/dotfiles > /dev/null &&
  success "Dotfiles cloned"
fi

if [ ! -f $HOME/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -b 4096 -C "dean@repeat.gg" -f $HOME/.ssh/id_rsa -P "" > /dev/null &&
  success "SSH key generated"
fi

clear

success "Setup complete"