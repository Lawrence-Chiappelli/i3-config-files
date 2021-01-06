path=/home/lawrence/.config/i3/scripts/VAR-BRIGHTNESS
brightness=$(less "$path")

# First, basic checks: is there even any data in the file?
if [ -z "$brightness"]  # -z flag determines emptiness of string
then
	$(echo 1.0 > "$path")  # Add it to the file
	export brightness="$(less $path)"  # Reassign the local variable
fi

if (( $(echo "$brightness >= 1.0" |bc -l) ))  # If at max brightness
then exit  # Exit and do nothing
fi

# Getting (primary) monitor
monitor=($(xrandr --listmonitors))  # Getting raw output
export monitor=$(echo ${monitor[5]})  # Get index position of word monitor string
# export monitor=echo ${monitor[5]//+\*}  # Extract word and remove characters

# Computing new brightness
added=$(echo $brightness + 0.1 | bc)  # Adding 0.1 to existing brightness
$( > $path) # Empty the file
$(echo "$added" > $path)  # Add and save with new brightness

xrandr --output $monitor --brightness $added  # Apply brightness
