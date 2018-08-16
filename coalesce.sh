#!/bin/bash

# Copy files from eflux/clean to all/all, changing filenames to avoid
# duplicates. This is needed to put all files in one place in preparation for
# splitting into train/test sets.

IN="eflux/clean"
OUT="all/all"

for f in $(find "$IN" -type f); do
	outf=$(echo $f | sed "s~$IN/~ef/~g" | sed 's~/~_~g')
	cp $f $OUT/$outf
done
