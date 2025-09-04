#!/bin/sh

# Terminate already running bar instances
/usr/bin/pkill polybar

MAIN=$(/usr/bin/polybar -m | grep primary | cut -d: -f1)
AUX=$(/usr/bin/polybar -m | grep -v primary | cut -d: -f1)

# Launch Polybar, using default config location ~/.config/polybar/config.ini
[ -n "$MAIN" ] && MONITOR=$MAIN /usr/bin/polybar main -c ${HOME}/.config/polybar/config.ini & disown

echo "$AUX"

if [ -n "$AUX" ]; then
	for aux in $AUX; do
		MONITOR=$aux /usr/bin/polybar aux -c ${HOME}/.config/polybar/config.ini & disown
	done disown
fi
