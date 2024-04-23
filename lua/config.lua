-- Visual
vim.o.showtabline        = 1                            -- Always show tabline
vim.o.syntax             = 1
vim.o.termguicolors      = true                         -- Use true colors, required for some plugins
vim.wo.number            = true
vim.wo.relativenumber    = true
vim.wo.cursorline        = true

-- Behavior
vim.o.smartindent        = true
vim.o.expandtab          = true                         -- Convert tabs to spaces.
vim.o.scrolloff          = 12                           -- Minimum offset in lines to screen borders
vim.o.tabstop            = 2
vim.o.softtabstop        = 2
vim.o.shiftwidth         = 2

-- Vim specific
vim.o.fileencoding       = "utf-8"

-- Python providers
local pynvim_env        = os.getenv("HOME").."/.local/bin/pyenv/versions/pynvim/"
vim.g.python3_host_prog = pynvim_env.."/bin/python"
vim.g.black_virtualenv  = pynvim_env

-- Disable inline error messages
vim.diagnostic.config {
  virtual_text = false,
  underline = false,
  signs = true,          -- Keep gutter signs
}

