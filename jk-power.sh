#!/bin/bash

# Check if dmenu_flags is set; if not, set it
if [[ -v dmenu_flags ]]; then
echo "dmenu_flags exists."
else
echo "dmenu_flags does not exist. setting."
dmenu_flags="-i -fn RobotoMonoNerdFont-Regular"
fi

action=$(dmenu $dmenu_flags -p "Power options: "<< EOM
suspend
reboot
shutdown
lockscreen
screensaver
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
