#!/bin/bash
# Backing up files on system
# Author: Kirk Tolliver

LOGFILE=$1
BACKUP_LOCATION="/usr/bin/"
BACKUP_TARGET="/home/$USER/.backup"

init () {
				echo "Creating backup directory" && mkdir $BACKUP_TARGET 2> /dev/null || echo "Directory already exists!!" 
				echo "$(date +"%x %r %Z")" >> $LOGFILE 
}

tail () {
				command tail -n $1
}

cleanup () {
				rm -rf $BACKUP_TARGET
				echo "RECIEVED CTRLC" >> /home/$USER/ShellScripts/$LOGFILE
				exit 
}

init

trap cleanup SIGINT

echo "Coping Files...."

cd $BACKUP_LOCATION

for i in $(ls); do
		cp -v "$i" $BACKUP_TARGET/"$i"-backup >> /home/$USER/ShellScripts/$LOGFILE 2>&1
	done

grep -i denied /home/$USER/$LOGFILE | tail  2

echo $?

