#!/bin/bash
for i in {1..4}
do
a=({a..z})
b=({0..9})
ra_uu=$[RANDOM%10]
echo -n ${a[ $ra_uu]}${b[ $ra_uu]}
done

for i in {1..2}
do
a=({a..z})
b=({0..9})
ra_uu=$[RANDOM%10]
echo {a[ $ra_uu]}${b[ $ra_uu]}
done
echo -n "-"

for i in {1..2}
do
a=({a..z})
b=({0..9})
ra_uu=$[RANDOM%10]
echo  ${a[ $ra_uu]}${b[ $ra_uu]}
done
echo -n "-"

for i in {1..2}
do
a=({a..z})
ra_uu=$[RANDOM%10]
echo ${a[ $ra_uu]}
done
echo -n "-"

for i in {1..6}
do
a=({a..z})
b=({0..9})
ra_uu=$[RANDOM%10]
echo -n ${a[ $ra_uu]}${b[ $ra_uu]}
done

