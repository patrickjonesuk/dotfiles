#!/usr/bin/env bash

bar="main"
killall -q polybar
polybar "$bar" 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched"
