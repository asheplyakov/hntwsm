#!/bin/sh
set -e

do_print=''
current_output=''
save_IFS=''

exec <"$1"
IFS=''
while read line; do
	case "$line" in
		[[]script*)
		do_print='yes'
		line="${line##[}"
		line="${line%%]}"
		save_IFS="$IFS"
		IFS=' '
		set -- $line
		IFS="$save_IFS"
		shift
		current_output="$1"
		exec 3>$current_output
		continue
		;;
		[[]endscript[]])
		exec 3>&1
		chmod 755 $current_output
		do_print=''
		;;
	esac
	[ -n "$do_print" ] && echo "$line" >&3
done
unset IFS

