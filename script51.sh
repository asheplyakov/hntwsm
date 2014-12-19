#!/bin/sh
set -ex

path="/a/b/atop_1.26-2_amd64.deb"

# cut a largest prefix matching the pattern
filename="${path##*/}"

# cut a smallest suffix matching the pattern
dirname="${path%/*}"

# skip the .deb suffix
name_ver_arch="${filename%.*}"
# the suffix itself
suffix="${filename##*.}"

IFS='_'
set -- $name_ver_arch
unset IFS
pkg="$1"
ver="$2"
arch="$3"
