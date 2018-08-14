#!/usr/bin/zsh


days() {
	for ((i = 1; i < 32; i++)); do
		day=$(printf "%s/%02d\n" $month $i)
		echo $day
	done
}

ydays() {
	for ((m = 1; m < 13; m++)); do
		for ((i = 1; i < 32; i++)); do
		    printf "%s/%02d/%02d\n" $year $m $i
		done
	done
}

for ((year = 2008; year > 2007; year--)); do
	ydays | parallel -j16 "wget -r --domains contemporaryartdaily.com --force-directories -I \"/$year/*/*\" http://www.contemporaryartdaily.com/{}"
done


# wget \
#      --recursive \
#      --convert-links \
# 	 --domains contemporaryartdaily.com \
# 	 --force-directories \
# 	 -I /2018/05/* \
# 	 http://www.contemporaryartdaily.com/2018/05/01

 #--page-requisites \
