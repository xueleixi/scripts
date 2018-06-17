#!/usr/bin/env bash

printUsage(){
    echo "usage $1 (local|dev|test|prod)"
    exit -1
}

[ $# -lt 1 ] && printUsage

env=$1

case ${env} in

"dev")
    host=10.26.120.189
    port=13306
    username=root
    password=T9feq1v6xFlOvNsQ

   ;;
"local")
    host=localhost
    port=3306
    username=root
    password=123456
;;
test)
    host=10.51.91.101
    port=3306
    username=deepleaper
    password=Deepleaper2017
;;
prod)
    host=rds1-internal.deepleaper.com
    port=3306
    username=dler
    password=zg2LUFvzVImE2KjN

;;
*)
    printUsage
;;

esac

echo "
spawn mysql -u $username -P $port -h $host -p
expect \"password\"
send \"${password}\n\"
interact
"

expect -c "
spawn mysql -u $username -P $port -h $host deepleaper -A -p
expect \"password\"
send \"${password}\n\"
interact
"
