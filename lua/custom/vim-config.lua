vim.wo.colorcolumn = '88'
vim.wo.wrap = false

-- Default indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.o.expandtab = true

-- For sql files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql', 'yml', 'yaml' },
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
})
