#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"

#
# I normally run this script first on every server whenever I login manually on that server or instance for any further work or for debugging purpose
# This script considers that a postfix mail server is actually running where this script is gonna run
# For web servers, things are different & thus so are respective commands
#
echo "========================================================================================"
echo "whatismyIP.sh:"
echo ""
sh /root/whatismyIP.sh
echo "========================================================================================"
echo "date:"
echo ""
date
echo "========================================================================================"
echo "w:"
echo ""
w
echo "========================================================================================"
echo "netstat -ntlp:"
echo ""
netstat -ntlp
echo "========================================================================================"
echo "free -mt:"
echo ""
free -mt
echo "========================================================================================"
echo "df -h:"
echo ""
df -h
echo "========================================================================================"
echo "tail /var/log/messages:"
echo ""
tail /var/log/messages
echo "========================================================================================"
echo "du -sch /var/spool/postfix/*:"
echo ""
du -sch /var/spool/postfix/*
echo "========================================================================================"
echo "ls -lsrth /var/log/maillog*:"
echo ""
ls -lsrth /var/log/maillog*
echo "========================================================================================"
echo "tail /var/log/maillog:"
echo ""
tail /var/log/maillog
echo "========================================================================================"

