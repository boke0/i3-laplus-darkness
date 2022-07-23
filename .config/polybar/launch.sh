#!/bin/bash

## restart i3
if [[ $1 = "restart" ]]; then
	i3-msg restart
	sleep 1
fi

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITORS=(`xrandr -q | grep connected | awk '{print $1}'`)
MONITOR1=${MONITORS[0]}
MONITOR2=${MONITORS[1]}

echo $MONITOR1
echo $MONITOR2
# Launch bar
MONITOR=${MONITOR1} polybar left &
MONITOR=${MONITOR2} polybar right &
