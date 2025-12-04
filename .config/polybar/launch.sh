#!/bin/sh

# Terminate all polybar instances
/usr/bin/pkill polybar

# Get MONITOR variables for different screens
PRIMARY=$(/usr/bin/polybar -m | grep primary | cut -d: -f1)

# Iterate through all monitors
for m in $(/usr/bin/polybar -m | cut -d: -f1); do
	if [ "$m" = "$PRIMARY" ]; then
        MONITOR=$m /usr/bin/polybar primary -c ${HOME}/.config/polybar/config.ini & disown
	else
		MONITOR=$m /usr/bin/polybar aux -c ${HOME}/.config/polybar/config.ini & disown
	fi
done
