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
alias emulate="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

## This is here because I don't have a functions file, and I've only got a single function

# Usa
function upstart() {
	if [ ! -z $1 ]; then
		cd ~/_src
		mkdir $1
		cd $1
		echo "Cloning repo"
		git clone --depth=1 --branch=master git@github.com:deanacus/upstart-webpack.git . &> /dev/null
		rm -rf .git
		echo "Installing dependancies"
		yarn install &> /dev/null
		echo "Done"
		code .
	else
		echo "Pass a project folder to create"
	fi
}