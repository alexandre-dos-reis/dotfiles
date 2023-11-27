return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "graphql-language-service-cli",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable default LSP keymaps
      keys[#keys + 1] = { "K", false, mode = "n" }
      keys[#keys + 1] = { "gd", false, mode = "n" }
      keys[#keys + 1] = { "gt", false, mode = "n" }
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    keys = {
      { "gd", "<Cmd>Lspsaga finder<CR>", desc = "Launch Lspsaga finder" },
      { "K", "<Cmd>Lspsaga hover_doc<CR>", desc = "Launch Lspsaga finder" },
      { "gu", "<Cmd>Lspsaga peek_definition<CR>", desc = "Launch Lspsaga peek definition is a small edit window" },
      { "<leader>rn", "<Cmd>Lspsaga rename<CR>", desc = "Lspsaga rename" },
      { "gt", "<Cmd>Lspsaga term_toggle<CR>", desc = "Lspsaga toggle terminal" },
    },
  },
}
