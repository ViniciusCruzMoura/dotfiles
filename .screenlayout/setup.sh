#!/bin/sh
if xrandr | grep -q "Virtual1 connected"; then
    xrandr --output Virtual1 --mode 1360x768
    exit 0
fi
if xrandr | grep -q "HDMI-1 disconnected"; then
    xrandr --output LVDS-1 --primary --mode 1360x768 --output HDMI-1 --off
elif xrandr | grep -q "HDMI-1 connected"; then
    xrandr --output LVDS-1 --off --output HDMI-1 --auto --primary
else
    xrandr --output LVDS-1 --primary --auto --output HDMI-1 --auto
fi
