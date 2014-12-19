#!/bin/sh
set -e

match_cnt=0
IFS=';'
set -- 'AB;BC;DE;FG'
unset IFS
for entry; do
	case $entry in
		B*|*B*|*B)
		match_cnt=$((cnt+1))
		echo "match_cnt=${match_cnt}"
		;;
	esac
done

echo "top level: match_cnt=${match_cnt}"
