-- Plugs
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, }) end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
	{
	    'nvim-telescope/telescope.nvim',
	    branch          = '0.1.x',
	    dependencies    = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
	    config = function()
        require("telescope").setup({
            defaults = {
                sorting_strategy    = "ascending",
                layout_strategy     = "bottom_pane",
                border              = false,
                preview             = false,
            },
            -- extensions_list = { "fzf" },
            pickers = { 
                find_files = { find_command = { 'fd', '-acnever', '-tf' } },
                fd = { find_command = { 'fd', '-paHcnever', '-tf', '.', '/home/fj/.dotfiles' } }
            }
        })
        end,
	},
})

vim.cmd([[ autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif ]])

-- Configuración de color
vim.cmd('colorscheme lunaperche')
vim.cmd('set background=dark')
vim.cmd('hi Normal                              ctermbg=NONE    cterm=NONE')
vim.cmd('hi MatchParen      ctermfg=white       ctermbg=black   cterm=bold')
vim.cmd('hi VertSplit       ctermfg=black       ctermbg=NONE    cterm=NONE')
vim.cmd('hi TabLine         ctermfg=gray        ctermbg=NONE    cterm=NONE')
vim.cmd('hi TabLineSel      ctermfg=black       ctermbg=gray    cterm=bold')
vim.cmd('hi TabLineFill     ctermfg=NONE        ctermbg=NONE    cterm=NONE')
vim.cmd('hi StatusLine      ctermfg=white       ctermbg=NONE    cterm=bold')
vim.cmd('hi StatusLineNC    ctermfg=gray        ctermbg=NONE    cterm=NONE')
vim.cmd('hi LineNr          ctermfg=darkgray    ctermbg=NONE    cterm=NONE')
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bold = true })

-- Otras configuraciones
vim.opt.tabstop         = 4
vim.opt.softtabstop     = 4
vim.opt.shiftwidth      = 4
vim.opt.showcmd         = true
vim.opt.backup          = false
vim.opt.writebackup     = false
vim.opt.swapfile        = false
vim.opt.updatecount     = 0
vim.opt.autoindent		  = true
vim.opt.expandtab		    = true
vim.opt.number		      = true
vim.opt.relativenumber	= true
vim.opt.linebreak		    = true
vim.opt.wrap		        = false
vim.opt.incsearch		    = true
vim.opt.hlsearch		    = true
vim.opt.wildmenu		    = true
vim.opt.wildmode        = { 'list', 'longest' }
vim.opt.scrolloff       = 11
vim.opt.showtabline     = 2
vim.opt.laststatus      = 1

-- NETRW
vim.g.netrw_banner      = 0
vim.g.netrw_liststyle   = 3

-- Mapeos de teclas
vim.keymap.set('n', '<C-Left>',   ':tabprevious<CR>', { silent = true })
vim.keymap.set('n', '<C-Right>',  ':tabnext<CR>',     { silent = true })
vim.keymap.set('n', '<C-s>',      ':update<cr>',      { silent = true })
vim.keymap.set('i', '<C-s>',      '<Esc>:update<cr>', { silent = true })

vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>n',  ':noh<CR>')
vim.keymap.set('n', '<leader>tt', ':tabnew<CR>')
vim.keymap.set('n', '<leader>bw', ':bwipeout<CR>')
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>')
vim.keymap.set('n', '<leader>bn', ':bnext<CR>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>')
vim.keymap.set('n', '<leader>fd', ':Telescope fd<CR>')
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>fh', ':Telescope command_history<CR>')
