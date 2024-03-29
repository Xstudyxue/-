#!/bin/bash
ran () {
num=({0..9})
i=$[RANDOM%10]
echo "${num[$i]}"
}




