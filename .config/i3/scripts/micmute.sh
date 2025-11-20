#!/bin/bash
set -euo pipefail

notification_timeout=1000
led_path="$(/usr/bin/ls -d /sys/class/leds/*micmute* | /usr/bin/head -n1)"

toggle_mute() {
  /usr/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
}

is_muted() {
	/usr/bin/wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -qiE '\bMUTE(D)?\b'
}

set_led() {
	local val="$1"
	[ -n "$led_path" ] && /usr/bin/echo "$val" | /usr/bin/tee "${led_path}/brightness" > /dev/null
}

show_notif() {
	local icon msg

	if is_muted; then
		icon="microphone-disabled-symbolic"
	else
		icon="microphone-sensitivity-high-symbolic"
	fi

	/usr/bin/dunstify -i "$icon" -t "$notification_timeout" \
		-h "string:x-dunst-stack-tag:micmute_notif"
}

toggle_mute
sleep 0.1 # little pause for PipeWire updating state
if is_muted; then
	set_led 1
else
	set_led 0
fi
show_notif
