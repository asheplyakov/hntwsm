#!/bin/sh
set -ex
#
# '_'.join(['a', 'b', 'c']) in shell

join () {
	local str=''
	local separator="$1"
	shift
	for val in $@; do
		str="${str}${str:+${separator}}${val}"
	done
	echo "$str"
}

val="`join _ a b c d`"
