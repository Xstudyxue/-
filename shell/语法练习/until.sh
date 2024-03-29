#!/bin/bash
#until ls /kewsjlkafjlk &> /dev/null
#do
#	let i++
#	sleep 1
#	echo $i
#done

#
#x=1
#until [ $x -ge 10 ]
#do
#	echo $x
#	x=`expr $x + 1`
#done
x=1
while [ ! $x -ge 10 ]
do
	echo $x
	x=`expr $x + 1`
done
