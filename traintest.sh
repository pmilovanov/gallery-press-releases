#!/usr/bin/zsh

# Split all files into train/test sets (98/2) by creating softlinks in `train`
# and `test` dirs, pointing to actual files in `all` dir.
# Decide which of the two to put the file into by hashing / mod 100

ALLDIR=all/all
TRAINDIR=all/train
TESTDIR=all/test

for f in $(ls all/all); do
	hash=$(echo $f | md5sum | head -c8)
	hash=$(( 16#$hash % 100 ))
	dest="../all/$f"
	srcdir="$TRAINDIR"
	(( $hash < 2 )) && srcdir="$TESTDIR"
#	echo $srcdir $hash -- $f
	ln -s $dest $srcdir/$f
done
