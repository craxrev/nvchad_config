local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local opt = vim.opt
local g = vim.g

opt.relativenumber = true
opt.guifont = { "Operator Mono SSm Lig, monospace", ":h14" }

-- Helper function for transparency formatting
-- local alpha = function()
--   return string.format("%x", math.floor(255 * (g.neovide_transparency_point or 0.8)))
-- end

g.neovide_input_macos_alt_is_meta = true
-- g.neovide_transparency = 0.0
-- g.transparency = 0.8
-- g.neovide_background_color = "#0f1117" .. alpha()

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Close all NvimTrees before saving to session
local group = augroup("PersistedHooks", {})
autocmd({ "User" }, {
  pattern = "PersistedSavePre",
  group = group,
  callback = function()
    pcall(vim.cmd, "tabdo NvimTreeClose")
  end,
})

autocmd({ "User" }, {
  pattern = "PersistedTelescopeLoadPre",
  group = group,
  callback = function()
    -- pcall(vim.cmd, "%bd!")
  end,
})
