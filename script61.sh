#!/bin/sh
set -e

logfile="foo.log"
# simulate the output of do_foo --log-file=${logfile}
cat > ${logfile} << EOF
baz: ok
barf: ok
foo: ERROR
EOF

set -x
if grep -q -e 'ERROR' "${logfile}"; then
	echo "foo: something went wrong"
	# try to recover
fi
