#!/bin/bash

# Shell script to open config file

#editor="gedit"
#editor="kitty"
editor="kitty nvim"

config=$(dmenu -m 0 -i -p "File to edit: "<< EOM
awesome-main
awesome-theme
bpytop
compton
flameshot
gtk-theme
kitty
neovim
pulse
EOM
)

if [[ "$config" = "compton"  ]]
then
    exec  $editor ~/.config/compton/compton.conf
elif [[ "$config" = "awesome-main"  ]]
then
    exec $editor ~/.config/awesome/rc.lua
elif [[ "$config" = "awesome-theme"  ]]
then
    exec $editor ~/.config/awesome/themes/copland/theme.lua
elif [[ "$config" = "kitty"  ]]
then
    exec $editor ~/.config/kitty/kitty.conf
elif [[ "$config" = "gtk-theme" ]]
then
    # How to deal with file being located in root and needing super user privileges?
    exec $editor  /etc/gtk-3.0/settings.ini
elif [[ "$config" = "flameshot" ]]
then
    exec $editor ~/.config/Dharkael/flameshot.ini
elif [[ "$config" = "neovim" ]]
then
    exec $editor ~/.config/nvim/init.vim
elif [[ "$config" = "bpytop" ]]
then
    exec $editor ~/.config/bpytop/bpytop.conf
elif [[ "$config" = "pulse" ]]
then
    exec $editor ~/.config/pulse/default.pa
fi
