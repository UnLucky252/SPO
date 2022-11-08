#!/bin/bash

echo -n "Enter words: "
read -a words

len=${#words[@]}
letter=0
if [[ $len == 0 ]]; then
	echo "Your amount: z"
	exit 0
else
	for (( i=0; i < len; i++ )); do
		ascii=$(($(echo -n ${words[$i]} | od -An -tuC)-96))
		letter=$(( $letter + $ascii ))
	done

	if [[ $(( $letter % 26)) = 0 ]]; then
		letter=z
	else
		letter=$(( $(( $letter % 26)) + 96 ))
	fi
printf "Your amount: \x$(printf %x $letter)\n"
fi
exit 0
