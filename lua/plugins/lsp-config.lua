return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function() end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- configure bash server
		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure docker server
		lspconfig["dockerls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "python" },
		})

		-- configure markdown server
		lspconfig["marksman"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure jsonls server
		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure terraform server
		lspconfig["terraformls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure yaml server
		lspconfig["yamlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure graphql server
		lspconfig["graphql"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
