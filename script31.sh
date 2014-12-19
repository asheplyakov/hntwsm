#!/bin/sh
set -e

l=0

buggy () {
	l=$(($l+1))
	echo "$l"
}

result="`buggy`"
echo "result=$result"
echo "l=$l" # oops
