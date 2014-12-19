#!/bin/sh
set -e

logfile="foo.log"
# simulate the output of do_foo --log-file=${logfile}
cat > ${logfile} << EOF
baz: ok
barf: ok
foo: ERROR
EOF

# Silly
set -x
if [ `grep -e 'ERROR' "${logfile}" | wc -l` != 0 ]; then
	echo "foo: something went wrong"
	# try to recover
fi
