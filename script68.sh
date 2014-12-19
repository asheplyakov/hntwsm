#!/bin/sh
set -x

module=$(find /lib/modules/`uname -r` -name foo.ko)


# WRONG by construction
if [ -n $module ]; then
	echo do something wrong
fi

# Correct
if [ -n "$module" ]; then
	echo do someting right
fi
