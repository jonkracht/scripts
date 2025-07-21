#!/bin/bash

# Check if dmenu_flags is set; if not, set it
if [[ -v dmenu_flags ]]; then
echo "dmenu_flags exists and is set to:  $dmenu_flags"
else
dmenu_flags="-i -fn RobotoMonoNerdFont-Regular"
echo "dmenu_flags does not exist. Setting to:  $dmenu_flags"
fi


# Handle both x and wayland where dmenu executable may be differently name
if [[ "$XDG_SESSION_TYPE" = "x11" ]]; then
    echo "X"
    dmenu_bin="dmenu"
elif [[ "$XDG_SESSION_TYPE" = "wayland" ]]; then
    echo "Wayland"
    dmenu_bin="dmenu_wl"
else
    echo "Session type not handled:  $XDG_SESSION_TYPE"
fi


action=$($dmenu_bin $dmenu_flags -p "Power options: "<< EOM
suspend
reboot
shutdown
lockscreen
screensaver
EOM
)

# Options
if [[ "$action" = "shutdown" ]]; then
    exec shutdown -h now

elif [[ "$action" = "suspend" ]]; then
    exec systemctl suspend

elif [[ "$action" = "reboot" ]]; then 
    exec shutdown -r now

elif [[ "$action" = "lockscreen" ]]; then 
    exec $lockScreenCmd

elif [[ "$action" = "screensaver" ]]; then 
    exec xscreensaver-command --activate

fi
