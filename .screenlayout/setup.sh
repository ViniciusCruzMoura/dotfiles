#!/bin/sh
if xrandr | grep -q "Virtual1 connected"; then
    xrandr --output Virtual1 --mode 1360x768
    exit 0
fi
if xrandr | grep -q "HDMI disconnected"; then
    xrandr --output LVDS --primary --mode 1360x768 --output HDMI --off
elif xrandr | grep -q "HDMI connected"; then
    xrandr --output LVDS --off --output HDMI-1 --auto --primary
else
    xrandr --output LVDS --primary --auto --output HDMI --auto
fi
