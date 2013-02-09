# Determine the size of a file
#
# TODO:
# 1. Figure out how to include decimal portions once size reaches GB
#
fs() {
	ls -lah "$1" | awk '{ print $5}'
}