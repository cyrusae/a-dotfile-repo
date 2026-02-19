-- lua/plugins/editing.lua
-- Small quality-of-life plugins with no server-hostile dependencies.

return {
  -- Show pending keybindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      icons = { mappings = false },   -- no nerd font icons needed
    },
  },

  -- Comment toggling (gcc / gc in visual)
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- Auto-close brackets/quotes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
}
