# !/bin/bash

 # swaymsg -pt get_tree | awk '
 # BEGIN {
 #     app["org.pwmt.zathura"] = "zathura"
 #     app["com.transmissionbt.transmission_66307_18879204"] = "transmission"
 # }

 # /#[0-9]+: workspace / {
 #     gsub(/"/,"",$3)
 #     workspace = ($3=="__i3_scratch")? "S " : $3" "
 # }

 # /^ *#[0-9]+: .*con /{

 #     id      = $1; gsub(/#|:/,"",id)
 #     name    = $0; gsub(/^ *#[0-9]+: .*con "|" \(xdg_shell, pid: [0-9]+, app_id: ".*\)/,"",name)
 #     app_id  = $0; gsub(/^ *#[0-9]+: .* \(xdg_shell, pid: [0-9]+, app_id: "|"\)$/, "", app_id)

 #     if(name != "(null)\"")
 #         print workspace,app[app_id]? app[app_id] : app_id, "- "name" ", id }'

swaymsg -t get_tree |
    jq -r '.. | objects | select(.type == "workspace") | "\(.name)  " + ( .. | objects | select(has("app_id")) | "\(.app_id) - \(.name) \(.id)")' |
    awk 'BEGIN {
            app["org.pwmt.zathura"] = " zathura"
            app["com.transmissionbt.transmission_66307_18879204"] = " transmission" }
        {
            $1 == "__i3_scratch" && $1 = "S "
            app[$2] && $2 = app[$2]
            print $0
        }' | bemenu -p 'windows' |
    grep -oE '[^ ]+$' | xargs -I {} swaymsg "[con_id={}]" focus
