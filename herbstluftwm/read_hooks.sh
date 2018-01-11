#!/bin/bash

rpath=~/.config/herbstluftwm
hc="herbstclient"

[[ $(pgrep emit_hook | wc -l) -gt 2 ]] && exit

$hc --idle 'focus_changed|tag_changed|window_title_changed|minimal' | while read hook id

do
  case $id in
    *)    case $hook in
	    tag_changed) eval rubikongen > /tmp/rubik.xpm & ;;
	    focus_changed) eval $rpath/bg_fx.sh & ;;
	    window_title_changed) eval $rpath/bg_fx.sh ;;
	    minimal) eval $rpath/hide_bars.sh & ;;
          esac
          ;;
  esac
done
