#!/bin/sh
set -x

foo () {
	local number="$1"
	[ -z "$number" ] && return 1
	case "$number" in
		*[!0-9]*)
		# not a number
		return 1
		;;
	esac
	if [ $number -ne 42 ]; then
		return 1
	else
		echo 'do something'
	fi
}

foo abc
foo 12
foo 42
