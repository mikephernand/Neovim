--  ~/local/nvim/lua/custom/mini-hipatterns.lua
return {
	{
		"echasnovski/mini.hipatterns",
		config = function()
			require("mini.hipatterns").setup({
				-- add custom patterns here
				highlighters = {
					fixme = { pattern = "FIXME", group = "ErrorMsg" },
					todo = { pattern = "TODO", group = "WarningMsg" },
				},
			})
		end,
	},
}
