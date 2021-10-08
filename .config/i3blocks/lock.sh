#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#ff00ffcc'
TEXT='#ee00eeee'
WRONG='#880000bb'
VERIFYING='#bb00bbbb'

ARCHBLUE='#1793d0'
GREEN='#21ed6d'
PURPLE='#3a1e7eff'
BLACK='#000000dd'
DARKGRAY='#1b1b1bbb'
LIGHTGRAY='#3d3d3dbb'
TEST='#ff0000'

i3lock \
--insidever-color=$LIGHTGRAY     \
--ringver-color=$GREEN   \
\
--insidewrong-color=$BLACK   \
--ringwrong-color=$WRONG     \
\
--inside-color=$DARKGRAY        \
--ring-color=$ARCHBLUE        \
--line-color=$BLANK          \
--separator-color=$BLANK   \
\
--verif-color=$GREEN          \
--wrong-color=$TEST          \
--time-color=$ARCHBLUE           \
--date-color=$ARCHBLUE           \
--layout-color=$TEXT         \
--keyhl-color=$GREEN         \
--bshl-color=$DARKGRAY          \
\
--screen 1                   \
--blur 4                     \
--clock                      \
--indicator                  \
--time-str="%l:%M %p"        \
--date-str="%a | %m/%d/%Y | %S"       \
