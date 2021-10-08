# First check if an argument is required: if it's omitted, inform the user
if [ -z "$1" ]; then
	echo "Providing 'increase', 'decrease', or 'reset' as an argument is required. Aborting."
	exit
fi

function get_cur_brightness()
{	
	cur_brightness=$(awk '/'"${1}"'/,/Brightness/{print $2}' <(xrandr --verbose) | tail -n -1)
	# Note: the shell interpretation protection is absolutely required with the $argument variable
}

monitors=$(awk 'NR > 1 {print $4}' <(xrandr --listactivemonitors))		
for monitor in $monitors
do					
	case "${1}" in
		"increase")			
			get_cur_brightness $monitor
			if [[ "$cur_brightness" != "1.0" ]]; then
				new_brightness=$(echo $cur_brightness + 0.1 | bc); else exit
			fi						
			;;
		"decrease")
			get_cur_brightness $monitor
			if [[ "$cur_brightness" != "0.10" ]]; then
				new_brightness=$(echo $cur_brightness - 0.1 | bc); else exit
			fi
			;;
		"reset")			
			new_brightness=1.0
			;;
		"current")
			get_cur_brightness $monitor
			echo "$monitor @ $cur_brightness"
			new_brightness=$cur_brightness
			;;
		*)					
			echo "Argument '$1' is not recognized."
			exit
			;;			
	esac

	##########################################################
	xrandr --output $monitor --brightness "$new_brightness"  #
	##########################################################
	
done
