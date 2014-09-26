#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

# logger -s "running script ($0) by user (`whoami`) and pid = ($$)"


find / -user root -perm -4000 -exec ls -ldb {} \; > /tmp/$0.out

# find / -xdev \( -perm -4000 \) -type f -print0 | xargs -0 ls -l > /tmp/$0.out


less /tmp/$0.out

