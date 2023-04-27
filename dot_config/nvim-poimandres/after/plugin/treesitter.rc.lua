local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "typescript",
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
    "lua",
    "astro"
  },
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- enable fold
-- https://unix.stackexchange.com/questions/141097/how-to-enable-and-use-code-folding-in-vim
--
-- zo opens a fold at the cursor.
-- zShift+o opens all folds at the cursor.
-- zc closes a fold at the cursor.
-- zm increases the foldlevel by one.
-- zShift+m closes all open folds.
-- zr decreases the foldlevel by one.
-- zShift+r decreases the foldlevel to zero -- all folds will be open.
--
vim.o.foldmethod = "expr"
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = false
