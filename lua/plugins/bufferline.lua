return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({})
    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
  end,
}
