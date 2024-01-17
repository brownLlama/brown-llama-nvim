return {
  "tmillr/sos.nvim",
  enabled = true,
  config = function()
    require("sos").setup({
      save_on_focuslost = true,
      save_on_bufleave = true,
    })
  end,
}
