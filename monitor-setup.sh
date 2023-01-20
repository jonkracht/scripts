#!/bin/bash

primary=eDP-1
secondary=HDMI-1

#action=$(dmenu -i -fn 'JetBrainsMono Nerd Font' -p "Action: "<< EOM
action=$(dmenu $dmenu_flags -p "Action: "<< EOM
HDMI-off
HDMI-on
EOM
)

if [[ "$action" = "HDMI-off" ]]
then
    exec xrandr --output $secondary --off
elif [[ "$action" = "HDMI-on" ]]
then
    exec xrandr --output $secondary --left-of $primary --auto
fi
