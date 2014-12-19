#!/bin/sh
set -ex

# '_'.join(['a', 'b', 'c', 'd']) in shell
# more careful variant of script53.sh
# null versus empty

join () {
	local separator="$1"
	local save_IFS="$IFS"
	local reset_ifs=''
	[ -z "${IFS+x}" ] && reset_ifs='yes'
	shift
	set -- $@
	IFS="$separator"
	echo "$*"
	if [ -n "$reset_ifs" ]; then
		unset IFS
	else
		IFS="$save_IFS"
	fi
}

unset IFS
val="`join _ a b c d`"
