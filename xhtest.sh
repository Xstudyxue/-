#!/bin/bash
#1-100的和
#sum=0
#for i in {1..100}; do
#	  sum=$((sum + i))
#  done
#  echo "The sum of numbers from 1 to 100 is: $sum"

for ((i=1;i <= 9;i++))
do
	for ((j=1;j <= i;j++))
	do
	result=$((i*j))
	echo -n "$i x $j = $result" "  "
	done
	echo ""
done
