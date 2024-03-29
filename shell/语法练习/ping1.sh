#!/bin/bash
ping -c1 192.168.115.128
if [ $? -eq 0 ]
then
	echo "192.168.115.128 is up!"
else
	echo "192.168.115.128 is down!"
fi
