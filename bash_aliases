# Make ls always show colors
alias ls="ls -G"

# Set a quick way to source .bash_profile from anywhere
alias src="source ~/.bash_profile"

# alias clear to an uncommon quick key combination
alias xx="clear"

# Set up aliases to start, stop, and restart Apache
alias startapache="sudo apachectl start"
alias stopapache="sudo apachectl stop"
alias restartapache="sudo apachectl restart"

# Host file
alias hosts='sudo $EDITOR /etc/hosts'

# Open current directory in Finder
alias f='open -a Finder ./'

# Pretty git log
alias gl="git log --pretty=format:'%s:%n%Cgreen%h%Creset - %C(cyan)%aD%C(reset) %C(red)(%ar)%C(reset)%n' --abbrev-commit"

alias hist='history | grep --color=auto'