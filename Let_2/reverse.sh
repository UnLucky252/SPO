#!/bin/bash

echo "Write your phrase: "
read -a words
len=${#words[@]}

echo "Reversed phrase: "
for ((i=$(($len - 1)); i>=0; i--)); do
	echo -n "${words[$i]} "
done
exit 0
