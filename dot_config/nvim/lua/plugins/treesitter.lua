return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "astro",
      "cmake",
      "css",
      "scss",
      "fish",
      "gitignore",
      "go",
      "graphql",
      "http",
      "php",
      "rust",
      "sql",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- Mdx
    vim.filetype.add({
      extension = {
        mdx = "mdx",
      },
    })
    vim.treesitter.language.register("markdown", "mdx")
  end,
}