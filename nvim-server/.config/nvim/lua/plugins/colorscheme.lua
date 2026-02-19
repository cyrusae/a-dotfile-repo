-- lua/plugins/colorscheme.lua

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,    -- load before everything else
  opts = {
    flavour = "mocha",
    integrations = {
      treesitter = true,
      telescope = { enabled = true },
      lualine = true,
      which_key = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
