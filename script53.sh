#!/bin/sh
set -ex
#
# '_'.join(['a', 'b', 'c']) in shell, yet another variant

join () {
	# Warning: this variant is not quite correct
	local separator="$1"
	shift
	IFS="$separator"
	echo "$*"
	unset IFS
}

val="`join _ a b c d`"
