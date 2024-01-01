return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = { --[[ things you want to change go here]]
		direction = "float",
		vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true }),
	},
}
