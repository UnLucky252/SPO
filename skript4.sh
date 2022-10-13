#!/bin/bash

for ((i=$1/2; i >= 0; i--))
do
	for ((k=0; k < $i; k++)) 
	do 
		echo -n " "
	done
	
	let "a=$1 - 2*$i"
	if (($a < 1))
	then
		a=$a+1
	fi
	for ((j=0; j < $a; j++))
	do
		echo -n "."
	done	
	echo " "	
done

for ((i=1; i < $1/2+1; i++))
do
	for ((k=0; k < $i; k++))
	do
		echo -n " "
	done
	let "a=$1-2*$i"
	if (($a < 1))
	then
		a=$a+1
	fi
	for ((j=0; j < $a; j++))
	do
		echo -n "."
	done
	echo " "
done

exit 0

