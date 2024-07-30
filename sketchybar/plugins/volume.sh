#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

source "$HOME/.config/sketchybar/colors.sh"

if [ "$SENDER" = "volume_change" ]; then
  VOLUME=$INFO

  case $VOLUME in
    [6-9][0-9]|100) ICON="􀊩" COLOR="$WHITE"
    ;;
    [3-5][0-9]) ICON="􀊥" COLOR="$WHITE"
    ;;
    [1-9]|[1-2][0-9]) ICON="􀊡" COLOR="$WHITE"
    ;;
    *) ICON="􀊣" COLOR="$RED"
  esac

  sketchybar --set $NAME icon="$ICON" label="$VOLUME%" icon.color="$COLOR"
fi