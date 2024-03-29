#!/bin/bash
aaa () {
i=1
while [ $i -le 10 ]
do
a=({a..z})
r_nu=$[RANDOM%10]
echo -n ${a[ $r_nu]}
unset $a[$r_nu]
let i++
done
echo
}
mkdir /haowan
i=1
for i in {1..10}
do
	aaa | xargs -I {} touch /haowan/{}.txt
done
