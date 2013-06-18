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

# The easy way to search your history
alias hist='history | grep --color=auto'

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias openwithcleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Get your current IP addesses
alias publicip="curl icanhazip.com"
alias localip="ipconfig getifaddr en0"

# Move around the file system with a few keywords
alias home="cd ~"
alias up="cd ../"
alias back="cd -"

# Take a full sized screenshot of a site
alias webscrot="webkit2png -W 1440 -H 900"

# Create a public gist and copy the resulting URL to the clipboard
alias gist="jist -p -c"