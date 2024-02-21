-- BASIC
vim.keymap.set('n', '<leader>x', ':bd | b<CR>', { desc = 'Close current buffer' })

-- window movement
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to down window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to up window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' })

-- movement from terminal
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w><C-h>', { desc = 'Move to left window' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w><C-j>', { desc = 'Move to down window' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w><C-k>', { desc = 'Move to up window' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w><C-l>', { desc = 'Move to right window' })

-- NVIM TREE
local api_tree = require 'nvim-tree.api'

vim.keymap.set('n', '<leader>t', api_tree.tree.open, { desc = 'Focus Tree' })

-- TOGGLE TERM
-- open ternimal
vim.keymap.set('n', '<A-h>', ':ToggleTerm size=12 direction=horizontal<CR>', { desc = 'Toggle Horizontal Terminal' })
vim.keymap.set('n', '<A-f>', ':ToggleTerm direction=float<CR>', { desc = 'Toggle Floating Terminal' })
vim.keymap.set('n', '<A-v>', ':ToggleTerm size=100 direction=vertical<CR>', { desc = 'Toggle Floating Terminal' })

-- close terminal
vim.keymap.set('t', '<A-h>', '<Esc><C-\\><C-n>:ToggleTerm<CR>', { desc = 'Close terminal' })
vim.keymap.set('t', '<A-v>', '<Esc><C-\\><C-n>:ToggleTerm<CR>', { desc = 'Close terminal' })
vim.keymap.set('t', '<A-f>', '<Esc><C-\\><C-n>:ToggleTerm<CR>', { desc = 'Close terminal' })

-- toggle terminal for lazygit
local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new {
  cmd = 'lazygit',
  dir = 'git_dir',
  direction = 'float',
  float_opts = {
    border = 'double',
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd 'startinsert!'
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd 'startinsert!'
  end,
}

function _Lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<A-g>', '<cmd>lua _Lazygit_toggle()<CR>', { noremap = true, silent = true })
