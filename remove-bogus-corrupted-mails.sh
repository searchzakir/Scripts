#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"

#
# Checking bogus-corrupted-mails in the Postfix Mail Queues
#
# This script to be run on the postfix mail server/instace itself
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
