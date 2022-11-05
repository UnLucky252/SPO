#!/bin/bash

echo "Enter IP-address: "
read IP

p=`echo $IP | tr '.' '\n' | wc -l`
echo $p
IFS=.
set $IP
echo $IP
a=$1
b=$2
c=$3
d=$4
len1=${#a}
len2=${#b}
len3=${#c}
len4=${#d}

if [[ $p != 4 ]]; then 
	echo "It is not IP-address!"
else if [[ $1 -lt 255 && $2 -lt 255 && $3 -lt 255 && $4 -lt 255 ]]; then
	if [[ (( $len1 == 1 && $1 -gt 0 ) || ( $len1 == 2 && $1 -gt 10 ) || ( $len1 == 3 && $1 -gt 100 )) &&
		(( $len2 == 1 && $2 -ge 0 ) || ( $len2 == 2 && $2 -gt 10 ) || ( $len2 == 3 && $2 -gt 100 )) &&
		(( $len3 == 1 && $3 -ge 0 ) || ( $len3 == 2 && $3 -gt 10 ) || ( $len3 == 3 && $3 -gt 100 )) &&
		(( $len4 == 1 && $4 -ge 0 ) || ( $len4 == 2 && $4 -gt 10 ) || ( $len4 == 3 && $4 -gt 100 )) ]]; then
		echo "It is a right IP-address!"
	else echo "It is not a valid IP-address!"
	fi
fi
fi
