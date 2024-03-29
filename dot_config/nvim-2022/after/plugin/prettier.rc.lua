local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup {
  bin = "prettierd",
  filetypes = {
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "markdown",
    "mdx",
    "yaml",
    "yml",
    "schema"
  }
}
