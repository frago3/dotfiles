#!/bin/bash
# seq 4900 233 6400 | sort -r

while true
do
    chosen=$(printf "off\n6300\n6066\n5833\n5599\n5366\n5133\n4900" \
        | rofi -dmenu -p 'Redshift  ' -i -select ${chosen:-'off'})

    case $chosen in
        off)
            redshift -x
            ;;
        [4-6][0-9][0-9][0-9])
            redshift -PO $chosen
            ;;
        *)
            exit
    esac
done
