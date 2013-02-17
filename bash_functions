# Determine the size of a file
#
# TODO:
# 1. Figure out how to include decimal portions once size reaches GB
#

# calculate the filesize of a given file
fs() {
	ls -lah "$1" | awk '{ print $5}'
}

# cd to the path of the front Finder window
cdf() {
	target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
	if [ "$target" != "" ]; then
		cd "$target"
	else
		echo 'No Finder window found' >&2
	fi
}

battery()
{
    ioreg -c AppleSmartBattery -w0 | \
    grep -o '"[^"]*" = [^ ]*' | \
    sed -e 's/= //g' -e 's/"//g' | \
    sort | \
    while read key value; do
        case $key in
            "MaxCapacity")
                export maxcap=$value;;
            "CurrentCapacity")
                export curcap=$value;;
        esac
        if [[ -n "$maxcap" && -n $curcap ]]; then
            CAPACITY=$(( 100 * curcap / maxcap))
            echo $CAPACITY"%"
            break
        fi
    done
}