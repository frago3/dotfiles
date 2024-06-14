# FZF_DEFAULT_OPTS="\
#     --reverse
#     --no-info
#     --no-separator
#     --no-scrollbar
#     --preview-window=border-none,70%
#     --color=gutter:-1,prompt:4,pointer:1,hl:15:bold,hl+:15"

FZF_DEFAULT_OPTS="--no-info --no-separator --no-scrollbar --preview-window=border-none,70% --color=gutter:-1,prompt:4,pointer:1,hl:15:bold,hl+:15"
# fd -tf . ~/Documentos/notas/ |
#     fzf --bind 'right:preview:cat {}'

command ls -a| fzf --bind 'tab:reload:(command ls -a $PWD/{}):transform-prompt($PWD)'
    # --bind 'enter:reload:(command ls -a $PWD/{})'

