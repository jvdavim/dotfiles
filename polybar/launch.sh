#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
if [ ${#outputs[@]} < 2 ]; then
  for m in $outputs; do
    MONITOR=$m polybar --reload default &
  done
else
  for m in $outputs; do
    if [ $m == 'eDP1' ]; then
      MONITOR=$m polybar --reload extension &
    elif [ $m == 'HDMI1' ]; then
      MONITOR=$m polybar --reload default &
    fi
  done
fi