-- BASIC
vim.keymap.set('n', '<leader>x', ':bd | b<CR>', { desc = 'Close current buffer' })

-- NVIM TREE
local api_tree = require 'nvim-tree.api'

vim.keymap.set('n', '<leader>t', api_tree.tree.toggle, { desc = 'Toggle Tree' })
