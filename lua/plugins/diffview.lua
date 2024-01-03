return {
	"sindrets/diffview.nvim",
	config = function()
		vim.keymap.set("n", "<leader>go", ":DiffviewOpen<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>gh", ":DiffviewFileHistory<CR>", { noremap = true, silent = true })
	end,
}
