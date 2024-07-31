#!/usr/bin/env sh

# . "$CONFIG_DIR/resources.sh"
source "$HOME/.config/sketchybar/resources.sh"

# When switching between devices, it's possible to get hit with multiple
# concurrent events, some of which may occur before `scutil` picks up the
# changes, resulting in race conditions.
sleep 1

services=$(networksetup -listnetworkserviceorder)
device=$(scutil --nwi | sed -n "s/.*Network interfaces: \([^,]*\).*/\1/p")

test -n "$device" && service=$(echo "$services" \
  | sed -n "s/.*Hardware Port: \([^,]*\), Device: $device.*/\1/p")

color=$FG1
case $service in
  "iPhone USB")         icon=$NET_USB;;
  "Thunderbolt Bridge") icon=$NET_THUNDERBOLT;;

  Wi-Fi)
    ssid=$(networksetup -getairportnetwork "$device" \
      | sed -n "s/Current Wi-Fi Network: \(.*\)/\1/p")
    case $ssid in
      *iPhone*) icon=$NET_HOTSPOT;;
      "")       icon=$NET_DISCONNECTED; color=$FG2;;
      *)        icon=$NET_WIFI;;
    esac;;

  *)
    wifi_device=$(echo "$services" \
      | sed -n "s/.*Hardware Port: Wi-Fi, Device: \([^\)]*\).*/\1/p")
    test -n "$wifi_device" && status=$( \
      networksetup -getairportpower "$wifi_device" | awk '{print $NF}')
    icon=$(test "$status" = On && echo "$NET_DISCONNECTED" || echo "$NET_OFF")
    color=$FG2;;
esac

SPEED="$(networkQuality)"
# SPEED="==== SUMMARY ==== Uplink capacity: 58.511 Mbps Downlink capacity: 507.219 Mbps Responsiveness: Medium (137.931 milliseconds | 435 RPM) Idle Latency: 30.708 milliseconds | 2000 RPM"

UPLINK="$(echo $SPEED | grep -Eo "Uplink capacity: \d+\.\d+ .bps" | cut -d' ' -f3)"
UPSPD="$(echo $SPEED | grep -Eo "Uplink capacity: \d+\.\d+ .bps" | cut -d' ' -f4)"

DOWNLINK="$(echo $SPEED | grep -Eo "Downlink capacity: \d+\.\d+ .bps" | cut -d' ' -f3)"
DOWNSPD="$(echo $SPEED | grep -Eo "Downlink capacity: \d+\.\d+ .bps" | cut -d' ' -f4)"

# echo $UPLINK$UPSPD
# echo $DOWNLINK$DOWNSPD

sketchybar --animate sin 5 \
           --set net.up label="$UPLINK$UPSPD" icon.highlight=$(if [ "$DOWN" -gt "0" ]; then echo "on"; else echo "off"; fi) \
           --set net.down label="$DOWNLINK$DOWNSPD" icon.highlight=$(if [ "$DOWN" -gt "0" ]; then echo "on"; else echo "off"; fi) \
           --set net.icon "$NAME" icon="$icon" icon.color="$color" \