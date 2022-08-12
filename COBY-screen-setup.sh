#!/bin/bash

# Three steps to creating and enabling new resolution:
# 1.)  Create a new mode with specifications defined by gtf or cvt modules
# 2.)  Add the new mode to the desired display
# 3.)  Change output of display to the new mode



# 1368 x 768 (COBY TFTV's resolution is 1366 x 768; 1368 x 768 is closest default resolution)
xrandr --newmode "1368x768_60.00"  85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync
xrandr --addmode HDMI-1 "1368x768_60.00"
xrandr --output HDMI-1 --set audio force-dvi --mode "1368x768_60.00" --left-of eDP-1


# Transform screen to compensate for overscan
xrandr --output HDMI-1 --transform 1,0,-5,0,1,0,0,0,1

#xrandr --output eDP-1 --rate "59.98"


# Explicitly set internal laptop display; scale flag fixes blinking mouse


xrandr --output eDP-1 --auto --primary
xrandr --output eDP-1 --scale 0.999999x0.9999999

