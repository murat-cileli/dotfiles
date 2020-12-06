#!/bin/bash

hideClock=false
hidePanel=true
darkTheme=( "kdenlive" "krita" "Blender" "Unity" "Godot")

if [[ $hideClock == true ]]; then
    dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.panel.statusArea.dateMenu.actor.hide();'
fi

if [[ $hidePanel == true ]]; then
    dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.panel.set_height(1);'
    dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.panel.statusArea.indicator.hide();'
fi


oldId=0

while true
do
    sleep 5s;

    id="$(nice -n19 xdotool getwindowfocus)"

    if [[ $oldId == "$id" ]]; then
        continue;
    fi

    oldId=$id

    props="$(nice -n19 xprop -id "$id")"

    if [[ "$props" == *"STATE_FULLSCREEN"* ]]; then
        continue;
    fi

    for i in "${darkTheme[@]}"
    do
        if [[ $props == *"$i"* ]]; then
           nice -n19 xprop -id "$id" -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT "dark"
        fi
    done
done

