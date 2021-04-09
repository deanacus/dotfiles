# Normalize `open` across Linux, macOS, and Windows.
# This is needed to make the `o` function (see below) cross-platform.
if [ ! $(uname -s) = 'Darwin' ]; then
	if grep -q Microsoft /proc/version; then
		# Ubuntu on Windows using the Linux subsystem
		alias open='explorer.exe';
	else
		alias open='xdg-open';
	fi
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