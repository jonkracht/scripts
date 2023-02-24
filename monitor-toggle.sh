#!/bin/bash

primary=eDP-1
secondary=HDMI-1

is_on="`xrandr | grep -A 1 $secondary | tail -1 | sed 's/[^\*]//g';`";

if [ "$is_on" ]
then
    xrandr --output $secondary --off
else
    xrandr --output $secondary --auto --left-of $primary 
fi
