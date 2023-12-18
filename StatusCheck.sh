#!/bin/bash

hostnames=("google.com" "discord.com");

for hostname in ${hostnames[@]}
do
	filename=`date '+%d-%m-%Y'`.txt;
	if ping -c 1 -t 60 $hostname > /dev/null
	then
		status="${hostname} is up";
		/usr/bin/notify-send "WEAP" "${hostname} is up"
	else
		status="${hostname} is down";
		/usr/bin/notify-send "WEAP" "${hostname} is down"
	fi
	
	if [ ! -d $hostname ]
	then
		 mkdir $hostname
	fi
	echo $status - `date` >> $hostname/$filename;
done

