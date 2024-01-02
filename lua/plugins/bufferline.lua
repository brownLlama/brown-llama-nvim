return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({})
    vim.keymap.set("n", "<S-h>", ":BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<S-l>", ":BufferLineCyclePrev<CR>")
  end,
}
