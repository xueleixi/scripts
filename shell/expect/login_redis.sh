#!/usr/bin/env bash

printUsage(){
    echo "usage $1 (local|dev|test|prod)"
    exit -1
}

[ $# -lt 1 ] && printUsage

env=$1

case ${env} in

local)
    host=localhost
    port=6379
    password="''"
    ;;
dev|test)
    host=host_dev
    port=1111
    password=password_dev

   ;;
prod)
    host=host_prod
    port=6379
    password=pass_prod
    ;;
*)
    printUsage
    ;;

esac

echo "
spawn redis-cli -h $host -p $port -a $password
interact
"

expect -c "
spawn redis-cli -h $host -p $port -a $password
interact
"
