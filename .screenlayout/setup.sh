#!/bin/sh
if xrandr | grep -q "HDMI-1 disconnected"; then
    #xrandr --output eDP-1 --primary --mode 1280x720 --output HDMI-1 --off
    xrandr --output eDP-1 --primary --auto --scale-from 1360x768 --output HDMI-1 --off
elif xrandr | grep -q "HDMI-1 connected"; then
    #xrandr --output eDP-1 --off --output HDMI-1 --auto --primary
    xrandr --output eDP-1 --off --output HDMI-1 --auto --primary --scale-from 1360x768
else
    xrandr --output eDP-1 --primary --auto --output HDMI-1 --auto
fi
