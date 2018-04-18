#!/usr/bin/env bash

#1. 过滤含有index的行

log=../data
keyword=index

function newLine(){
    echo "-- line --"
}

cat $log | grep $keyword
newLine
cat $log |awk '/'$keyword'/'
newLine
cat $log | sed -n '/'$keyword'/p'


#2.

