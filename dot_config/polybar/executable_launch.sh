#!/bin/bash

function ping()
{
	local timeout=1
	local target=www.baidu.com
	local ret_code=`curl -I -s --connect-timeout ${timeout} ${target} -w %{http_code} | tail -n1`

	if [ "x$ret_code" = "x200" ]; then
		return 1
	else
		return 0
	fi
	return 0
}

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -r bspwm &
polybar -r player &
polybar -r other &
polybar -r tray &

ping
if [ $? -eq 1 ];then
	polybar -r network &
fi

echo "Polybar launched..."
