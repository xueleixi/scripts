#!/usr/bin/env bash


#11	1000.0	male
#12	2000.0	female
#13	3000.0	male
#14	4000.0	male
#xlx:tmp xueleixi$ cat /tmp/log2
#13	bj
#12	nj
#14	sh

#awk 'BEGIN{FS=OFS=","}NR==FNR{w[$4]=$5","$6}NR>FNR{for(a in w) if (a==$4){print $1,$2,$3,$4,w[a]}}' device_jingweidu.txt device.txt

# 把文件2的内容补充到文件1中
file1=/tmp/log1
file2=/tmp/log2

awk 'BEGIN{FS=OFS="\t"}NR==FNR { d[$1]=$2 } NR>FNR{if($1 in d){ print $0,d[$1]}}'  $file2 $file1
# 修改输出分隔符
awk ' BEGIN{FS="\t";OFS=","} NR==FNR { d[$1]=$2 } NR>FNR{ if($1 in d) print $0,d[$1]; else print $0;}'  $file2 $file1

