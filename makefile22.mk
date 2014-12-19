#!/usr/bin/env make -f

all: versions.txt

versions.txt:
	sh -c '( echo b 1; echo a 2; exit 1 )' > $@.tmp.1
	sort -u < $@.tmp.1 > $@.tmp
	mv $@.tmp $@

clean:
	-rm -f versions.txt
