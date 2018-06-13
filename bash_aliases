# Move around the file system with a few keywords
alias home="cd ~"
alias up="cd ../"
alias back="cd -"
alias edit="code -n"
alias getall="wget -e robots=off -r -nc -np -q"
alias fuck="sudo fc -s"
alias please="sudo fc -s"
alias prune-merged="git checkout develop && git fetch -p && git pull && git branch --merged develop | grep -v '\* develop\|^  master\|^  credit-cards' | xargs -n 1 git branch -d"
alias src="source ~/.bash_profile"

# Chucking this here temporarily for testing, and will split out a bash_functions file if I keep it/add more

function cl() {
	local repo=$(pbpaste)
	git clone $repo && code "$(basename "$repo" | cut -f 1 -d '.')"
}