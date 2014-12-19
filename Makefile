#!/usr/bin/env make -f

null:=
text:=hntwsm.txt

include scripts-list.mk

all: $(scripts)

$(scripts): $(text) Makefile extract-scripts.sh
	./extract-scripts.sh $< || rm -f $(scripts)

scripts-list.mk: $(text)
	echo 'scripts:=\\' > $@.tmp
	sed -rne 's/^\[script[ ]+([^]]+)[]].*$$/\1\ \\/p' $< >> $@.tmp
	echo '$$(null)' >> $@.tmp
	mv $@.tmp $@

clean:
	rm -f $(scripts)
	rm -f scripts-list.mk

