require("victorino.packer")

require("lazy").setup({
  'folke/which-key.nvim',
  { 'folke/neoconf.nvim', cmd = 'Neoconf' },
  'folke/neodev.nvim',
  'nvim-telescope/telescope.nvim', tag = '0.1.3',
  'nvim-lua/plenary.nvim',
  'Mofiqul/dracula.nvim',

  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
	ensure_installed = { "python", "lua", "vim", "vimdoc", "query", "php", "typescript", "json", "markdown", }
    end,
    auto_install = true,
    highlight = {
	enable = true
    },
    indent = {
	enable = true
    }

  },
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  'github/copilot.vim',
  {
    'rebelot/terminal.nvim',
    config = function()
        require("terminal").setup()
    end
  },
  {'neoclide/coc.nvim', branch= 'release'},
  {
    "jackMort/ChatGPT.nvim",
    	event = "VeryLazy",
    	config = function()
      	require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
})

require("victorino.remap")
vim.cmd[[colorscheme dracula]]

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- see :help lsp-zero-guide:integrate-with-mason-nvim
-- to learn how to use mason.nvim with lsp-zero
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  }
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
