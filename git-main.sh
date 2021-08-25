#!/bin/bash
# Script to automate git commits
# Author: Kirk Tolliver
# Wed Aug 25 07:59:40 AM CDT 2021

echo "Hello $USER, what are you committing?" && git add . && echo $?

echo "What is you commit message?" && git commit -m "$*"  >> git-main.log && echo $?

echo "Lets push this shit!" && git push origin main

sleep  10s

grep main git-main.log

