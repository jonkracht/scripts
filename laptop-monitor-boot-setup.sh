#!/bin/bash
# Script to properly configure second monitor if present on boot

n_monitors=$(xrandr | grep -w "connected" | wc -l)


if [[ "$n_monitors" == 2 ]]
then
    exec xrandr --output HDMI-1 --left-of eDP-1 --auto 
fi

