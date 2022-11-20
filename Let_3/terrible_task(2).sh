#!/bin/bash

echo "Enter your string: "
read -a string

letter_regex='^[a-zA-Z]+$'				#Check input arguments
if ! [[ $string =~ $letter_regex ]]; then
        echo "Error: Write your string"
        exit 1
fi

for ((i=1 ; i < "${#string[@]}"; ++i)) {		#Main program
	lenC=${#string[i]} 				#Length of the current element
	lenP=${#string[$i - 1]}				#Length of the previous element
	if [[ $(($i % 2)) == "1" ]]; then		#Replacing words according to the condition
		if [[ "$lenC" < "$lenP" ]]; then
			tmp="${string[$i]}"
			string[$i]="${string[$i - 1]}"
			string[$i - 1]=$tmp
		fi
	else
		if [[ "$lenC" > "$lenP" ]]; then
			tmp="${string[$i]}"
			string[$i]="${string[$i - 1]}"
			string[$i - 1]=$tmp
		fi
	fi

}

for ((i=0; i < "${#string[@]}"; ++i)) {			#Case change
tmp=${string[$i]}	
	if [[ $(($i % 2)) == "1" ]]; then
		str=$(echo "$tmp" | tr '[:lower:]' '[:upper:]')
		string[$i]=$str
	else
		str=$(echo "$tmp" | tr '[:upper:]' '[:lower:]')
                string[$i]=$str
	fi	
}

echo "${string[@]}"
exit 0
