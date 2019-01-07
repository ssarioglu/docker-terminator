#!/bin/sh
#Written By Serdar Sarioglu - December 2016

#Range is the IP segment to scan
range="192.168.1.0/24"

#Ports to Scan (Well-Known Ports)
for port in 21 22 23 25 53 80 110 143 389 443 445 465 990 1433 3128 3306 3389 5432 5500 8080

do
zmap -p $port $range -q -v 1 -o port_$port.txt
sleep 1 
done
