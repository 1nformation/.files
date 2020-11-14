#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar
killall -q zscroll

#set default network for polybar
export DEFAULT_NETWORK_INTERFACE=`ip route | grep '^default' | awk '{print $5}' | head -n1`

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar -c ~/.config/polybar/config bottommain &
polybar -c ~/.config/polybar/config topmain &

