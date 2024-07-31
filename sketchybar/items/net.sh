# ...
#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"

sketchybar --add item net.icon right 100                 \
           --set net.icon script="$PLUGIN_DIR/net.sh" \
                     updates=on                  \
                     update_freq=5            \
                     label.drawing=off         \
                     width=105   \
           --subscribe net.icon wifi_change \
           --add item net.up right \
           --set net.up label.font="$FONT:Bold:12.0" \
                               y_offset=5 \
                               width=0 \
                               update_freq=1 \
                               script="$PLUGIN_DIR/network.sh" \
                               background.padding_right=-75   \
                               --add item net.up right \
           --add item net.down right\
           --set net.down label.font="$FONT:Bold:12.0" \
                               y_offset=-5 \
                               width=0 \
                               update_freq=1 \
                               background.padding_right=-75   \
            --add item up.icon right \
            --set up.icon      label.drawing=off         \
                               icon.font="$FONT:Bold:14.0" \
                               icon=󰅃 \
                               icon.highlight_color=$BLUE \
                               y_offset=5 \
                               width=0 \
                               update_freq=1 \
                               background.padding_right=-10   \
            --add item down.icon right \
            --set down.icon    label.drawing=off         \
                               icon.font="$FONT:Bold:14.0" \
                               icon=󰅀 \
                               icon.highlight_color=$BLUE \
                               y_offset=-5 \
                               width=0 \
                               update_freq=1 \
                               background.padding_right=-10   \
           

# ...