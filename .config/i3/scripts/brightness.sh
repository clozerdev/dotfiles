#!/bin/bash

set -euo pipefail

step_percent=5
notification_timeout=1000

get_brightness() {
	/usr/bin/brightnessctl get
}

get_max_brightness() {
	/usr/bin/brightnessctl max
}

get_brightness_percent() {
	local cur max
	cur=$(get_brightness)
	max=$(get_max_brightness)
	/usr/bin/awk -v c="$cur" -v m="$max" 'BEGIN { printf "%d", (c/m)*100 }'
}

show_brightness_notif() {
	local brightness icon
	brightness=$(get_brightness_percent)

	if [ "$brightness" -le 10 ]; then
		icon="brightness-low-symbolic"
	elif [ "$brightness" -le 60 ]; then
		icon="brightness-medium-symbolic"
	else
		icon="brightness-high-symbolic"
	fi

	/usr/bin/dunstify -i "$icon" "Brightness" "${brightness}%" \
		-t "$notification_timeout" \
		-h "int:value:${brightness}" \
		-h "string:x-dunst-stack-tag:brightness_notif"
}

case "${1:-}" in
	up)
		/usr/bin/brightnessctl --quiet set "${step_percent}%+"
		show_brightness_notif
		;;
	down)
		/usr/bin/brightnessctl --quiet set "${step_percent}%-"
		show_brightness_notif
		;;
	*)
		/usr/bin/echo "Usage: $0 {up|down}" >&2
		exit 1
		;;
esac
