#!/bin/bash

radio='
# ADN Radio
http://22203.live.streamtheworld.com:80/ADN_SC

# Beethoven - Santiago FM
https://unlimited4-us.dps.live/beethovenfm/aac/icecast.audio

# Radio Bío Bío
https://redirector.dps.live/biobiosantiago/aac/icecast.audio

# Radio Cooperativa
http://redirector.dps.live/cooperativafm/mp3/icecast.audio
'

# chosen=$(printf "$radio" | grep '#' | cut -c 2- | rofi -dmenu -p 'Radio  ' -i)
# chosen=$(awk '/^#/ {print $0}' <<< "$radio" | cut -c3- | rofi -dmenu -p 'Radio  ' -i)
chosen=$(grep '^#' <<< "$radio" | cut -c 3- | rofi -dmenu -p 'Radio  ' -i)

[ -n "$chosen" ] && {
    url=$(grep -A 1 "$chosen" <<< "$radio" | tail -n 1)
    coproc ( audacious $url > /dev/null 2>&1 )
}
