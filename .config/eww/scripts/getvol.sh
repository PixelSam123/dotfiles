#!/bin/sh

pactl get-sink-volume 0 | grep -Po "\\d+%" | head -n 1

pactl subscribe | grep --line-buffered "'change' on source" | while read -r _; do
    pactl get-sink-volume 0 | grep -Po "\\d+%" | head -n 1
done
