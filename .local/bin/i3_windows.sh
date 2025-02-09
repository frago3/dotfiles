#!/bin/bash

i3-msg -t get_tree | jq -r '
    .. | select(.type? == "workspace") | .name as $workspace_name |
    (.nodes[]?                   | "\($workspace_name)   \(.name)   \(.id)"),
    (.floating_nodes[]?.nodes[]? | "\($workspace_name)   \(.name)   \(.id)")
' | sed 's/__i3_scratch/s/' |
$HOME/.local/bin/dmenu.sh -p 'windows' | grep -oE '[^ ]+$' | xargs -I{} i3-msg -q "[con_id={}]" focus
