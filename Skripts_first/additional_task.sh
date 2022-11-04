#!/bin/bash

echo "Enter IP-address: "
read IP

echo $IP | awk -F "." '{
	if ( NF != 4 ) print "It is not an IP-address"
	else if ( $1 >= 0 && $1 <= 255 && $2 >= 0 && $2 <= 255 && $3 >= 0 && $3 <= 255 && $4 >= 0 && $4 <= 255 )	
		print "It is a right IP-address"
	else print "It is not a valid IP-address"}'

