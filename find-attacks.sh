#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"

# Be sure to Replace  EMAIL_@_ADDRESS_HERE with your Email Address 
#
# Script to find out the IRC Bot Attack on the server
# Find any established connections to the IRC ports on the remote server
#
# Run this script every few minutes, as per the need

OUTFile=/tmp/netstat-pant.out
> $OUTFile

echo "`date`" >> $OUTFile
echo "`hostname`" >> $OUTFile
echo >> $OUTFile
echo "===================================================" >> $OUTFile
#netstat -pant | awk '{print $4,$5}' | egrep -w '(6660|6667|7000)' >> $OUTFile
netstat -pant | awk '{print $4,$5}' | egrep -w '(6660|6667|7000)'
if [ $? = 0 ]
then
	echo >> $OUTFile
	netstat -pant | egrep -w '(6660|6667|7000)' >> $OUTFile

	for i in `netstat -pant | egrep -w '(6660|6667|7000)' | awk '{print $7}' | awk -F '/' '{print $1}'`
	do
	kill -9 $i
	done

	echo "===================================================" >> $OUTFile
	echo >> $OUTFile
	echo >> $OUTFile
	echo "Killed pid's of relavant connections given above" >> $OUTFile
	echo >> $OUTFile
	netstat -pant | awk '{print $4,$5}' | egrep -w '(6660|6667|7000)' >> $OUTFile
	cat $OUTFile | mail -s "Find Attacks: netstat -pant output on server $(hostname)" EMAIL_@_ADDRESS_HERE
else
echo > /dev/null
fi
