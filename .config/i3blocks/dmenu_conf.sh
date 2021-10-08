#!/bin/sh

choices="(This file)\ni3wm\ni3 blocks\nlightdm.conf\npacman.conf\npicom.conf\n.bashrc\n.xinitrc\n.xprofile\n.nvidia-settings\ngrub\nulauncher\nmkinitcpio.conf"

play /usr/share/sounds/menu/open.wav &
chosen=$(echo -e "$choices" | dmenu -i -p " DMENU (config editor) " -nb '#222222' -sf '#eeeeee' -sb '#ab6e37' -nf '#bbbbbb' -fn 'SFNS Display:bold:pixelsize=22')

# while read line; do play /usr/share/sounds/menu/cursor.wav; done < "${1:-/dev/stdin}"

text_editor=micro

case "$chosen" in

	\(This\ file\))
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory ~/.config/i3blocks/ -e $text_editor dmenu_conf.sh
		;;
	i3wm)
		play /usr/share/sounds/menu/select.wav &
	 	alacritty --working-directory ~/.config/i3/ -e $text_editor config 
	 	;;
	i3\ blocks) 
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory ~/.config/i3blocks/ -e $text_editor config 
		;;
	lightdm.conf)
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory /etc/lightdm/ -e $text_editor lightdm.conf
		;;
	pacman.conf)
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory /etc/ -e $text_editor pacman.conf
		;;
	picom.conf)
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory ~/.config/picom/ -e $text_editor picom.conf
		;;
	.bashrc)
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory ~/ -e $text_editor .bashrc
		;;
	.xinitrc)
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory ~/ -e $text_editor .xinitrc
		;;
	.xprofile)
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory ~/ -e $text_editor .xprofile
		;;
	.nvidia-settings)
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory ~/ -e $text_editor .nvidia-settings-rc
		;;
	grub)
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory /etc/default/ -e sudo $text_editor grub
		;;
	ulauncher)
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory ~/.local/share/ulauncher/extensions/com.github.iboyperson.ulauncher-system/entries/ -e $text_editor default.json
		;;
	mkinitcpio.conf)
		play /usr/share/sounds/menu/select.wav &
		alacritty --working-directory /etc/ -e sudo $text_editor mkinitcpio.conf
		;;
	*)	
		play /usr/share/sounds/menu/close.wav
		exit
		;;
esac

play /usr/share/sounds/menu/close.wav
