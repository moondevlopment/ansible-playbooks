#!/bin/bash

for ip in $(seq 20 30); do
    ip_s=10.0.0.$ip
    ping -c 1 10.0.0.$ip &>/dev/null
    if [ $? -eq 0 ];then
       echo $ip_s >>inventory
    fi

done
perl -i.bak -ne 'print if ! $x{$_}++' inventory
