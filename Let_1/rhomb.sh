#!/bin/bash

echo "Write your number: "
read number

#Checking for the presence of an integer
int_regex='^[0-9]+$'
if ! [[ $number =~ $int_regex ]]; then
	echo "Error: Write integer number"
	exit 1
fi

max_size=$number
#First half of the rhomb
top=1
for ((i=0; i<"$number"; i++)) {
	for ((j=0; j<(($number-top)); j++)) { 
		echo -n " "
	}
	
	for ((k=0; k<top; k++)) {
		echo -n ". "
	}	
	echo " "	
	top=$(($top+1))
}

#Second half of the rhomb
lowland=$((max_size-1))
for ((i=0; i<=(($number-1)); i++)) {
	for ((j=0; j<((max_size-lowland)); j++)) {
		echo -n " "
	}
	
	for ((k=0; k<lowland; k++)) {
		echo -n ". "
	}
	echo " "
	lowland=$(($lowland-1))
}

exit 0

