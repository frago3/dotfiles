#!/bin/bash

# Options
#  -h, --help            display this help and exit.
#  -v, --version         display version.
#  -i, --ignorecase      match items case insensitively.
#  -F, --filter          filter entries for a given string before showing the menu.
#  -w, --wrap            wraps cursor selection.
#  -l, --list            list items vertically down or up with the given number of lines(number of lines down/up). (down (default), up)
#  -p, --prompt          defines the prompt text to be displayed.
#  -P, --prefix          text to show before highlighted item.
#  -I, --index           select item at index automatically.
#  -x, --password        display/hide/replace input. (none (default), hide, indicator)
#  -s, --no-spacing      disable the title spacing on entries.
#  -C, --no-cursor       ignore cursor events.
#  -T, --no-touch        ignore touch events.
#  -K, --no-keyboard     ignore keyboard events.
#  --binding             use alternative key bindings. Available options: vim
#  --fixed-height        prevent the display from changing height on filter.
#  --scrollbar           display scrollbar. (none (default), always, autohide)
#  --counter             display a matched/total items counter. (none (default), always)
#  -e, --vim-esc-exits   exit bemenu when pressing escape in normal mode for vim bindings
#  -N, --vim-normal-mode start in normal mode for vim bindings
#  --accept-single       immediately return if there is only one item.
#  --ifne                only display menu if there are items.
#  --single-instance     force a single menu instance.
#  --fork                always fork. (bemenu-run)
#  --no-exec             do not execute command. (bemenu-run)
#  --auto-select         when one entry is left, automatically select it
#  -b, --bottom          appears at the bottom of the screen. (wx)
#  -c, --center          appears at the center of the screen. (wx)
#  -f, --grab            show the menu before reading stdin. (wx)
#  -n, --no-overlap      adjust geometry to not overlap with panels. (w)
#  -m, --monitor         index of monitor where menu will appear. (wx)
#  -H, --line-height     defines the height to make each menu line (0 = default height). (wx)
#  -M, --margin          defines the empty space on either side of the menu. (wx)
#  -W, --width-factor    defines the relative width factor of the menu (from 0 to 1). (wx)
#  -B, --border          defines the width of the border in pixels around the menu. (wx)
#  -R  --border-radius   defines the radius of the border around the menu (0 = no curved borders).
#  --ch                  defines the height of the cursor (0 = scales with line height). (wx)
#  --cw                  defines the width of the cursor. (wx)
#  --hp                  defines the horizontal padding for the entries in single line mode. (wx)
#  --fn                  defines the font to be used ('name [size]'). (wx)
#  --tb                  defines the title background color. (wx)
#  --tf                  defines the title foreground color. (wx)
#  --fb                  defines the filter background color. (wx)
#  --ff                  defines the filter foreground color. (wx)
#  --cb                  defines the cursor background color. (wx)
#  --cf                  defines the cursor foreground color. (wx)
#  --nb                  defines the normal background color. (wx)
#  --nf                  defines the normal foreground color. (wx)
#  --hb                  defines the highlighted background color. (wx)
#  --hf                  defines the highlighted foreground color. (wx)
#  --fbb                 defines the feedback background color. (wx)
#  --fbf                 defines the feedback foreground color. (wx)
#  --sb                  defines the selected background color. (wx)
#  --sf                  defines the selected foreground color. (wx)
#  --ab                  defines the alternating background color. (wx)
#  --af                  defines the alternating foreground color. (wx)
#  --scb                 defines the scrollbar background color. (wx)
#  --scf                 defines the scrollbar foreground color. (wx)
#  --bdr                 defines the border color. (wx)

# BEMENU_BACKEND=wayland
BEMENU_OPTS="--fn 'system-ui Bold 10' -l13 -B1 -H22 -wibC \
    --hf #ffffff --tf #deddda --af #c0bfbc --nf #c0bfbc --cf #000000 \
    --hb #222222 --tb #000000 --ab #000000 --nb #000000 --fb #000000 --bdr #000000"

seq 36 | bemenu
