#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

windowManagerName () {
    local window=$(
        xprop -root -notype
    )

    local identifier=$(
        echo "${window}" |
        awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}'
    )

    local attributes=$(
        xprop -id "${identifier}" -notype -f _NET_WM_NAME 8t
    )

    local name=$(
        echo "${attributes}" |
        grep "_NET_WM_NAME = " |
        cut --delimiter=' ' --fields=3 |
        cut --delimiter='"' --fields=2
    )

    echo "${name}"
}


# Launch stuff based on WM
#if [ "$(windowManagerName)" == "bspwm" ]; then
MONITOR=DP-2 polybar main -r -c ~/.config/polybar/config.ini &

external_monitor=$(xrandr --query | grep 'HDMI-0')
if [[ $external_monitor = *connected* ]]; then
    MONITOR=HDMI-0 polybar external -r -c ~/.config/polybar/config.ini &
fi
