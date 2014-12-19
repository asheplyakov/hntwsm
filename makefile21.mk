#!/usr/bin/env make -f

all: versions.txt

# This rule is WRONG
versions.txt:
	sh -c '( echo b 1; echo a 2; exit 1 )' | sort -u > $@

clean:
	-rm -f versions.txt
