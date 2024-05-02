local Utils = require ('utils')

local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local map = vim.api.nvim_set_keymap

-- Mappings
nnoremap("tt", "<Cmd>NvimTreeOpen<CR>")
vim.g.mapleader = ';'
map('n', '<leader>', ':', {})

