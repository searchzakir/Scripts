#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"

#
# CHECKING & DELETING bogus-corrupted-mails in the Postfix Mail Queues
#
# This script to be run on the postfix mail server/instace itself
# This script should be run every HOURLY or whatever time gap you want but it totally Depends on the mail server load  
# & the mail queue size.
# Script will take too much time for extremely large mail queue size

# When the server load is HIGH due to mail load [obvioulsy because of too much disk i/o],
# the "mailq" command does not respond & hangs/freezes.
# Best workaround is to get an idea of HOW MUCH SIZE is of mail queue rather than finding HOW MANY mails are there
# And it can be easily achieved using command "du -sch /var/spool/postfix*" [unless you have custom pool location]
#
# This script should be invoked by Cron .. say every few hours.
# Removing bogus & corrupted mails from theh mail queue is a very good idea from the performance perspective
#
#
# Initilazing Output File
mkdir -p /tmp/zPlayground/
OUT="/tmp/zPlayground/postsuper.out"
> $OUT

postsuper -p 2> $OUT
COUNT=`wc -l $OUT | awk '{print $1}'`

# Chips & Fries
if [ -s $OUT ]
	then
		for i in `awk -F '/' '{print $2}' $OUT`
		do
			# Delete the bogus / corrupted mails in the postfix mail queue
			rm -f /var/spool/postfix/incoming/$i
		done
	postsuper -p
	postsuper -s
	#echo "`date +%d.%m.%y` : remove-bogus-corrupted-mails.sh: $COUNT deleted" | logger
	logger -s "[`date | cut -c 5-10`] : $0 : $COUNT deleted"
	#echo "$COUNT bogus-corrupted-mails deleted from server `hostname`" | mail -s "$COUNT bogus-corrupted-mails deleted from server `hostname`" EMAIL_@_ADDRESS_HERE
	else
		echo > /dev/null
fi

# Truncating output file again
> $OUT

# As this script will be invoked by cron every few hours
# At the end of the day, total number of bogus & corrupted mails found & deleted are calculated by script " find-bogus-files-count.sh "
# So ensure that you have both the scripts on the server, as per your need & requirements
#
