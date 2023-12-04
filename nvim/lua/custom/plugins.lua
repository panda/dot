local plugins = {

  --- github.com/williamboman/mason
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        "rust-analyzer",
      },
    }
  },

  --- github.com/nvim-lspconfig (local overwrite)
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
    end,
  },

  --- github.com/rust-lang/rust.vim
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end,
  },

  --- github.com/simrat39/rust-tools.nvim (debugger)
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",

    opts = function ()
      return require "custom.configs.rust-tools"
    end,

    config = function (_, opts)
      require('rust-tools').setup(opts)
    end,
  },

  --- github.com/mfussenegger/nvim-dap
  {
    "mfussenegger/nvim-dap",
  },

  --- github.com/saecki/crates.nvim
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function (_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  --- github.com/hrsh7th/nvim-cmp (local overwrite)
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      local M = require("plugins.configs.cmp")
      table.insert(M.sources, {name = "crates"})
    end,
  }
}

return plugins
