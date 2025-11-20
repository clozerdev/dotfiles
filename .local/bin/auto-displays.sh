#!/usr/bin/env bash
set -euo pipefail

# Monitor names
INTERNAL="eDP"
HDMI="HDMI-A-0"
DP="DisplayPort-0"

XRANDR_OUTPUT="$(/usr/bin/xrandr)"

is_connected() {
	grep -q "^$1 connected" <<< "$XRANDR_OUTPUT"
}

# Two external monitors, laptop lid closed
if is_connected "$HDMI" && is_connected "$DP"; then
    /usr/bin/xrandr \
        --output "$INTERNAL" --off \
        --output "$DP" --primary --mode 1920x1080 --rate 120.00 --pos 0x0 \
        --output "$HDMI" --mode 1920x1080 --rate 120.00 --left-of "$DP"
# Only HDMI connected
elif is_connected "$HDMI"; then
    /usr/bin/xrandr \
        --output "$INTERNAL" --off \
        --output "$HDMI" --primary --mode 1920x1080 --rate 120.00 --pos 0x0 \
        --output "$DP" --off

# Only DisplayPort connected
elif is_connected "$DP"; then
    /usr/bin/xrandr \
        --output "$INTERNAL" --off \
        --output "$DP" --primary --mode 1920x1080 --rate 120.00 --pos 0x0 \
        --output "$HDMI" --off
fi
