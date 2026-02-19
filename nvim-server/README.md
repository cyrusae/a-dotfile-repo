nvim-server/
├── init.lua
└── lua/
    ├── config/
    │   ├── lazy.lua        # bootstraps lazy.nvim
    │   ├── keymaps.lua     # leader=space, telescope bindings, window nav
    │   └── options.lua     # line numbers, indentation, etc.
    └── plugins/
        ├── colorscheme.lua # catppuccin mocha
        ├── editing.lua     # which-key, Comment.nvim, autopairs
        ├── lualine.lua     # statusline with relative path shown
        ├── telescope.lua   # fuzzy finder, hidden files on by default
        └── treesitter.lua  # highlighting for yaml/bash/lua/json/dockerfile