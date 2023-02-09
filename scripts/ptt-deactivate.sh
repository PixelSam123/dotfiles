#!/bin/bash

pactl set-sink-volume 0 < $(< ./last-volume.txt)
