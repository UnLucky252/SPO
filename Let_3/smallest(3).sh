#!/bin/bash

echo "Enter your number: "
read number

smallest="Smallest($number) -->"
numb=$number
min=10
position=0

while [ $numb -ne 0 ]; do
	del=$(( $numb % 10 ))
	if [[ $del -lt $min ]] && [[ $(( $numb / 10 )) -ne 0 ]]; then
		min=$del
		min_p=$(( $position + 1 ))
	fi
	let "position += 1"
	let "numb /= 10"
done

min_p=$(( $position - $min_p ))

pos=0
check=false
res=""

for ((i=0; i < ${#number}; i++)); do
	del=${number:$i:1}
	if [[ $min -lt $del ]] && [[ "$check" = false ]]; then
		if [[ $i -eq 0 ]] && [[ $min -ne 0 ]]; then
			res+=$min
			check=true
			pos=$i
		elif [[ $i -ne 0 ]]; then
			res+=$min
			check=true
			pos=$i
		fi
	fi
	if [[ $i -ne $min_p ]]; then
		res+=$del
	fi
done

if [[ "check" = false ]]; then
	pos=$min_p
fi
echo "$smallest [$res, $min_p, $pos]"

exit 0
        
