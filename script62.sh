#!/bin/sh
set -e

logfile="foo.log"
# simulate the output of do_foo --log-file=${logfile}
cat > ${logfile} << EOF
baz: ok
barf: ok
foo: ok
EOF

# WRONG

set -x
grep -q -e 'ERROR' "${logfile}"

if [ $? -eq 0 ]; then
	echo "foo: something went wrong"
fi
