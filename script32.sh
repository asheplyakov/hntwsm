#!/bin/sh
set -e

# BUG
match_cnt=0
echo 'AB;BC;DE;FG' | tr ';' '\n' | while read entry; do
	case $entry in
		B*|*B*|*B)
		match_cnt=$((cnt+1))
		echo "match_cnt=${match_cnt}"
		;;
	esac
done

echo "top level: match_cnt=${match_cnt}"
