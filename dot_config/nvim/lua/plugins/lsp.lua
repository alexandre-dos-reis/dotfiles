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
        "marksman",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- https://www.lazyvim.org/plugins/lsp
      -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/keymaps.lua
      -- https://github.com/LazyVim/LazyVim/issues/893

      -- keys[#keys + 2] = { "<leader>cr", false }
      -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/keymaps.lua#L42C3-L55C6
      if require("lazyvim.util").has("inc-rename.nvim") then
        keys[#keys + 1] = {
          "<leader>rn",
          function()
            local inc_rename = require("inc_rename")
            return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
          end,
          expr = true,
          desc = "Rename",
          has = "rename",
        }
      else
        keys[#keys + 1] = { "<leader>rn", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
      end

      keys[#keys + 1] = {
        "gd",
        function()
          require("telescope.builtin").lsp_definitions({
            jump_type = "tab",
          })
        end,
        desc = "Goto Definition (new tab)",
        has = "definition",
      }
      keys[#keys + 1] = { "gt", false, mode = "n" }
    end,
  },
}
