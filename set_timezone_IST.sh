#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

/bin/logger -s " running script ($0) by user (`whoami`) and pid = ($$)"


if [ -e /usr/share/zoneinfo/Asia/Calcutta ]
then
        mv /etc/localtime /etc/localtime.orig
	if ! ln -s /usr/share/zoneinfo/Asia/Calcutta /etc/localtime
		then
		mv /etc/localtime.orig /etc/localtime
	fi
	rpm -qa | grep ntpdate
		if [ $? = 0 ]
			then
				echo
			else
				yum install ntpdate
		fi
# Check this out --> http://www.pool.ntp.org/en/
        ntpdate 0.asia.pool.ntp.org
	if [ $? = 0 ]
		then
			echo "Date & Time Synchronised Successfully"
			exit 0
			else
				for i in 1 2 3
				do
				ntpdate $i.asia.pool.ntp.org
				done
	fi

else
       echo "Cannot set timezone, as IST timezone does not exist"
       exit 1
fi

