#!/usr/bin/env bash

# 假设 netstat.txt存放的是netstat命令执行结果

# 运算符 !=, >, <, >=, <=,==

# 文件行数统计
awk 'BEGIN{s=0;print s} {s+=1} END{print "文件总行数" s}' /tmp/log1
#awk 'BEGIN{s=12;print "abc"}'

# 根据条件过滤行
awk '$3==0 && $6=="LISTEN" ' netstat.txt
#
awk ' $3>0 {print $0}' netstat.txt

# 表头
awk '$3==0 && $6=="LISTEN" || NR==1 ' netstat.txt

# 格式化
awk '$3==0 && $6=="LISTEN" || NR==1 {printf "%-20s %-20s %s\n",$4,$5,$6}' netstat.txt

# 指定多个分隔符

awk -F '[;:]'

# 字符串匹配
 awk '$6 ~ /FIN/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" netstat.txt
 awk '$6 ~ /WAIT/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" netstat.txt

awk '/LISTEN/' netstat.txt

# 我们可以使用 “/FIN|TIME/” 来匹配 FIN 或者 TIME :
awk '$6 ~ /FIN|TIME/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" netstat.txt
# 取反
awk '$6 !~ /WAIT/ || NR==1 {print NR,$4,$5,$6}' OFS="\t" netstat.txt
awk '!/WAIT/' netstat.txt


# 文件拆分
# 根据第六列的内容来决定该行要输出的文件
 awk 'NR!=1{print > $6}' netstat.txt
# 指定输出哪系列
awk 'NR!=1{print $4,$5 > $6}' netstat.txt
# 加上if else判断
 awk 'NR!=1{if($6 ~ /TIME|ESTABLISHED/) print > "1.txt";
else if($6 ~ /LISTEN/) print > "2.txt";
else print > "3.txt" }' netstat.txt

# 统计
#下面的命令计算所有的C文件，CPP文件和H文件的文件大小总和
ls -l  *.cpp *.c *.h | awk '{sum+=$5} END {print sum}'
#统计各个connection状态
awk 'NR!=1{a[$6]++;} END {for (i in a) print i ", " a[i];}' netstat.txt
#再来看看统计每个用户的进程的占了多少内存（注：sum的RSS那一列）
 ps aux | awk 'NR!=1{a[$1]+=$6;} END { for(i in a) print i ", " a[i]"KB";}'


# begin {} end

#运行前


