#!/bin/bash

hc="herbstclient"
geometry=( $($hc monitor_rect 0) )
panel_height=30
base_y=$(( ${geometry[3]} - $panel_height ))
dual_pad=0

window=( $(xdotool search --name "dzen") )
for i in ${window[@]}; do
	Y=( $(xdotool getwindowgeometry --shell $i) )
	Y=$(echo "${Y[2]}" | cut -d'=' -f2)

	if [ "$Y" -ge "${geometry[3]}" ]; then
		Y=$base_y
		dual_pad=1
	elif [ "$Y" -eq "$base_y" ]; then
		Y=${geometry[3]}
		dual_pad=0
	elif [ "$Y" -eq "0" ]; then
		Y="-$panel_height"
		dual_pad=0
	elif [ "$Y" -lt "0" ]; then
		Y=0
		dual_pad=1
	else 
		Y=0
		dual_pad=1
	fi

	if [ "$dual_pad" -eq "1" ]; then
		$hc pad 0 0 0 $panel_height
		$hc pad 0 $panel_height
		$hc set frame_gap 30
		$hc set frame_border_width 20
	else
		$hc pad 0 0 0 0 0
		$hc set frame_gap 20
		$hc set frame_border_width 10
	fi
		
	xdotool windowmove $i x $Y
done
