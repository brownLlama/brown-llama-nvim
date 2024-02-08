-- Plugin to run code snippets in a floating window
return {
  "arjunmahishi/flow.nvim",
  config = function()
    require("flow").setup({
      output = {
        buffer = true,
        size = 80, -- possible values: "auto" (default) OR 1-100 (percentage of screen to cover)
        focused = true,
        modifiable = false,

        window_override = {
          style = "minimal",
        },
      },

      -- add/override the default command used for a perticular filetype
      -- the "%s" you see in the below example is interpolated by the contents of
      -- the file you are trying to run
      -- Format { <filetype> = <command> }
      filetype_cmd_map = {
        python = "python3 <<-EOF\n%s\nEOF",
      },
    })
  end,
}
