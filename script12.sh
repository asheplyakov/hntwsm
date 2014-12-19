#!/bin/sh
set -ex

pkg="liblapack-dev"
if ! apt-get install --print-uris --yes -qq $pkg > "downloads_${pkg}.tmp"; then
	echo "downloader: failed to process the package: \"$pkg\"" >&2
	exit 1
fi
sed -r -n -e "s/^[']([^']+).*$/\1/p" -i "downloads_${pkg}.tmp"
mv "downloads_${pkg}.tmp" "downloads_${pkg}.list"

