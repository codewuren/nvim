-- Automatically install and set up packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Rerun PackerCompile everytime pluggins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  -- My plugins here
  -- Let Packer manage itself
  use('wbthomason/packer.nvim')

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    config = function() require('plugins.lualine') end,
  }

  -- Autocomplete
  use({
    "hrsh7th/nvim-cmp",
    -- Sources for nvim-cmp
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function() require('plugins.cmp') end,
  })

  -- Snippets
  use {"L3MON4D3/LuaSnip", config = function() require('plugins.snippets') end}

  -- lspconfig
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  require('plugins.lspconfig')

  -- Themes
  use ({
    'folke/tokyonight.nvim',
    config = function ()
      require('plugins.themes')
    end})

  -- Startify
  use {'mhinz/vim-startify'}

  -- Nvim Tree
  use ({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function ()
      require('plugins.nvim-tree')
    end
  })

  -- Nvim-highlight-colors
  use ({
    'brenoprata10/nvim-highlight-colors',
    config = function ()
      require('plugins.color-highlight')
    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
