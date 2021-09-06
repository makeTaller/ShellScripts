#!/bin/bash
# While loop example
# Adding a line here to commit to github
# Author Kirk Tolliver
# Wed Aug 25 07:59:40 AM CDT 2021

COUNTER=0 
while [ $COUNTER -lt 10 ]; do 
				touch file$COUNTER 
				let COUNTER=COUNTER+1 
done


