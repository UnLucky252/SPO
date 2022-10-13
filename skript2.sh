#!/bin/bash

var1=$((15 * 2))
echo $var1
var2=$(($var1 + 30))
echo $var2
var3=$(($var2 - $var1))
echo $var3
var4=$(($var3 / $var1))
echo $var4

exit 0
