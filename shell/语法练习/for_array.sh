#!/bin/bash
#2024
#for array
#IFS=$'\n'
for xxx in `cat /etc/hosts`
do
	hosts[++o]=$xxx
done

for ttt in ${!hosts[@]}
do
	echo "$ttt :  ${hosts[$ttt]}"
done
