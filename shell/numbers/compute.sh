#!/bin/bash

function check_input(){
	if [ $# -ne 2 ];then
		echo "usage $0 arg1 arg2"
		exit 2
	fi
# reduce code
	expr $1 + $2 >/dev/null 2>&1
	if [ $? -ne 0 ];then
		echo "please input two int"
		exit 2
	fi  
}

function compute(){
	echo "$1+$2=$(($1+$2))"
	echo "$1-$2=$(($1-$2))"
	echo "$1*$2=$(($1*$2))"
	echo "$1/$2=$(($1/$2))"
}
check_input $@
compute $@
