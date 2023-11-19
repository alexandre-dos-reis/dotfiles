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
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if (not status) then return end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  -----------
  -- START --
  -----------

  -- Theme and UI
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-lualine/lualine.nvim'    -- Statusline
  use 'akinsho/nvim-bufferline.lua'  -- Tabs style

  -- Colorization
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use "norcalli/nvim-colorizer.lua"

  -- Search file, search string, etc...
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- LSP, cmp, etc...
  use "neovim/nvim-lspconfig"           -- Lsp
  use "onsails/lspkind-nvim"            -- VSCode like pictograms
  use "hrsh7th/cmp-buffer"              -- nvim-cmp source for buffer words
  use "hrsh7th/cmp-nvim-lsp"            -- nvim-cmp source for nvim built-in LSP
  use "hrsh7th/nvim-cmp"                -- Completion
  use "L3MON4D3/LuaSnip"                -- Snippet
  use "glepnir/lspsaga.nvim"            -- LSP UIs
  use "jose-elias-alvarez/null-ls.nvim" -- Use Neovim as language server to inject LSP diagnostic, code actions and more
  use "MunifTanjim/prettier.nvim"
  use "williamboman/mason.nvim"         -- Utility for installing lsp, formatter, etc... don't replace invoking lsp in lspconfig.
  use "williamboman/mason-lspconfig.nvim"

  -- Pairs
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use 'dinhhuy258/git.nvim'

  -- Commments
  use "numToStr/Comment.nvim"

  -- tmux & split window nav
  use "christoomey/vim-tmux-navigator"
  use "szw/vim-maximizer"

  -- Session persistance
  use({
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  })

  ---------
  -- END --
  ---------

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
