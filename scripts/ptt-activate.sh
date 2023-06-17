#!/bin/bash

pactl get-sink-volume 0 | grep -Po "\\d+%" | head -n 1 > ./last-volume.txt

pactl set-sink-volume 0 10%
