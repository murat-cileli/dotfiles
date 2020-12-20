#!/bin/bash

hideClock=true
hidePanel=true
darkTheme=( "kdenlive" "krita" "Blender" "Unity" "Godot")

if [[ $hideClock == true ]]; then
    dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.panel.statusArea.dateMenu.actor.hide();'
fi

if [[ $hidePanel == true ]]; then
    dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.panel.set_height(1);'
    dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.panel.statusArea.indicator.hide();'
fi

nice -n19 xprop -spy -root _NET_ACTIVE_WINDOW | grep --line-buffered -o "0[xX][a-zA-Z0-9]\{7\}" |
while read -r id; do
    class="$(nice -n19 xprop -id "$id" WM_CLASS)"
    if [ -n "$class" ]; then
    for i in "${darkTheme[@]}"
    do
        if [[ "$class" == *"$i"* ]]; then
           nice -n19 xprop -id "$id" -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT "dark"
        fi
    done   
fi
done
