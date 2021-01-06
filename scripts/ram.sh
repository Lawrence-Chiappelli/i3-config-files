used=$(awk '/^Mem/ {printf("%.1fG", $3/1024);}' <(free -m))
total=$(awk '/^Mem/ {printf("%.1fG", $2/1024);}' <(free -m))
percent=$(awk '/^Mem/ {printf("%.0f", $3/$2*100);}' <(free -m))  # Add a '%' after the .0f for a percentage character in output
#echo "$percent of $used/$total"  # For debugging purposes

if [ "$percent" -lt "25" ] # Red-ish
then
	color="#C9E3DB"
elif (( "$percent" >= "25" && "$percent" < "50" )) # Orange
then
	color="#ffa31a"
elif (( "$percent" >= "50" && "$percent" < "60" )) # Yellow
then
	color="#ffff1a"
elif (( "$percent" >= "60" && "$percent" < "90" )) # Green 
then
	color="#00ff00"
elif (( "$percent" > "90" && "$percent" <= "100" )) # Blue
then
	color="#3399ff"
else  # Gray (unable to determine percentage is what this means)
	color="#4d4d4d"
fi

printf " - $used/$total\n: $used\n$color\n"
