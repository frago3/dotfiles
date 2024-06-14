# !/bin/bash

swaymsg -t get_tree |
    jq -r '.. | objects | select(.type == "workspace") | "\(.name)  " + ( .. | objects | select(has("app_id")) | "\(.app_id) - \(.name) \(.id)")' |
    awk 'BEGIN {
            app["-"] = " brave -"
            app["brave-browser"] = " brave"
            app["pcmanfm-qt"] = " pcmanfm"
            app["org.pwmt.zathura"] = " zathura"
            app["org.qbittorrent.qBittorrent"] = " qBittorrent" }
        {
            $1 == "__i3_scratch" && $1 = "S "
            app[$2] && $2 = app[$2]
            print $0
        }' |
    bemenu -p 'windows' | grep -oE '[^ ]+$' | xargs -I{} swaymsg "[con_id={}]" focus
