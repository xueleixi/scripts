[ $# -lt 2 ] &&{
	echo "usage $0 arg1 arg2"
	exit 2
}
expr $1 + 0 >/dev/null 2>&1
[ $? -ne 0 ] &&{
	echo "$1 is not int"
	exit 2
}
expr $2 + 0 >/dev/null 2>&1
[ $? -ne 0 ]&&{
	echo "$2 is not int"
	exit 2
}
echo "$1+$2=$(($1+$2))"
echo "$1+$2=$((1+2))"
