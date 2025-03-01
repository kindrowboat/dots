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

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  -- Install NERDTree
  use {
    'preservim/nerdtree',
    config = function()
      -- Keybinding to toggle NERDTree
      vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
    end
  }

  -- Install vim-devicons for file icons
  use 'ryanoasis/vim-devicons'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- General settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative numbers
vim.opt.tabstop = 4           -- Number of spaces tabs count for
vim.opt.shiftwidth = 4        -- Size of an indent
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.smartindent = true    -- Enable smart indentation
vim.opt.termguicolors = true  -- Enable 24-bit RGB colors
