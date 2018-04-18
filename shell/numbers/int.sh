
function int1(){
	[ -z "`echo $1|sed 's/[0-9]//g'`" ] && echo $1 int || echo $1 'not int'
}
function int2(){
	var1=$1
	[ -z "echo ${var1//[0-9]/}" ] && echo $1 int || echo $1 not int
}

ds=(4 7 f 9)

for d in ${ds[@]}
do
	int1 $d
	int2 $d
done
