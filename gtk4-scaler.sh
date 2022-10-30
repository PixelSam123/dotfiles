#!/usr/bin/sh

xrdb -merge <(echo "Xft.dpi: 96")
sleep 0.075
xrdb -merge <(echo "Xft.dpi: 192")
