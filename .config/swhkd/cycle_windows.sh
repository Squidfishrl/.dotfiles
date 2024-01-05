#!/bin/bash

set -o nounset

function cycle_window {
    wmctrl -ia $1
    return 0
}

reverse=false

if [ "$#" == '1' ] && ([ "$1" == '-r' ] || [ "$1" == '--reverse' ]); then
    reverse=true
fi


active_window_id=`xprop -root _NET_ACTIVE_WINDOW | awk -F'# 0x' '{print $2}'`
active_workspace=`wmctrl -d | grep \* | awk '{print $1}'`
workspace_windows=(`wmctrl -l | grep " $active_workspace " | grep -v "Desktop" | awk '{print $1}'`)
windows=${#workspace_windows[@]}
switch_window=""

if [ "$active_window_id" == '0' ]; then
    if [ $windows > 0 ]; then
        cycle_window ${workspace_windows[0]}
    fi

    exit 0
fi

# Iterate over all windows in the workspace
for (( i = 0 ; i < $windows; i++)) do
    # when we find the active window we want to switch to the next window
    if [[ ${workspace_windows[$i]} =~ "$active_window_id" ]]; then
        if [ reverse = false ]; then
            if [ $(($i+1)) == $windows ]; then
                switch_window=${workspace_windows[0]}
            else
                switch_window=${workspace_windows[$i+1]}
            fi
        else
            if (($i == 0)) ; then
                switch_window=${workspace_windows[$windows-1]}
            else
                switch_window=${workspace_windows[$i-1]}
            fi
        fi
    fi

    if [ "$switch_window" != "" ]; then
        break
    fi
done

cycle_window $switch_window

exit 0
