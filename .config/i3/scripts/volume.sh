#!/bin/bash

set -euo pipefail

# Config
step_percent=5
notification_timeout=1000

get_vol_line() {
  /usr/bin/wpctl get-volume @DEFAULT_AUDIO_SINK@
}

get_vol_float() {
  get_vol_line | /usr/bin/grep -oE '[0-9]+(\.[0-9]+)?' | /usr/bin/head -n1
}

get_vol_percent() {
  /usr/bin/awk -v v="$(get_vol_float)" 'BEGIN { printf "%d", (v*100)+0.5 }'
}

is_muted() {
  get_vol_line | /usr/bin/grep -qiE '\bMUTE(D)?\b'
}

show_volume_notif() {
  local vol icon
  vol="$(get_vol_percent)"

  if is_muted; then
    icon="audio-volume-muted-symbolic"
  elif [ "$vol" -ge 70 ]; then
    icon="audio-volume-high-symbolic"
  elif [ "$vol" -ge 30 ]; then
    icon="audio-volume-medium-symbolic"
  else
    icon="audio-volume-low-symbolic"
  fi

  /usr/bin/dunstify -i "$icon" "Volume" "${vol}%" \
    -t "$notification_timeout" \
    -h "int:value:${vol}" \
    -h "string:x-dunst-stack-tag:volume_notif"
}

case "${1:-}" in
  volume_up)
    /usr/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    /usr/bin/wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ "${step_percent}%+"
    show_volume_notif
    ;;
  volume_down)
    /usr/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ "${step_percent}%-"
    show_volume_notif
    ;;
  volume_mute)
    /usr/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    show_volume_notif
    ;;
  *)
    echo "Usage: $0 {volume_up|volume_down|volume_mute}" >&2
    exit 1
    ;;
esac
