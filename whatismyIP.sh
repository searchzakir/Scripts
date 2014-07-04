#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"


# Initialising the Script Output File
OUT="/tmp/machine-hardware-configuration-details-`hostname -f`.out"
