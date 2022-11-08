#!/bin/bash

#Check input arguments
echo -n "Enter your text: "
read input

letter_regex='[\,+a-Z+\.]+$'
int_regex='^[0-9]+$'
function is_text {
	if [[ $input =~ $letter_regex ]]; then
		return 0;
		if [[ $input =~ $int_regex ]]; then
			return 1
		fi
	fi
}
if ! is_text "$input"; then
	echo "Error: enter your text!"
	exit 1
fi

#Check shift arguments
echo -n "Enter shift: "
read shifts

int_regex='^[0-9]+$'
if ! [[ $shifts =~ $int_regex ]] ; then
        echo "Error: shift must be a number!"
        exit 1
fi

#Main programm
len=${#input}
phrase=''
for ((i=0; i<$len; ++i)); do
	#A loop for letters
	if [[ ${input:$i:1} =~ $letter_regex ]]; then
		register=$(($i % 2))
                ascii=$(($(echo -n ${input:$i:1} | od -An -tuC)-64))
		if (( $ascii >= "33" )); then
                        ascii=$(($ascii-32))
                fi

                ascii=$((shifts + ascii))

                if [[ $((ascii % 26)) == "0" ]]; then
                        phrase+=$(printf "\x$(printf %x $((90 + $register * 32)))")
                else
                        phrase+=$(printf "\x$(printf %x $(($ascii % 26 + 64 + $register * 32)))")

                fi
	#A loop for numbers
        elif [[ ${input:$i:1} =~ $int_regex ]]; then
                phrase+="$((9-${input:$i:1}))"
	#A lopp from space
        elif [[ ${input:$i:1} == ' ' ]]; then
                phrase+=$(printf "\x$(printf %x "32")")
	else
                phrase+=${input:$i:1}
        fi
done

#Phrase reversal
reversed=''
for ((i=$(($len - 1)); i>=0; i--)); do
        reversed+=${phrase:$i:1}
done
echo $reversed
exit 0

