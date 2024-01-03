return {
	"rbong/vim-flog",
	--lazy = true,
	--cmd = { "Flog", "Flogsplit", "Floggit" },
	dependencies = {
		"tpope/vim-fugitive",
	},
	config = function()
		vim.keymap.set("n", "<leader>gg", ":Flog<CR>", { noremap = true, silent = true })
	end,
}
