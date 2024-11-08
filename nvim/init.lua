-- General settings
vim.o.scrolloff = 8
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.api.nvim_exec('language en_US', true)

-- Set leader key
vim.g.mapleader = " "

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>pv', ':Vex<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':GFiles<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pf', ':Files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':cnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':cprev<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>\'', '<C-^>', { noremap = true })

-- Load files
require('plugins')
require('lsp')

-- Set colorscheme
vim.cmd('colorscheme codedark')
