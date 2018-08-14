#!/usr/bin/zsh

[[ -d clean ]] && rm -rf clean
mkdir clean

outdir=$PWD/clean

find . -name index.html | sort | while read line; do
	outfile=$(sed "s/.*daily.com\///; s/\//_/g; s/_index.html$/.txt/" <<< "$line")
	printf "%-80s" $outfile
	./strip.py $line > $outdir/$outfile
	if (( $(wc -c < $outdir/$outfile) == 0 )); then
		rm $outdir/$outfile
		echo EMPTY
	else
		echo OK
	fi
done



