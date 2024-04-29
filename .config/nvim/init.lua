-- Configuración de color
vim.cmd('colorscheme torte')
vim.cmd('set background=dark')
vim.cmd('hi Normal ctermbg=NONE cterm=NONE')
vim.cmd('hi VertSplit ctermfg=black ctermbg=NONE cterm=NONE')
vim.cmd('hi TabLine ctermfg=grey ctermbg=NONE cterm=NONE')
vim.cmd('hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE')
vim.cmd('hi StatusLine ctermfg=white ctermbg=NONE cterm=NONE')
vim.cmd('hi StatusLineNC ctermfg=grey ctermbg=NONE cterm=NONE')

-- Otras configuraciones
vim.cmd('set showcmd')
vim.cmd('set noswapfile')
vim.cmd('set autoindent')
vim.cmd('set tabstop=4')
vim.cmd('set shiftwidth=4')
vim.cmd('set expandtab')
vim.cmd('set nowrap')
vim.cmd('set incsearch')
vim.cmd('set hlsearch')
vim.cmd('set wildmenu')
vim.cmd('set wildmode=list:longest')
vim.cmd('set number')
vim.cmd('set relativenumber')
vim.cmd('set linebreak')
vim.cmd('set scrolloff=11')
vim.cmd('set showtabline=2')

-- NETRW
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3


-- Mapeos de teclas
vim.keymap.set('n', '<C-Left>', ':tabprevious<CR>')
vim.keymap.set('n', '<C-Right>', ':tabnext<CR>')

vim.keymap.set('n', '<C-s>', ':update<cr>')
vim.keymap.set('i', '<C-s>', '<Esc>:update<cr>')

vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>n', ':noh<CR>')
vim.keymap.set('n', '<leader>ee', ':Explore<CR>')
vim.keymap.set('n', '<leader>te', ':Texplore<CR>')
vim.keymap.set('n', '<leader>tt', ':tabnew<CR>')
vim.keymap.set('n', '<leader>bw', ':bwipeout<CR>')
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>')
vim.keymap.set('n', '<leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<leader>bl', ':ls<CR>:buffer')


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   vim.fn.system({
--     "git", "clone", "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release lazypath,
--   })
-- end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
{
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
})
