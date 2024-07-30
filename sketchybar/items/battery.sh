#!/bin/bash

# sketchybar --add item battery right \
#            --set battery update_freq=120 \
#                          script="$PLUGIN_DIR/battery.sh" \
#            --subscribe battery system_woke power_source_change

           sketchybar --add item battery right \
              --set battery update_freq=2 \
              --set battery script="~/.config/sketchybar/plugins/power.sh" \
              --set battery icon=􀛨