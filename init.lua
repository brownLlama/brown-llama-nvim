local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- Highlight on yank
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group = vim.api.nvim_create_augroup("highlight_yank", {}),
--   desc = "Hightlight selection on yank",
--   pattern = "*",
--   callback = function()
--     vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
--   end,
-- })

-- Rotate Windows
vim.api.nvim_create_user_command("RotateWindows", function()
  local ignored_filetypes = { "neo-tree", "fidget", "Outline", "toggleterm", "qf", "notify" }
  local window_numbers = vim.api.nvim_tabpage_list_wins(0)
  local windows_to_rotate = {}

  for _, window_number in ipairs(window_numbers) do
    local buffer_number = vim.api.nvim_win_get_buf(window_number)
    local filetype = vim.bo[buffer_number].filetype

    if not vim.tbl_contains(ignored_filetypes, filetype) then
      table.insert(windows_to_rotate, { window_number = window_number, buffer_number = buffer_number })
    end
  end

  local num_eligible_windows = vim.tbl_count(windows_to_rotate)

  if num_eligible_windows == 0 then
    return
  elseif num_eligible_windows == 1 then
    vim.api.nvim_err_writeln("There is no other window to rotate with.")
    return
  elseif num_eligible_windows == 2 then
    local firstWindow = windows_to_rotate[1]
    local secondWindow = windows_to_rotate[2]

    vim.api.nvim_win_set_buf(firstWindow.window_number, secondWindow.buffer_number)
    vim.api.nvim_win_set_buf(secondWindow.window_number, firstWindow.buffer_number)
  else
    vim.api.nvim_err_writeln("You can only swap 2 open windows. Found " .. num_eligible_windows .. ".")
  end
end, {})
