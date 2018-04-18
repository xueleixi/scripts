
function usage(){
	echo "usage $0 [0-9]"
	exit 2
}

function check_var(){
	case $1 in
		1)
			echo "first"
			;;
		2)
			echo "second"
			;;
		[3-9])
			echo "three-nine"
			;;
		0)
			echo "zero"
			;;
		*)
			echo "$0 is not a number"
			;;
	esac
}
main(){
[ $# -ne 1 ] && usage||check_var "$@"
}
main "$@"
