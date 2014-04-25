#! /bin/bash

TOUCHPAD=`synclient -l | grep TouchpadOff | cut -d= -f2`

if [ $TOUCHPAD -eq 0 ]; then
	synclient TouchpadOff=1	
	exit
fi

synclient TouchpadOff=0	
