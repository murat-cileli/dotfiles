#!/usr/bin/bash

#compton --no-dock-shadow --no-dnd-shadow --backend xrender --fading --config /home/user/.config/compton.conf > /dev/null 2>&1 &
xfce4-terminal &
sleep 0.5
xdotool key Alt_L+h
sleep 0.5
xfce4-terminal &
sleep 0.5
xdotool key Alt_L+v
sleep 0.5
xfce4-terminal &
sleep 0.5
xdotool key Alt_L+2
sleep 1
thunar &
sleep 1
xdotool key Alt_L+3
sleep 1
chrome &
polybar example > /dev/null 2>&1 &
sleep 1.0
/usr/lib/kdeconnectd > /dev/null 2>&1 & 
/usr/bin/kdeconnect-indicator > /dev/null 2>&1 &
flameshot > /dev/null 2>&1 & 
copyq > /dev/null 2>&1 &
gpick > /dev/null 2>&1 &
guake > /dev/null 2>&1 &
