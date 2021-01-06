#$WIFI=nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2

# Depends on abd package

is_connected=$(ping -c 1 -q aur.archlinux.org >&/dev/null; echo $?)

if (($is_connected==0))
then
	printf " - Connected\n\n#00ff00\n"
elif (($is_connected==2))
then
	# if [ -z "$(lsusb -d 0x04e8:)"]  # The best I can do to detect connected USB
	# Only limitation is that non-android devices won't be detected
	if [[ $(lsusb) == *"network tethering, USB debugging enabled"* ]];
	then
		printf " - USB tethering\n\n#ff8000\n"
	else
		printf " - Disconnected\n\n#ff0d0d\n"
	fi
e
else
	echo "Status: $is_connected"
fi
