local nnoremap = require("jeno.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>pl", "<cmd>Lex<CR>")


-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- switch to specific buffers
--vim.cmd([[ nnoremap <silent><Leader>b :ls<Cr>:b<Space> ]])
map('n', '<Leader>b', ':ls<CR>:b')

vim.keymap.set('n', 'Q', function()
  print('Hello')
  vim.cmd([[
  for i in range(1, 9)
    execute 'nnoremap <Leader>'.i.
    \ ' :buffer '.i.'<CR>'
  endfor
  ]])
end, {desc = 'Say hello'})

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Resize splited windows with arrows
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move text up and down
--map("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
--map("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Insert --
-- Press jk fast to exit insert mode 
--map("i", "jk", "<ESC>")

-- Visual --
-- Move highlighted text left and right
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move highlighted text up and down
map("v", "<A-j>", ":move '>+1<CR>gv=gv")
map("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')
-- map('i', '<leader>s', '<C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

map('n', '<leader>x', ':bd<CR>')

map('n', '<C-S-n>', ':bn<CR>')

map('n', '<C-S-p>', ':bp<CR>')
