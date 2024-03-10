return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				bash = { { "shfmt", "beautysh" } },
				python = { { "ruff", "isort", "black" } },
				markdown = { "prettier" },
				json = { "prettier" },
				yaml = { { "prettier", "yamlfix" } },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
