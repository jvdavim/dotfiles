#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch mybar
m=$(xrandr --query | grep " connected" | cut -d" " -f1)
if [ $m != "" ]; then
  MONITOR=$m polybar --reload mybar &
fi
