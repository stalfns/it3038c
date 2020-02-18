#!/bin/bash

time=$(date +"%T")
echo "The current time is : $time"

echo "Below you can find the weather:"

curl wttr.in
