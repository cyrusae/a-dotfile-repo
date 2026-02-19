-- lua/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      -- Catppuccin-friendly prompt
      prompt_prefix = "  ",
      selection_caret = " ",
      -- Show hidden files (useful on servers -- dotfiles, .kube, etc.)
      file_ignore_patterns = { ".git/" },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  },
}
