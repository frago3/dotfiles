-- OPTS
vim.opt.backup=false
vim.opt.swapfile=false
vim.opt.undofile=false
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.autoindent=true
vim.opt.smartindent=true
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.cursorline=true
vim.opt.cursorlineopt="number"
vim.opt.signcolumn="yes"
vim.opt.showtabline=2
vim.opt.laststatus=0
vim.opt.scrolloff=12
vim.opt.wrap=false
vim.opt.completeopt="menuone,popup,noinsert,noselect"
-- treedepthstring /usr/share/nvim/runtime/pack/dist/opt/netrw/autoload/netrw.vim
vim.g.netrw_liststyle=3
vim.g.netrw_banner=0
vim.g.netrw_bufsettings="noma nomod nu rnu nobl nowrap ro"
-- vim.g.netrw_keepdir=0

-- MAPS
vim.keymap.set("n", "<C-Right>",        "<cmd>tabnext<cr>",         { noremap=true, silent=true })
vim.keymap.set("n", "<C-Left>",         "<cmd>tabprevious<cr>",     { noremap=true, silent=true })
vim.keymap.set("n", "<C-S-Right>",      "<cmd>bnext<cr>",           { noremap=true, silent=true })
vim.keymap.set("n", "<C-S-Left>",       "<cmd>bprevious<cr>",       { noremap=true, silent=true })
vim.keymap.set("n", "<C-s>",            "<cmd>update<cr>",          { noremap=true, silent=false })
vim.keymap.set("i", "<C-s>",            "<esc><cmd>update<cr>",     { noremap=true, silent=false })

vim.g.mapleader=" "
vim.g.maplocalleader="\\"
vim.keymap.set("n", "<leader>bw",       "<cmd>bwipeout<cr>",        { noremap=true, silent=true })
vim.keymap.set("n", "<leader>t",        "<cmd>tabnew %<cr>",        { noremap=true, silent=true })
vim.keymap.set("n", "<leader>f",        "<cmd>Exp<cr>",             { noremap=true, silent=true })

vim.cmd.color("lunaperche")

require("core.lazy")

-- LSP SERVER
-- vim.lsp.enable({ "gopls" })
