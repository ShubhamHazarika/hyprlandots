#!/bin/bash

cliphist list | while read -r line; do
  if echo "$line" | grep -q "\[\[ binary data"; then
    tmp=$(mktemp)
    echo "$line" | cliphist decode > "$tmp"
    type=$(file --mime-type -b "$tmp" | cut -d/ -f2 | tr a-z A-Z)
    size=$(du -h "$tmp" | cut -f1)
    rm "$tmp"
    echo "Image (${type} • ${size})"
  else
    echo "$line"
  fi
done | rofi -dmenu | cliphist decode | wl-copy
