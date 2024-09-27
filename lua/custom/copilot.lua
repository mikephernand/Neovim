-- ~/local/nvim/lua/custom/copilot.lua

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = { enabled = true },
			panel = { enabled = true },
			-- Additional configuration can go here
		})
		-- Keybinding for accepting copilot suggestions
		vim.api.nvim_set_keymap("i", "<C-j>", "copilot#Accept('<CR>')", { silent = true, expr = true })
		-- Keybind for dismissing suggestion
		vim.api.nvim_set_keymap("i", "<C-k>", "copilot#Dismiss()", { silent = true, expr = true })
		-- Next and previous suggestion
		vim.api.nvim_set_keymap("i", "<C-n>", "copilot#Next()", { silent = true, expr = true })
		vim.api.nvim_set_keymap("i", "<C-p>", "copilot#Previous()", { silent = true, expr = true })
		-- Trigger Copilot manually
		vim.api.nvim_set_keymap("i", "<C-l>", ":Copilot<CR>", { silent = true, noremap = true })
		-- Toggle Copilot
		vim.api.nvim_set_keymap("n", "<C-t>", ":Copilot toggle<CR>", { silent = true, noremap = true })
		-- Panel (Copilot documentation)
		vim.api.nvim_set_keymap("i", "<C-Space>", "copilot#Panel()", { silent = true, expr = true })
	end,
}
