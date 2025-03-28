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

# Start the window manager
exec /usr/local/bin/i3
