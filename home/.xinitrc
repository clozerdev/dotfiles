#!/bin/sh

# Use alacritty as terminal but
# continue using i3-sensible-terminal :)
export TERMINAL=alacritty

# Load variables for resources, etc.
user_resources=$HOME/.Xresources

# Merge in defaults
if [ -f $user_resources ]; then
	/usr/bin/xrdb -merge $user_resources
fi

# Set arrow pointer instead of loading
/usr/bin/xsetroot -cursor_name left_ptr &

# gnome-keyring-daemon is managed by systemd. This variable is set here
# so that all the applications spawned from inside the graphical session
# have the variable properly set.
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh

# Start the window manager with a D-Bus session
exec dbus-launch --exit-with-session /usr/local/bin/i3

# Start i3 without a D-Bus session
# exec /usr/local/bin/i3
