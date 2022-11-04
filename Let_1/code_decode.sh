#!/bin/bash

echo "Write your number: "
read entered

#Checking the argument
int_regex='^[0-9]+$'
if ! [[ $entered =~ $int_regex ]]; then
	echo "Error: Write integer number"
	exit 1
fi
if [[ $entered -lt 1 ]]; then
        echo "Error: The entered number must be greatest then 1:"
        exit 1
fi

#Main program
copy=$entered
len=${#copy}
a=""
echo "Encoded numbers: "
for ((i=0; i<len; ++i)); do
	number=${copy:$i:1}

        if [ $number -ge 0 ] && [ $number -lt 2 ]; then
                k="1"
        elif [ $number -ge 2 ] && [ $number -lt 4 ]; then
                k="01"
        elif [ $number -ge 4 ] && [ $number -lt 8 ]; then
                k="001"
        else
                k="0001"
        fi

	str=""
        if [ $number -eq 0 ]; then
                str="0"
        else
                while [ $number -gt 0 ]; do
                        if [ $(( $number % 2 )) -eq 0 ]; then
                                str+="0"
                        else
                                str+="1"
                        fi

                        number=$(( $number / 2 ))
                done
        fi
	
	reverse=""
        for ((j=$(( ${#str} - 1 ));j>=0;j--)); do
                reverse+=${str:$j:1}
        done

        k+=$reverse
	echo -n "$k"
        a+=$(( 2#$reverse ))
done

echo
echo "Decoded numbers: "
echo $a

exit 0 
