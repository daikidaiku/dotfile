#!/bin/bash

# sketchybar --set $NAME label="$(date +'%a %d %b %I:%M %p')"

TIME="$(date "+%I")"



case ${TIME} in
  01) ICON="󱐿"
  ;;
  02) ICON="󱑀"
  ;;
  03) ICON="󱑁"
  ;;
  04) ICON="󱑂"
  ;;
  05) ICON="󱑃"
  ;;
  06) ICON="󱑄"
  ;;
  07) ICON="󱑅"
  ;;
  08) ICON="󱑆"
  ;;
  09) ICON="󱑇"
  ;;
  10) ICON="󱑈"
  ;;
  11) ICON="󱑉"
  ;;
  *) ICON="󱑊"
esac

sketchybar --set $NAME label="$(date +'%H:%M')" icon="$ICON"