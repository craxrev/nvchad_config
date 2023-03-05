local overrides = require "custom.plugins.overrides"

---@type {[PluginName]: NvPluginConfig|false}
local plugins = {

  ["goolord/alpha-nvim"] = { disable = false },

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["nvim-tree/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["nvim-telescope/telescope.nvim"] = {
    module = "telescope",
    override_options = overrides.telescope,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["mrjones2014/smart-splits.nvim"] = {},

  -- ["olimorris/persisted.nvim"] = {
  --   config = function()
  --     require("persisted").setup {
  --       follow_cwd = true,
  --     }
  --   end,
  -- },

  ["rmagatti/auto-session"] = {},

  -- ["rmagatti/session-lens"] = {
  --   requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
  --   config = function()
  --     require("session-lens").setup()
  --   end,
  -- },

  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require("project_nvim").setup()
    end,
  },

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}

return plugins
