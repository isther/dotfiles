#!/bin/bash

# get info from xrandr
xStatus=`xrandr`
connectedOutputs=$(echo "$xStatus" | grep " connected" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/")


LaptopMonitor="eDP-1-1"
ExternalMonitor="DP-0"

for display in $connectedOutputs
do
	if [ "$display" = "$ExternalMonitor" ]
	then
		cmd="xrandr --output $ExternalMonitor --auto"
		$cmd
		echo "$cmd"
		exit
	fi
done

cmd="xrandr --output $LaptopMonitor --auto"
`$cmd`
echo "$cmd"
