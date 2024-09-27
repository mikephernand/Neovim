return {
	"SirVer/ultisnips",
	config = function()
		-- Configure UltiSnips settings
		vim.g.UltiSnipsExpandTrigger = "<tab>"
		vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
		vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
	end,
}
