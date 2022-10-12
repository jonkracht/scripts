#!/bin/bash



action=$(dmenu $dmenu_flags -p "Power options: "<< EOM
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
    exec $LockScreenCmd

fi
