return {
	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			-- Map <leader>lg to LazyGit
			{ "<leader>lg", ":LazyGit<CR>", mode = "n", noremap = true, silent = true },
		},
		config = function()
			-- You can add any additional LazyGit configuration here
		end,
	},
}
