" Vim color file
" Maintainer:	The Vim Project <https://github.com/vim/vim>
" Last Change:	2023 Aug 10
" Former Maintainer:	Bram Moolenaar <Bram@vim.org>

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
" set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "default"
" vim: sw=2
hi CursorLineNr ctermfg=grey ctermbg=NONE cterm=NONE
hi StatusLine ctermfg=white ctermbg=NONE cterm=NONE
hi StatusLineNC ctermfg=grey ctermbg=NONE cterm=NONE
hi VertSplit ctermfg=black ctermbg=black cterm=NONE
hi TabLine ctermfg=grey ctermbg=black cterm=NONE
hi TabLineFill ctermfg=NONE ctermbg=black cterm=NONE
hi Comment ctermfg=darkgrey ctermbg=NONE cterm=NONE
hi LineNr ctermfg=grey ctermbg=NONE cterm=NONE

hi CursorLineNr ctermfg=magenta ctermbg=NONE cterm=bold
hi CursorLine ctermfg=magenta ctermbg=NONE cterm=bold
hi Comment ctermfg=grey ctermbg=NONE cterm=NONE

set background=dark
