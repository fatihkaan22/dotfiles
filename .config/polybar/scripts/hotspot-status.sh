#!/bin/bash

ON_ICON=""
OFF_ICON=""

get_status() { 
	PID=$(create_ap --list-running | tail -n 1 | awk {'print $1'})
	if [[ PID -gt 0 ]]; then
		STATUS="on"
	else
		STATUS="off"
	fi
	# USER=$(ps aux | grep "/bin/bash /usr/bin/create_ap" | awk {'print $1'} | head -n 1);
	# if [[ $USER == near ]]; then
	# 	STATUS="off"
	# elif [[ $USER == root ]]; then
	# 	STATUS="on"
	# else
	# 	STATUS="off"
	# fi
}

get_status

# while true; do
get_status

if [[ $STATUS == "on" ]]; then
	echo $ON_ICON
else
	echo $OFF_ICON
fi
# sleep 10;
# done

