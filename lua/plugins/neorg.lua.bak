return {
  "nvim-neorg/neorg",
  run = ":Neorg sync-parsers",
  -- tag = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-cmp",
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
        ["core.integrations.nvim-cmp"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              brownllama = "~/notes/brownllama",
              datadice = "~/notes/datadice",
            },
          },
        },
      },
    })
  end,
}
