#!/bin/bash
while true; 
do
x11windowmove $(xdotool search --sync --limit 1 --name "Fcitx Input Window") $(pgrep $1.exe | xargs -i xdotool search --onlyvisible --pid {} | grep $(xdotool getwindowfocus)) /tmp/caretpos.$1.sh;
sleep 1;
done 