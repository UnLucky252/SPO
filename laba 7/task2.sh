#!/bin/bash

echo -n "input: "
read -a words

len=${#words[@]}
sum=0
if [[ $len = 0 ]]; then
	echo z
	exit 0
else
	for (( i=0; i < len; i++ )); do
		ascii_num=$(($(echo -n ${words[$i]} | od -An -tuC)-96))
		sum=$(( $sum + $ascii_num ))
	done

	if [[ $(( $sum % 26)) = 0 ]]; then
		sum=z
	else
		sum=$(( $(( $sum % 26)) + 96 ))
	fi
printf "output: \x$(printf %x $sum)\n"
fi
exit 0
