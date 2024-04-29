
" color torte
color lunaperche
" set background=dark
hi Normal ctermbg=NONE cterm=NONE
hi VertSplit ctermfg=black ctermbg=NONE cterm=NONE
hi TabLine ctermfg=grey ctermbg=NONE cterm=NONE
hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
" hi LineNr ctermfg=darkgrey
" hi Comment ctermfg=darkgrey
hi StatusLine ctermfg=white ctermbg=NONE cterm=NONE
hi StatusLineNC ctermfg=grey ctermbg=NONE cterm=NONE

set mouse=a
set history=100
set showcmd
set noswapfile

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

set nowrap
set incsearch
set hlsearch
set wildmenu
set wildmode=list:longest
set number
set relativenumber
set linebreak
set scrolloff=11
set showtabline=2
set fillchars=vert:\ ,eob:\ 

" set noequalalways

" NETRW
let g:netrw_banner=0
let g:netrw_liststyle=3
" let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" defines how automatic formatting should be done (see :h fo-table)
" set formatoptions-=t formatoptions-=o formatoptions+=crqjnl1
" set formatoptions=crqjnl1
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>


noremap <F2> <Cmd>set number <bar>setlocal relativenumber!<cr>
nmap <C-s> :update<cr>
imap <C-s> <Esc>:update<cr>

let mapleader=' '
noremap <leader>n :noh<CR>
noremap <leader>ee :Explore<CR>
noremap <leader>te :Texplore<CR>
noremap <leader>tt :tabnew<CR>
noremap <leader>bw :bwipeout<CR>
noremap <leader>bd :bdelete<CR>
noremap <leader>bn :bnext<CR>
noremap <leader>bl :ls<CR>:buffer 
