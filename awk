#1.
awk 'BEGIN { FS=":";print "统计销售金额";total=0} {print $1;total=total+$1;} END {printf "销售金额总计：%.2f",total}' data

data文件内容
3.2:no001
4.1:no002
5.9:no003


#2.awk统计
cat sum |awk 'BEGIN{s=0;rows=0;} {s+=$1*$2;print $1,$2;rows+=1;} END{print s,rows,s/(rows-1);}'
``
sum内容如下：
num             price
4       12
2       10
4       8
