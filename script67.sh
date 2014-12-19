#!/bin/sh
set -x

validate_percentage () {
	local val="$1"
	[ -z "$val" ] && return 2
	case "$val" in
		*[!0-9]*)
		# not a number
		return 2
		;;
	esac
	if [ $val -le 100 ] && [ $val -ge 0 ]; then
		return 0
	else
		# number is outside of the range [0, 100]
		return 1
	fi
}

validate_percentage abc
validate_percentage 42
validate_percentage 120
