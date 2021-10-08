#!/bin/bash

master_icon=""
headphone_icon=""

function get_volume()
{
	master_volume=$(awk -F "[][]" 'NF > 1 {gsub(/%/,"");  print $2}' <(amixer get Master))
	headphone_volume_l=$(awk -F "[][]" '/Left:/ {gsub(/%/,"");  print $2}' <(amixer get Headphone))
	headphone_volume_r=$(awk -F "[][]" '/Right:/ {gsub(/%/,"");  print $2}' <(amixer get Headphone))
}

function get_toggle()
{
	master_toggle=$(awk -F "[][]" 'NF > 1 {print $6}' <(amixer get Master))
	headphone_toggle=$(awk -F "[][]" 'NF > 1 {print $6}' <(amixer get Headphone))

	if [ "$master_toggle" == "off" ]; then
		export master_icon=""
	fi


	if [[ "$headphone_toggle" == *"off"* ]]; then			
		export headphone_icon=""	
	fi
}

get_volume
get_toggle
printf "$master_icon:$master_volume $headphone_icon:$headphone_volume_l/$headphone_volume_r\n"
