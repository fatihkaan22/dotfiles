#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
rm /tmp/ipc-bottom
rm /tmp/polybar_mqueue*

polybar -c ~/.config/polybar/config.ini bottom &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-bottom
polybar -c ~/.config/polybar/config.ini top &

# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar -c ~/.config/polybar/config.ini --reload bottom &
# 		ln -s /tmp/polybar_mqueue.$! /tmp/ipc-bottom
#     MONITOR=$m polybar -c ~/.config/polybar/config.ini --reload top &
#   done
# else
#     MONITOR=$m polybar -c ~/.config/polybar/config.ini --reload bottom &
# 		ln -s /tmp/polybar_mqueue.$! /tmp/ipc-bottom
#     MONITOR=$m polybar -c ~/.config/polybar/config.ini --reload top &
# fi
#
# ln -s /tmp/polybar_mqueue.$! /tmp/ipc-top
