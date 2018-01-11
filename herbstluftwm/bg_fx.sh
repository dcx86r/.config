#!/bin/bash

hc="herbstclient"
blur=5
wallpaper=$(sed -n 2p < ~/.fehbg | cut -d ' ' -f 3)

root() {
  clients=$($hc attr tags.focus.client_count)
  frames=$($hc attr tags.focus.frame_count)
  empty=( $(xdotool getmouselocation --shell) )
  what=$(echo "${empty[3]}" | cut -d'=' -f2)
  if [ "$what" -eq "172" ] && [ "$clients" -lt "2" ]; then
	echo "$wallpaper"	
  else
	if [ "$clients" -gt "1" ] ; then
     		echo "--blur $blur $wallpaper" 
	else 
		echo "$wallpaper"
  	fi
fi
}

eval setroot "$(root 0)" &
