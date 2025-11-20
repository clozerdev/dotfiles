#!/bin/sh

# This allows services depending on graphical-session having the DISPLAY environment variable
# for running applications requiring it
/usr/bin/dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

# Autoconfiguration for multiple monitors if any
$HOME/.local/bin/auto-displays.sh

exec /usr/bin/i3
