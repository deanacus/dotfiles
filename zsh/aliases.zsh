# File system stuff
alias home="cd ~"
alias up="cd ../"
alias back="cd -"
# alias emulate="open -a /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"


# source ~/.zshrc
alias src="source $HOME/.zshrc"

# vhosts
alias hosts='sudo vim /etc/hosts'

# copy file interactive
alias cp='cp -iv'

# move file interactive
alias mv='mv -iv'

# make new dir path
alias mkdir="mkdir -pv"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//[:,]/\\n}'

# Rerun last command as sudo
alias please='sudo $(fc -ln -1)'
alias fuck='sudo $(fc -ln -1)'


alias cat="bat"
