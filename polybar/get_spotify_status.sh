#!/bin/zsh

STATUS=$($HOME/.config/polybar/get_playerctl_status.sh)

if [ "$STATUS" = "Stopped" ]; then
    echo ""
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook pause 3 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook prev 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook next 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook di1 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook di2 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook si1 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook si2 2 &>/dev/null

elif [ "$STATUS" = "Paused"  ]; then
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook pause 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook prev 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook next 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook di1 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook di2 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook si1 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook si2 1 &>/dev/null
    playerctl --player=playerctld metadata --format "  {{ title }} - {{ artist }} "
elif [ "$STATUS" = "No player is running"  ]; then
    echo ""
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook pause 3 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook prev 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook next 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook di1 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook di2 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook si1 2 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook si2 2 &>/dev/null
else
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook pause 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook prev 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook next 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook di1 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook di2 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook si1 1 &>/dev/null
    polybar-msg -p "$(pgrep -f "polybar -c /home/ki/.config/polybar/config bottommain")" hook si2 1 &>/dev/null
    playerctl --player=playerctld metadata --format "  {{ title }} - {{ artist }} "
fi
