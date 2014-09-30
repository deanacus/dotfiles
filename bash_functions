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

# Quick and dirty way to return both local and public IP addresses
ip(){
  localip=$(ipconfig getifaddr en0);
  publicip=$(curl http://icanhazip.com 2>/dev/null);
  echo "Local IP: " $localip"
Public IP: " $publicip
}

# Quick battery check, just because I can
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

# Extra many types of compressed packages
# Credit: http://nparikh.org/notes/zshrc.txt
extract () {
  if [ -f $1 ]; then
	case $1 in
	  *.tar.bz2) tar -jxvf $1 ;;
	  *.tar.gz) tar -zxvf $1 ;;
	  *.bz2) bunzip2 $1 ;;
	  *.dmg) hdiutil mount $1 ;;
	  *.gz) gunzip $1 ;;
	  *.tar) tar -xvf $1 ;;
	  *.tbz2) tar -jxvf $1 ;;
	  *.tgz) tar -zxvf $1 ;;
	  *.zip) unzip $1 ;;
	  *.ZIP) unzip $1 ;;
	  *.pax) cat $1 | pax -r ;;
	  *.pax.Z) uncompress $1 —stdout | pax -r ;;
	  *.Z) uncompress $1 ;;
	  *) echo "'$1' cannot be extracted/mounted via extract()";;
   esac
 else
   echo "'$1' is not a valid file to extract"
 fi
}