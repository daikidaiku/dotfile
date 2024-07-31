#!/bin/bash

# SPEED="$(networkQuality)"
SPEED="==== SUMMARY ==== Uplink capacity: 58.511 Mbps Downlink capacity: 507.219 Mbps Responsiveness: Medium (137.931 milliseconds | 435 RPM) Idle Latency: 30.708 milliseconds | 2000 RPM"
# echo $SPEED

UPLINK="$(echo $SPEED | grep -Eo "Uplink capacity: \d+\.\d+ .bps" | cut -d' ' -f3)"
UPSPD="$(echo $SPEED | grep -Eo "Uplink capacity: \d+\.\d+ .bps" | cut -d' ' -f4)"

DOWNLINK="$(echo $SPEED | grep -Eo "Downlink capacity: \d+\.\d+ .bps" | cut -d' ' -f3)"
DOWNSPD="$(echo $SPEED | grep -Eo "Downlink capacity: \d+\.\d+ .bps" | cut -d' ' -f4)"

echo $UPLINK$UPSPD
echo $DOWNLINK$DOWNSPD
