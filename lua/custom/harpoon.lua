-- ~/.config/nvim/lua/custom/harpoon.lua
return {
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({
				-- Example config settings for Harpoon
				menu = {
					width = vim.api.nvim_win_get_width(0) - 20,
				},
				global_settings = {
					save_on_toggle = false, -- Don't auto-save on toggle
					save_on_change = true, -- Auto-save when making changes
					enter_on_sendcmd = true, -- Automatically enter terminal on sending a command
				},
			})

			-- Optional key mappings for ease of use
			vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
			vim.keymap.set("n", "<leader>hm", require("harpoon.ui").toggle_quick_menu)
			vim.keymap.set("n", "<leader>h1", function()
				require("harpoon.ui").nav_file(1)
			end)
			vim.keymap.set("n", "<leader>h2", function()
				require("harpoon.ui").nav_file(2)
			end)
			vim.keymap.set("n", "<leader>h3", function()
				require("harpoon.ui").nav_file(3)
			end)
			vim.keymap.set("n", "<leader>h4", function()
				require("harpoon.ui").nav_file(4)
			end)
		end,
		-- Optional lazy loading
		keys = { "<leader>ha", "<leader>hm", "<leader>h1", "<leader>h2", "<leader>h3", "<leader>h4" },
	},
}
