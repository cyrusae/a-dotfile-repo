-- init.lua -- nvim-server config
-- Minimal nvim for server use. No LSP, no Mason, no completion.
-- Plugins: catppuccin, lualine, treesitter (highlighting only),
--          telescope, which-key, comment, autopairs.
-- See full LazyVim config on Astraeus for dev work.

require("config.options")
require("config.keymaps")
require("config.lazy")
