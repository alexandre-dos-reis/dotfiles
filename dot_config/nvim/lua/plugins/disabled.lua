-- disabled lazy default file explorer
return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
  {
    -- disable <Tab> and <C-i> default shortcuts
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
}
