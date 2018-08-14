#!/bin/bash

for year in `seq 2005 2018`; do
	for month in `seq 1 12`; do
		URL=`printf "https://www.e-flux.com/announcements/%04d/%02d" $year $month`

		OUT=`printf "listbymonth/%d-%02d" $year $month`
		echo "[$URL]"
		curl "$URL" | egrep -o "/announcements/[0-9]+/[^/\"]*/" | uniq > "$OUT"
	done
done
