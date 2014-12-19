#!/bin/sh
set -ex

foo () {
	local number="$1"
	if [ "$number" != "42" ]; then
		return 1
	else
		echo 'do something'
	fi
}

foo abc
