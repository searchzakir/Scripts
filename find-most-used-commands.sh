#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"

# Bash disables history in noninteractive shells by default, but you can turn it ON like this
HISTFILE=~/.bash_history
set -o history

# Enable this 1-liner for unchanged default History format
# history | awk '{print $2}' | awk 'BEGIN {FS="|"} {print $1}' | sort | uniq -c | sort -rn

#
#
#
# P.S. that you need to append the given format change to .bash_profile for just that particular user & /etc/profile for all users
# If you have modified the command history format like this:
# export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
# then enable this 1-liner

history | awk '{print $5}' | awk 'BEGIN {FS="|"} {print $1}' | sort | uniq -c | sort -rn > /tmp/$0.out
head -20 /tmp/$0.out

# I personally prefer changing the command history format for convenience
#
