# ...
sketchybar --add item net.icon right                  \
           --set net.icon script="$PLUGIN_DIR/net.sh" \
                     updates=on                  \
                     label.drawing=off           \
           --subscribe net.icon wifi_change \
           --add item net.up right \
                     updates=on                  \
           --add item net.down right\
                     updates=on                  \

# ...