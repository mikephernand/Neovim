return {
	-- Noice.nvim plugin
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = function(_, opts)
			-- Add the additional lsp_doc_border preset
			opts.presets = opts.presets or {}
			opts.presets.lsp_doc_border = true

			-- Merge with the rest of your configuration
			opts.cmdline = {
				enabled = true, -- enable command-line UI
				view = "cmdline_popup", -- use a popup for the command-line
				format = {
					cmdline = { pattern = "^:", icon = "", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				},
			}

			opts.notify = {
				enabled = true, -- enable notification UI
				view = "mini", -- use a small notification popup
			}

			opts.popupmenu = {
				enabled = true, -- enable popupmenu UI
				backend = "nui", -- use the NUI backend for popups
			}

			opts.lsp = {
				progress = { enabled = true }, -- enable LSP progress
				hover = { enabled = true }, -- enable LSP hover popup
				signature = { enabled = true }, -- enable LSP signature help
				message = { enabled = true }, -- enable LSP messages
			}

			-- Existing routes
			opts.routes = {
				{
					filter = { event = "msg_show", kind = "", find = "written" },
					opts = { skip = true },
				},
			}

			-- Add the new route for filtering "No information available" notifications
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})

			opts.presets.bottom_search = true -- make search results show at the bottom
			opts.presets.command_palette = true -- use command palette for command-line
			opts.presets.long_message_to_split = true -- long messages go to a split

			opts.views = {
				mini = {
					position = {
						row = "95%",
						col = "50%",
					},
					size = "auto",
				},
			}

			-- Keymap to dismiss Noice notifications
			vim.api.nvim_set_keymap("n", "<leader>cn", ":Noice dismiss<CR>", { noremap = true, silent = true })
		end,
	},

	-- nvim-notify plugin
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 10000, -- Set the timeout to 10 seconds for notifications
			background_colour = "#2E3440", -- Set a custom background color for transparency
		},
	},
}
