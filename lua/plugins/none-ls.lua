return {
	"nvimtools/none-ls.nvim", -- configure formatters & linters
	lazy = true,
	-- event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")

		local null_ls = require("null-ls")

		local null_ls_utils = require("null-ls.utils")

		mason_null_ls.setup({
			ensure_installed = {
				"stylua", -- lua formatter
				"prettier", -- prettier formatter
				"terraform_fmt", -- terraform formatter
				"black", -- python formatter
				"isort", -- python formatter
				"shfmt", -- shell formatter
				"pydocstyle", -- python linter
				"flake8", -- python linter
				"ruff", -- python linter
				--"mypy", -- python linter
				"shellcheck", -- shell linter
				"terraform_lint", -- terraform linter
				"jsonlint", -- json linter
				"yamllint", -- yaml linter
			},
		})

		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- configure null_ls
		null_ls.setup({
			-- add package.json as identifier for root (for typescript monorepos)
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			-- setup formatters & linters
			sources = {
				--  to disable file types use
				--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
				formatting.stylua, -- lua formatter
				formatting.prettier, -- js/ts formatter
				formatting.terraform_fmt, -- terraform formatter
				formatting.black, -- python formatter
				formatting.ruff, -- python formatter
				formatting.isort, -- python formatter
				formatting.shfmt, -- shell formatter

				diagnostics.pydocstyle, -- python linter
				diagnostics.flake8, -- python linter
				diagnostics.ruff, -- python linter
				-- diagnostics.mypy, -- python linter
				diagnostics.shellcheck, -- shell linter
				diagnostics.terraform_lint, -- terraform linter
				diagnostics.jsonlint, -- json linter
				diagnostics.yamllint, -- yaml linter
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
