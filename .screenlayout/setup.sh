#!/bin/sh
if xrandr | grep -q "HDMI-1 disconnected"; then
    xrandr --output Virtual1 --primary --mode 1360x768 --output HDMI-1 --off
elif xrandr | grep -q "HDMI-1 connected"; then
    xrandr --output Virtual1 --off --output HDMI-1 --auto --primary
else
    xrandr --output Virtual1 --primary --auto --output HDMI-1 --auto
fi
