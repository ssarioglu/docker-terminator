#!/bin/bash

if [ -z "$1" ]
  then
    echo "use script with url like ./web-check.sh grafclouds.com"
    exit 0
fi

URL=$1
clear
echo "test" > old.html
for (( ; ; )); do
    mv new.html old.html 2> /dev/null
    curl $URL -L --compressed -s > new.html
    DIFF_OUTPUT="$(diff new.html old.html)"
    if [ "0" != "${#DIFF_OUTPUT}" ]; then
        echo $(date +"%T") "$1 changed!"
    else
        echo $(date +"%T") "No Change Detected Sleeping 10 Seconds"
    fi
    sleep 10
done
