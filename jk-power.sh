#!/bin/bash

# Standardize dmenu styling with global environment variable $dmenu_flags
action=$(dmenu $dmenu_flags -p "Power options: "<< EOM
lockscreen
reboot
screensaver
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
    exec $lockScreenCmd
elif [[ "$action" = "screensaver" ]]
then 
    exec xscreensaver-command --activate
fi
