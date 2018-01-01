#
# ~/.bash_profile
#
# AUTHOR: Dean Harris
# DATE: 11/1/2013
# VERSION: 0.1
#
# DESCRIPTION:
# Not really a whole lot to it, just a standard .bash_profile
# file. Configures bash the way I want it, and is easy to
# read and understand. Hopefully.
#
# TODO:
# 1. Set colours so that everything is coloured, not just prompt.
#

source ~/dotfiles/bash_exports
source ~/dotfiles/bash_prompt
source ~/dotfiles/bash_aliases
if [ -f ~/dotfiles/git-completion.bash ]; then
  . ~/dotfiles/git-completion.bash
fi

# Install dotfiles every time I launch a new session to ensure
# I stop committing at work with dean@harris.tc and stop
# committing at home with work email

~/dotfiles/dotfiles.sh

# Should probably show MOTD, but I just really like a clean
# terminal to come home to.
clear