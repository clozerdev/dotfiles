#!/bin/sh

# This allows services depending on graphical-session having the DISPLAY environment variable
# for running applications requiring it
/usr/bin/dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

# gcr-ssh-agent is managed by systemd. This variable is set here
# so that all the applications spawned from inside the graphical session
# have the variable properly set.
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh

# Autoconfiguration for multiple monitors if any
$HOME/.local/bin/auto-displays.sh

exec /usr/bin/i3
