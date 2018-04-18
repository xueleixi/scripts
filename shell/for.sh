
for1(){
	names="zhangsan lisi wangwu"
	for i in $names
	do
		echo $i
	done
	for i in "$names"
	do
		echo $i
	done
}

for1
for2(){
for i in "$@"
do
	echo $i
done
for i in "$*"
do
	echo $i
done
}

for2 a b c
