#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="HDMI-A-0"

# Run xidlehook
xidlehook \
  --not-when-fullscreen \
  --not-when-audio \
  --timer 300 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  --timer 30 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1 && betterlockscreen -l dimblur --off 30' \
    '' \
  --timer 30\
    'xset dpms force off' \
    ''
