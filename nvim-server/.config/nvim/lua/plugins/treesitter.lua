-- lua/plugins/treesitter.lua
-- Highlighting only -- no LSP, no refactoring, no textobjects.
-- Parsers relevant to server work: YAML, TOML, bash, lua, json, dockerfile.

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "yaml",       -- K3s configs, Ansible, Helm, Kubernetes manifests
      "toml",       -- Cargo.toml and other config files
      "bash",       -- shell scripts
      "lua",        -- this config
      "json",       -- JSON logs, API responses
      "dockerfile", -- Dockerfiles
      "markdown",   -- README, docs
      "python",     -- occasional scripts
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
