
echo $#
echo $1
echo $2
echo $@
echo $*

[ $# -lt 1 ] && {
	echo "at lease one parameter"
	exit 1
}

echo "\$#=$#"
echo "you have input\n$@"

