local opt = vim.opt
local g = vim.g       -- Global variables

g.mapleader = " "

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number
opt.numberwidth = 2         -- width of the line numbers, not the margin
opt.signcolumn = "yes"      -- space on the left of the line numbers.
opt.fillchars = {eob = " "} -- replace the tilde(~) with space
opt.showmode = false        -- hide the modes in the command line.
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
--opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global statusline

opt.termguicolors = true
--vim.cmd[[color slate]]
vim.cmd[[color desert]]
-- getting crispy sharp line while splitting screens.
--vim.cmd([[highlight WinSeparator guibg=none]]) --works only after setting the colorscheme 
vim.api.nvim_set_hl(0, "WinSeparator", { guibg=none }) --same as :highlight WinSeparator guibg=none
vim.api.nvim_set_hl(0, "SignColumn", { guibg=dark }) --set color for the signcolumn.
opt.guicursor = ""


-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.autochdir = true
opt.autoread = true
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- better Autocomplete options

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"


opt.scrolloff=4


-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true  --will convert tabs to spaces
opt.autoindent = true --will keep indentation level from previous line
opt.shiftwidth=2      --will affect block indentation with >> and <<
opt.softtabstop=2     --sets the length of soft tab in spaces
opt.tabstop=2         --sets the width of tab character(1 tab == 2 space)
opt.smarttab = true   --set tabs for a shifttabs logic

-- Disable nvim intro
opt.shortmess:append "sI"

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50
