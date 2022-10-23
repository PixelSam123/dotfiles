#!/usr/bin/sh

xrdb -merge <(echo "Xft.dpi: 96")
sleep 0.05
xrdb -merge <(echo "Xft.dpi: 192")
