#!/bin/sh

mons="$(xrandr -q | grep -w connected)"
numMons="$(echo "$mons" | wc -l)"

if [ "$numMons" -gt 1 ]; then
  primary="DVI-I-1"
  right="DP-1"
  xrandr --output "$primary" --primary --rotate normal --output "$right" --right-of $primary --rotate left
fi
