return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestions = { enabled = true },
			panel = { enabled = false },
		})
	end,
}
