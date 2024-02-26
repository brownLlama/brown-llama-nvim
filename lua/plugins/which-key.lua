return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.register({
			["<leader>"] = {
				-- Toggle Explorer
				["e"] = { "<cmd>Neotree toggle right<cr>", "Toggle Explorer" },
				-- Markdown Preview
				["m"] = { "<cmd>MPOpen<cr>", "Markdown Preview" },
				-- Exit Nvim
				["q"] = { "<cmd>q<cr>", "Exit" },
				-- Vertical Split
				["v"] = { "<cmd>vsplit<cr>", "Vertical Split" },
				-- Write
				["w"] = { "<cmd>w<cr>", "Write" },
				-- Close & Exit Buffer
				["x"] = { "<cmd>bw<cr>", "Close Buffer" },

				-- Telescope
				f = {
					name = "Telescope", -- Group name for Telescope related commands
					f = { "<cmd>Telescope find_files<cr>", "Find Files" },
					g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
					b = { "<cmd>Telescope buffers<cr>", "Buffers" },
					w = { "<cmd>Telescope grep_string<cr>", "Current Word" },
				},

				-- Git
				g = {
					name = "Git",
					g = { "<cmd>Flog<cr>", "Git Graph" },
					l = { "<cmd>LazyGit<cr>", "LazyGit" },
					b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame Current Line" },
				},

				-- Toggle Options
				t = {
					name = "Toggle Options",
					t = { "<cmd>ToggleTerm<cr>", "Terminal" },
					d = { ":DiagnosticsToggleVirtualText<cr>", "Diagnostics" },
				},

				-- Rotate Windows
				o = {
					name = "Other Features",
					w = { "<cmd>RotateWindows<cr>", "Rotate Windows" },
					l = { ":sil !open <cWORD><cr>", "Open Link" },
				},

				-- CopilotChat
				c = {
					name = "CopilotChat",
					e = { "<cmd>CopilotChatExplain<cr>", "Explain" },
				},

				-- -- Flow
				-- p = {
				--   name = "Flow",
				--   r = { "<cmd>FlowRunFile<cr>", "Run File" },
				--   s = { "<cmd>FlowRunSelected<cr>", "Run Selected" },
				-- },

				-- Neorg
				-- n = {
				--   name = "Neorg",
				--   s = { "<cmd>Neorg sync-parsers<cr>", "Sync Parsers" },
				--   b = { "<cmd>Neorg workspace brownllama<cr>", "brownLlama Workspace" },
				--   d = { "<cmd>Neorg workspace datadice<cr>", "datadice Workspace" },
				-- },
			},
		})

		-- Visual Mode Commands
		wk.register({
			-- CopilotChat
			c = {
				name = "Copilot Chat", -- Display name when pressing <leader>c
				v = { ":CopilotChatVisual ", "Visual Chat", mode = "x" },
				i = { ":CopilotChatInPlace<cr>", "In-place code", mode = "x" },
			},
		}, { mode = "x", prefix = "<leader>" })

		wk.register({
			c = {
				name = "Copilot", -- Optional: gives a name to this group of commands
				c = {
					function()
						local input = vim.fn.input("Copilot Query: ")
						-- Ensure input is not empty before proceeding
						if input ~= "" then
							-- Execute the CopilotChat command with the user's input
							vim.cmd("CopilotChat " .. input)
						end
					end,
					"Copilot Chat",
				},
			},
		}, { prefix = "<leader>" })
	end,
}
