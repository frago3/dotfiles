if vim.env.TERM ~= "linux" then
    vim.o.termguicolors=false
    vim.cmd.color('lunaperche')
end

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.autoindent=true
vim.opt.smartindent=true
vim.opt.wrap=false

vim.opt.showtabline=2
vim.opt.laststatus=0

vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.relativenumber=true
vim.opt.wildmode='list:longest'

vim.opt.backup=false
vim.opt.swapfile=false
vim.opt.undofile=false

vim.g.netrw_banner=0
vim.g.netrw_keepdir=0

-- MAPS
vim.keymap.set('n', '<C-Right>',        '<cmd>tabnext<cr>',                 { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>',         '<cmd>tabprevious<cr>',             { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Right>',      '<cmd>bnext<cr>',                   { noremap = true, silent = true })
vim.keymap.set('n', '<C-S-Left>',       '<cmd>bprevious<cr>',               { noremap = true, silent = true })
vim.keymap.set('n', '<C-s>',            '<cmd>update<cr>',                  { noremap = true, silent = false })
vim.keymap.set('i', '<C-s>',            '<esc><cmd>update<cr>',             { noremap = true, silent = false })

vim.g.mapleader=' '
vim.g.maplocalleader='\\'

vim.keymap.set('n', '<leader>t',        '<cmd>tabnew<cr>',                  { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n',        '<cmd>noh<cr>',                     { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bw',       '<cmd>bwipeout<cr>',                { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f',        '<cmd>Explore<cr>',                 { noremap = true, silent = true })

