#!/bin/bash

echo -n "Enter first string: "
read s1
echo -n "Enter second string: "
read s2

word_regex='[a-z]+$'

s3=$"$s1$s2"
echo -n "Sorted string of maximum lenght: "
echo $s3 | grep -o . | sort -u | tr -d "\n" 
echo " "
