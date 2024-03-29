#!/bin/bash
declare -A sex
while read line
do
type=`echo $line | awk '{print $2}'`
let sex[$type]++
done < sex.txt

for i in ${!sex[@]}
do
	echo "$i  :  ${sex[$i]}"
done
