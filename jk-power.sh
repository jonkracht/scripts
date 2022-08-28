#!/bin/bash

primary=eDP-1
secondary=HDMI-1

action=$(dmenu -fn 'FiraSans-Bold' -i -m 0 -p "Power options: "<< EOM
reboot
screenlocker
shutdown
suspend
EOM
)

if [[ "$action" = "shutdown now" ]]
then
    exec shutdown -h now
elif [[ "$action" = "suspend" ]]
then
    exec systemctl suspend
elif [[ "$action" = "reboot" ]]
then 
    exec shutdown -r now
elif [[ "$action" = "screenlocker" ]]
then 
    exec i3lock --image=/mnt/1-tb-hd/art/paul-klee/Theater-Mountain-Construction-cropped.png --tiling --show-failed-attempts
fi
