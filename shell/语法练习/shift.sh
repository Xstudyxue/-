#!/bin/bash

sum=0
until [ $# -eq 0 ]
do
sum=`expr $sum + $1`
shift
done
echo "sum is: $sum"
