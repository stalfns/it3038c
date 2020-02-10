#!/bin/bash


echo Hostname: $HOSTNAME
echo Bash: $BASH_VERSION

IP=$( ip a | grep 'dynamic ens192' | awk '{print $2}' )

echo IP: $IP
date=$( date)
echo Date: $date
