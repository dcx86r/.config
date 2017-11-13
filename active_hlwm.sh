#!/bin/bash

hc="herbstclient"
blur=3
wallpaper=$(cut -d ' ' -f 4 < ~/.fehbg)

root() {
  tag=$(($($hc attr monitors.$@.tag) - 1))
  client=$($hc attr tags.$tag.client_count)
  (( $client )) \
    && frames $client \
    && echo "--blur $blur $wallpaper" \
    || echo "$wallpaper"
}

frames() {
  if [ $client -eq 1 ]; then
    opacity 0
  else
    opacity 60
  fi
}

opacity() {
  $hc set frame_normal_opacity $1
}

eval setroot "$(root 0)" &
