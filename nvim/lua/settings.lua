-- Gobal Leader
vim.g.mapleader = " "

vim.opt.clipboard = "unnamedplus"   -- use system clipboard 
vim.opt.completeopt = {"menu", "menuone", "noselect"}
vim.opt.mouse = 'a'                -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 3                 -- number of visual spaces per TAB
vim.opt.softtabstop = 3             -- number of spacesin tab when editing
vim.opt.shiftwidth = 3              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.wrap = false                -- warps the word to the next line
vim.opt.cursorline = false          -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = true             -- we are experienced, wo don"t need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

