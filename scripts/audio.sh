function current_vol_func() {
	current_volume=$(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//')
}

#TODO: Get specific incremental controls at a later time
#current_decibal=$(awk -F"[][]" '/dB/ { print $4 }' <(amixer sget Master) | sed 's/%//')
#incremented=$(expr $current_volume + 2)
#echo "Cur: $current_volume% | Inc: $incremented%"

icon=""
current_volume="placeholder"
current_vol_func

if [ "$current_volume" -eq "100" ]
then
	# Toggle back to 0
	$(amixer set Master 0%)
	export icon=" "
else
	# echo "Not 100"
	$(amixer set Master 100%)	
	export icon=" "	
fi

current_vol_func
printf '%s%%\n' "${icon}$current_volume"
# Decide between alleged "security vulnerability"
# and having the convenience to include short text
