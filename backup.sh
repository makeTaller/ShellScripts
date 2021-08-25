#!/bin/bash
# Backing up files on system
# Author: Kirk Tolliver

LOGFILE=$1
BACKUP_LOCATION="/usr/bin/"
BACKUP_TARGET="/home/$USER/.backup"

init (){
				echo "Creating backup directory" && mkdir ~/.backup 2> /dev/null || echo "Directory already exists!!"
}

tail () {
				command tail -n $1
}

init

##echo "Copying Files...." && cp -v $BACKUP_LOCATION $BACKUP_TARGET >> $LOGFILE 2>&1

echo "Coping Files...."

cd $BACKUP_LOCATION

for i in $(ls); do
		cp -v "$i" $BACKUP_TARGET/"$i"-backup >> /home/$USER/ShellScripts/$LOGFILE 2>&1
	done

grep -i denied /home/$USER/$LOGFILE | tail  2

echo $?

