#!/bin/bash

[[ $(pgrep emit_hook | wc -l) -gt 2 ]] && exit

herbstclient --idle 'focus_changed' | while read hook winid title
do
  case $winid in
    *)    case $hook in
            focus_changed) active_hlwm.sh & ;;
          esac
          ;;
  esac
done
