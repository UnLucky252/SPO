#!/bin/bash
#Last patient always sits on the penultimate chair

#Checking the argument
if [[ $1 -eq 0 ]]; then
	echo "Error: Enter the number of chairs"
	exit 1
fi
int_regex='^[0-9]+$'
if ! [[ $1 =~ $int_regex ]]; then
	echo "Error: Enter integer number"
	exit 1
fi
if [[ $1 -lt 2 ]]; then
	echo "Error: The entered number must be greatest then 1:"
	exit 1
fi

#Main program
echo "Last patient's chair number:"
echo $(($1-1))
 
exit 0
