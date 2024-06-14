txt="            Connected network     elisa5GHZ_D600D5 popa pipa                 "

echo "$txt" | sed -e 's/^.*network *//' -e 's/ *$//'
