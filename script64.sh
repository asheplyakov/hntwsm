#!/bin/sh
set -ex

buggy () {
	local number="$1"
	if [ $number -ne 42 ]; then
		return 1
	else
		echo 'do something'
		return 0
	fi
}

buggy abc
