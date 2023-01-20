#!/bin/bash

primary=eDP-1
secondary=HDMI-1

n_monitors=$(xrandr | grep -w "connected" | wc -l)


if [[ "$n_monitors" = 2 ]]
then
    exec xrandr --output $secondary --off
elif [[ "$n_monitors" = 1 ]]
then
    exec xrandr --output $secondary --left-of $primary --auto
fi
