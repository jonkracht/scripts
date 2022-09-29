#!/bin/bash

action=$(dmenu -fn 'FiraSans-Bold' -i -m 0 -p "Power options: "<< EOM
lockscreen
reboot
shutdown
suspend
EOM
)

if [[ "$action" = "shutdown" ]]
then
    exec shutdown -h now
elif [[ "$action" = "suspend" ]]
then
    exec systemctl suspend
elif [[ "$action" = "reboot" ]]
then 
    exec shutdown -r now
elif [[ "$action" = "lockscreen" ]]
then 
    exec i3lock --image=/mnt/1-tb-hd/art/paul-klee/Theater-Mountain-Construction-cropped.png --tiling --show-failed-attempts
fi
