#!/bin/sh

play /usr/share/sounds/menu/open.wav &
i3-dmenu-desktop --dmenu="dmenu -i -p ' I3-DMENU-DESKTOP' -nb '#222222' -sf '#eeeeee' -sb '#567e60' -nf '#bbbbbb' -fn 'SFNS Display:bold:pixelsize=22'"
