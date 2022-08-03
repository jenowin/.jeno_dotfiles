#!/bin/sh
xrandr --output HDMI-1-0 --mode 1920x1080 --right-of eDP1 --mode 1920x1080
picom -b --experimental-backends
xset r rate 350 50

# set this xwallpaper command last and before executing window manager.
xwallpaper --output HDMI-1-0 --stretch ~/.local/share/backgrounds/arch2.jpg --output eDP1 --stretch ~/.local/share/backgrounds/arch1.jpg 
exec dwm 
