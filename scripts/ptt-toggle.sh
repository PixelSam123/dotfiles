#!/bin/bash

if [ $(< ./is-ptt-active.txt) = true ]; then
    aplay ./ptt-off.wav &

    echo "false" > ./is-ptt-active.txt
    pactl set-source-mute 0 1
    pactl set-sink-volume 0 $(< ./last-volume.txt)
else
    aplay ./ptt-on.wav &

    echo "true" > ./is-ptt-active.txt
    pactl get-sink-volume 0 | grep -Po "\\d+%" | head -n 1 > ./last-volume.txt

    pactl set-sink-volume 0 10%
    pactl set-source-mute 0 0
fi
