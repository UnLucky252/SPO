#!/bin/bash

echo "Write your DNA: "
read DNA
word_regex='^[ATCG]+$'
copy=$DNA
len=${#copy}

for (( i=0; i<$len; ++i)); do
	word=${copy:$i:1}
	if [ "$word" == "A" ]; then
		rev=`echo "$word" | sed 's/A/T/g'`
        elif [ $word == "T" ]; then
		rev=`echo "$word" | sed 's/T/A/g'`
	elif [ $word == "C" ]; then
		rev=`echo "$word" | sed 's/C/G/g'`
	elif [ $word == "G" ]; then
		rev=`echo "$word" | sed 's/G/C/g'`
	fi
	additional+="$rev"
done
echo "$additional"

exit 0
