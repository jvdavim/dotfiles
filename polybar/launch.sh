#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
m=$(xrandr --query | grep " connected" | grep " primary" | cut -d" " -f1)
if [ $m != "" ]; then
  MONITOR=$m polybar --reload default &
fi
m=$(xrandr --query | grep " connected" | grep -v " primary" | cut -d" " -f1)
if [ $m != "" ]; then
  MONITOR=$m polybar --reload extension &
fi
