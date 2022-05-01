#!/usr/bin/env bash

monitors=$(xrandr -q | grep " connected" | cut -d ' ' -f1)
SAVEIFS=$IFS
IFS=$'\n'
monitors=($monitors)
IFS=$SAVEIFS

export MAIN_MONITOR="${monitors[0]}"
showinfo=0
if [ ${#monitors[@]} -ge 2 ]
then
    export INFO_MONITOR="${monitors[1]}"
    showinfo=1
fi

main="main"
info="info"
killall -q polybar
polybar "$main" 2>&1 | tee -a /tmp/polybar.log & disown
if [ $showinfo -eq 1 ]
then
    polybar "$info" 2>&1 | tee -a /tmp/polybar.log & disown
fi
echo "Polybar launched"
