#!/usr/bin/env bash

# Terminate all polybar instances
/usr/bin/killall -q polybar
while /usr/bin/pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MAIN=$(polybar -m | awk '/primary/ {sub(/:.*/, ""); print; exit}')

while IFS= read -r monitor; do
    [[ -z "$monitor" ]] && continue
    MONITOR="$monitor" polybar aux -c "$HOME/.config/polybar/config.ini" &
done < <(polybar -m | awk '!/primary/ {sub(/:.*/, ""); print}')

MONITOR="$MAIN" polybar main -c "$HOME/.config/polybar/config.ini" &

disown -a
