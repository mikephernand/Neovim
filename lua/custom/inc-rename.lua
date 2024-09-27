-- inc-rename.nvim
return {
	"smjonas/inc-rename.nvim",
	config = function()
		require("inc_rename").setup({
			-- You can add any custom configurations here, or leave it empty for default settings
		})

		-- Optional: Create a keybinding to trigger incremental rename
		vim.keymap.set("n", "<leader>rn", function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end, { expr = true })
	end,
}
