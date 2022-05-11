#!/usr/bin/env bash

#ps -ef | grep 'rshm-1.0.0.jar' --color

printf "===================================\n"
printf "%-20s | %-20s \n" "PROCESS CHECK"
printf "===================================\n"

PID=`ps -ef | grep java | grep rshm-1.0.0.jar | awk '{print $2}'`

if [[ e${PID} != "e" ]];
then
    printf "%-20s | %-20s \n" "( PID = ${PID} )"
    printf "===================================\n"
    ps -ef | grep java | grep rshm-1.0.0.jar --color=auto
else
    printf "%-20s | \e[37;41m %-20s \033[0m \n" "Not Running !!!"
    printf "===================================\n"
fi
