#!/bin/sh
set +e
set -x

apt-get install --print-uris --yes -qq foo
echo $?
# This is WRONG
apt-get install --print-uris --yes -qq foo | grep ^\' | cut -d\'
echo $?

