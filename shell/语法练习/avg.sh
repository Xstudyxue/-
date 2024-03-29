#!/bin/bash
echo "($1+$2)/2" | bc
echo "该程序名为$0"
echo "该程序使用了$#个参数"
echo "该程序的参数如下：$*"
