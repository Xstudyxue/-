#!/bin/bash
# homework
echo "未交作业名单："
while read link
do
	ls -l /upload | grep $link &> /dev/null
	if [ $? -ne 0 ]
	then
		echo -n `cat /upload/name.txt | grep $link` "  "
		if [ $link = "tom" ]
		then
		continue
		fi
	fi
	
done < /upload/name.txt
echo
