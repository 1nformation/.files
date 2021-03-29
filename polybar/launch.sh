#!/usr/bin/env bash
DIR="$HOME/.config/polybar/"

# Terminate already running bar instances
killall -q polybar
killall -q zscroll
export DEFAULT_NETWORK_INTERFACE=`ip route | grep '^default' | awk '{print $5}' | head -n1`

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar

polybar -q main -c ~/.config/polybar/config.ini &
polybar -q main-b -c ~/.config/polybar/config.ini &
