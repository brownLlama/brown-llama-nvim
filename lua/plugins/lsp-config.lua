return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"yamlls",
					"jsonls",
					"tflint",
					"terraformls",
				},
			})
		end,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilites = capabilities,
			})
			lspconfig.pyright.setup({
				capabilites = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilites = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilites = capabilities,
			})
			lspconfig.tflint.setup({
				capabilites = capabilities,
			})
			lspconfig.terraformls.setup({
				capabilites = capabilities,
			})

			-- Command to toggle inline diagnostics
			vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
				local current_value = vim.diagnostic.config().virtual_text
				if current_value then
					vim.diagnostic.config({ virtual_text = false })
				else
					vim.diagnostic.config({ virtual_text = true })
				end
			end, {})

			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
