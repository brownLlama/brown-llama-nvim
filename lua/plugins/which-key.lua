return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        -- Toggle Explorer
        ["e"] = { "<cmd>Neotree toggle right<cr>", "Toggle Explorer" },
        -- Markdown Preview
        ["m"] = { "<cmd>MPOpen<cr>", "Markdown Preview" },
        -- Exit Nvim
        ["q"] = { "<cmd>q<cr>", "Exit" },
        -- ToggleTerm
        ["t"] = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
        -- Vertical Split
        ["v"] = { "<cmd>vsplit<cr>", "Vertical Split" },
        -- Write
        ["w"] = { "<cmd>w<cr>", "Write" },
        -- Close & Exit Buffer
        ["x"] = { "<cmd>bw<cr>", "Close Buffer" },

        -- Telescope
        f = {
          name = "Telescope", -- Group name for Telescope related commands
          f = { "<cmd>Telescope find_files<cr>", "Find Files" },
          g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
          b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        },

        -- Git
        g = {
          name = "Git",
          g = { "<cmd>Flog<cr>", "Git Graph" },
          l = { "<cmd>LazyGit<cr>", "LazyGit" },
        },

        -- Neorg
        n = {
          name = "Neorg",
          s = { "<cmd>Neorg sync-parsers<cr>", "Sync Parsers" },
          b = { "<cmd>Neorg workspace brownllama<cr>", "brownLlama Workspace" },
          d = { "<cmd>Neorg workspace datadice<cr>", "datadice Workspace" },
        },
      },
    })
  end,
}
