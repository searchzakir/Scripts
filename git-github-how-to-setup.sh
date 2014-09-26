#!/bin/bash
# Author: Zakir Shaikh
# github.com/searchzakir
# linkedin.com/in/searchzakir

logger -s "running script ($0) by user (`whoami`) and pid = ($$)"

#
# The goal here is to create a simple script for users to get started with Git & GitHub
# This will set all the config options needed in git, generate a key, upload the public key to GitHub, and encourage the use of strong passphrases and ssh-agent.
#

