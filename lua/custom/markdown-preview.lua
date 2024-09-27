-- ~/local/nvim/lua/custom/markdown-preview.lua

return {
	"iamcco/markdown-preview.nvim",
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	ft = { "markdown" }, -- Load only for markdown files
	config = function()
		-- Additional settings
		vim.g.mkdp_auto_start = 1 -- Automatically start preview when opening markdown
		vim.g.mkdp_browser = "C:/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe" -- Optionally set your preferred browser

		-- Set a keybinding to manually toggle the markdown preview
		vim.api.nvim_set_keymap("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
	end,
}
