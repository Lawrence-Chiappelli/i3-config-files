#!/bin/sh

play /usr/share/sounds/menu/open.wav &
dmenu_run -i -p " DMENU_RUN " -nb '#222222' -sf '#eeeeee' -sb '#6137ab' -nf '#bbbbbb' -fn 'SFNS Display:bold:pixelsize=22'
