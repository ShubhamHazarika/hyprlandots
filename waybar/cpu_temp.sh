#!/bin/bash

# Try to grab AMD CPU temperature (Tctl or Tdie)
temp=$(sensors | grep -E 'Tctl|Tdie' | head -n1 | grep -oP '\+\K[0-9]+(\.[0-9]+)?' | head -n1)

if [ -z "$temp" ]; then
    echo "N/A"
else
    echo "${temp}°C"
fi
