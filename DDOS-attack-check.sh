#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"
#
# This script is to be run on the server whose DDOS atack check is to be made

# The simple & best way to detect whether the current server is under DDOS attack is to use our good old friend NETSTAT tool

# The idea is to check which IP is continuously sending SYN packets to the server
# So if there is a clear pattern of too many connection requests from some networks then chances are that the server is under DDOS attack
# 
#
netstat -antp | awk '/SYN_RECV/{ split($5,a,":"); print a[1] | "sort"}' | uniq -c 

# To Perform DDOS attack on any remote server or to test any of your server locally use HPING3 tool
# example
# hping3 -i u1 -S -p PORT SERVER-IP --rand-source


# To Prevent DDOS attack on the server, we can use IPTABLES or any other Firewalls like APF or any UTM's. Also IDS tools like Snort can be used to detect DDOS attack
# IPtables example:
# iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW -m recent --set --name HTTP
# iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW -m recent --update --seconds 60 --hitcount 80 --rttl --name HTTP -j DROP

# http://rockdio.org/ayudatech/how-to-stop-small-ddos-attacks-some-basic-security-advice/
# http://serverfault.com/questions/424179/simple-way-to-block-ddos-by-number-of-requests
