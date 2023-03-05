---@type MappingsConfig
local M = {}

M.disabled = {
  t = {
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },
  n = {
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
    ["<leader>h"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- neovide fullscreen toggle mapping
    ["<F11>"] = {
      function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
      end,
      "toggle neovide fullscreen",
    },

    ["<leader>t"] = { ":tabnew <CR>", "next tab" },
    ["<leader>l"] = { ":tabnext <CR>", "next tab" },
    ["<leader>h"] = { ":tabprevious <CR>", "previous tab" },
  },
}

M.nvterm = {
  t = {
    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<A-b>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },
  n = {
    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<A-b>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },
}

M.lspconfig = {
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "lsp code_action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "lsp references",
    },

    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },

    ["d]"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "list workspace folders",
    },
  },
}

M.smartsplits = {
  n = {
    ["<A-h>"] = { require("smart-splits").resize_left, "resize left" },
    ["<A-j>"] = { require("smart-splits").resize_down, "resize down" },
    ["<A-k>"] = { require("smart-splits").resize_up, "resize up" },
    ["<A-l>"] = { require("smart-splits").resize_right, "resize right" },

    ["<C-h>"] = { require("smart-splits").move_cursor_left, "move left (smart)" },
    ["<C-j>"] = { require("smart-splits").move_cursor_down, "move down (smart)" },
    ["<C-k>"] = { require("smart-splits").move_cursor_up, "move up (smart)" },
    ["<C-l>"] = { require("smart-splits").move_cursor_right, "move right (smart)" },

    ["<leader><leader>h"] = { require("smart-splits").swap_buf_left, "swap buf left" },
    ["<leader><leader>j"] = { require("smart-splits").swap_buf_down, "move buf down" },
    ["<leader><leader>k"] = { require("smart-splits").swap_buf_up, "move buf up" },
    ["<leader><leader>l"] = { require("smart-splits").swap_buf_right, "move buf right" },
  },
}

M.autosession = {
  n = {
    ["<A-r>"] = { ":RestoreSession <CR>", "load session" },
    ["<A-s>"] = { ":SaveSession <CR>", "save session" },
    ["<A-d>"] = { ":DeleteSession <CR>", "delete session" },
  },
}

M.project = {
  n = {
    ["<leader>p"] = {
      function()
        vim.cmd "silent! bufdo! bwipeout"
        vim.cmd "Telescope projects"
      end,
      "recent project",
    },
  },
}

return M
