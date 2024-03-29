#!/bin/bash
aaa () {
i=1
while [ $i -le 8 ]
do
a=({a..z} {0..9})
r_nu=$[RANDOM%36]
echo -n ${a[ $r_nu]}
unset $a[$r_nu]
let i++
done
echo
}
bbb () {
i=1
while [ $i -le 4  ]
do
a=({a..z} {0..9})
r_nu=$[RANDOM%36]
echo -n ${a[ $r_nu]}
unset $a[$r_nu]
let i++
done
echo
}
ccc () {
i=1
while [ $i -le 12 ]
do
a=({a..z} {0..9})
r_nu=$[RANDOM%36]
echo -n ${a[ $r_nu]}
unset $a[$r_nu]
let i++
done
echo
}
aaa 
echo "\n-"
bbb
echo "\n-"
bbb
echo \n"-"
bbb
echo "\n-"
ccc
