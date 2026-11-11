#!/bin/bash

TOUCHPAD="crq1080:00-0488:1014-touchpad"

if ls /dev/input/by-id/ | grep -Ei "usb.*mouse" | grep -vi "touchpad" > /dev/null; then
    hyprctl keyword "device:${TOUCHPAD}:enabled" false
else
    hyprctl keyword "device:${TOUCHPAD}:enabled" true
fi
