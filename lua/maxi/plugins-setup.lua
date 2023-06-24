local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -- required by many nvim plugins
  use("nvim-lua/plenary.nvim")

  -- nice, smooth colorscheme
  use({ 'rose-pine/neovim', as = 'rose-pine', })

  -- maximizes and restores current window
  use("szw/vim-maximizer")

  -- tabline
  use("crispgm/nvim-tabline")

  -- the essentials
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")

  -- auto-pairs
  use("windwp/nvim-autopairs")

  -- commenting with gc
  use("numToStr/Comment.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- fuzzy finder
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- git
  use("lewis6991/gitsigns.nvim")

  -- autocompletion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- LSP support
  use("neovim/nvim-lspconfig")
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- LSP servers
  use("jose-elias-alvarez/typescript.nvim")

  use("github/copilot.vim")

  -- formatting
  use("jose-elias-alvarez/null-ls.nvim")

  -- astro
  use("wuelnerdotexe/vim-astro")

  -- cosmic ui
  use("MunifTanjim/nui.nvim")
  use("CosmicNvim/cosmic-ui")

  -- tree-sitter <3
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  -- context
  use('nvim-treesitter/nvim-treesitter-context')

  -- tmux
  use("alexghergh/nvim-tmux-navigation")

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
