#!/bin/bash
red=({01..33})
blue=({01..16})

i=1
while [ $i -le 6 ]
do
	index_i=$[RANDOM%33]
	if [ -z ${red[$index_i]} ]
	then
		continue
	else
		echo -n "${red[$index_i]} "
		unset red[$index_i]
	fi
let i++
done
j=$[RANDOM%16]
echo "+ ${blue[$j]}"
