# Determine the size of a file
#
# TODO:
# 1. Figure out how to include decimal portions once size reaches GB
#
fs() {
	if [ "$(stat -f "%z" "$1")" -gt 999999999 ]; then
		input_size=$(($(size "$1") / (1000 * 1000 * 1000)))
		input_unit="GB"
	else
		if [ "$(stat -f "%z" "$1")" -gt 999999 ]; then
			input_size=$(($(size "$1") / 10**6))
			input_unit="MB"
		else
			if [ "$(stat -f "%z" "$1")" -gt 999 ]; then
				input_size=$(($(size "$1") / 10**3))
				input_unit="KB"
			else
				if [ "$(stat -f "%z" "$1")" -gt 9 ]; then
					input_size=$(size "$1")
					input_unit="B"
				fi
			fi
		fi
	fi
	echo $input_size$input_unit
}