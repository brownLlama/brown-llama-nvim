return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.terraform_fmt,

				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.pydocstyle,
				null_ls.builtins.diagnostics.ruff,
				null_ls.builtins.diagnostics.flake8,
				null_ls.builtins.diagnostics.mypy,
				-- null_ls.builtins.diagnostics.pylint,

				-- Json
				null_ls.builtins.diagnostics.jsonlint,

				-- YAML
				null_ls.builtins.diagnostics.yamllint,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
		})
	end,
}
