local opt = vim.opt
local g = vim.g 

g.mapleader = " "


local options = {
  number = true,           -- Show line number
  numberwidth = 2,         -- width of the line numbers, not the margin
  signcolumn = "yes",      -- space on the left of the line numbers.
  fillchars = {eob = " "}, -- replace the tilde(~) with space
  showmode = false,        -- hide the modes in the command line.
  showmatch = true,        -- Highlight matching parenthesis
  foldmethod = 'marker',   -- Enable folding (default 'foldmarker')
  --colorcolumn = '80',      -- Line lenght marker at 80 columns
  splitright = true,       -- Vertical split to the right
  splitbelow = true,       -- Horizontal split to the bottom
  ignorecase = true,       -- Ignore case letters when search
  smartcase = true,        -- Ignore lowercase for the whole pattern
  linebreak = true,        -- Wrap on word boundary
  termguicolors = true,    -- Enable 24-bit RGB colors
  laststatus=3,            -- Set global statusline
  guicursor = "",
  termguicolors = true,

  autochdir = true,
  autoread = true,
  mouse = 'a',                       -- Enable mouse support
  scrolloff=4,
  clipboard = 'unnamedplus',         -- Copy/paste to system clipboard
  swapfile = false,                  -- Don't use swapfile
  completeopt = 'menuone,noinsert,noselect',  -- better Autocomplete options go to previous/next line with h,l,left arrow and right arrow

  expandtab = true,  --will convert tabs to spaces
  autoindent = true, --will keep indentation level from previous line
  shiftwidth=2,      --will affect block indentation with >> and <<
  softtabstop=2,     --sets the length of soft tab in spaces
  tabstop=2,         --sets the width of tab character(1 tab == 2 space)
  smarttab = true,   --set tabs for a shifttabs logic
}

for k, v in pairs(options) do
  opt[k] = v
end

-- global value will be nil inside local scopes.(must be set outside.)
opt.whichwrap:append "<>[]hl" -- go to previous/next line with h,l,left
opt.shortmess:append "sI" -- Disable nvim intro
opt.updatetime = 50 -- (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.

--vim.cmd[[color slate]]
vim.cmd[[color desert]]
-- guibg=none set the default colorscheme's background (set after colorscheme)
--vim.cmd([[highlight WinSeparator guibg=none]])
vim.api.nvim_set_hl(0, "WinSeparator", { guibg=none }) -- getting crispy sharp line while splitting screens.
vim.api.nvim_set_hl(0, "SignColumn", { guibg=none })

--vim.cmd([[autocmd ColorScheme * highlight SignColumn guibg=none]])
vim.api.nvim_create_autocmd('ColorScheme', { command = "highlight SignColumn guibg=none | highlight WinSeparator guibg=none" })
