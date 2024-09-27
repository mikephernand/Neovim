return {
	"ellisonleao/glow.nvim",
	config = function()
		vim.g.glow_border = "rounded" -- Set a rounded border for the preview window
		vim.g.glow_use_pager = true -- Use a pager in glow for long markdown files
		require("glow").setup({
			glow_path = "C:/ProgramData/chocolatey/lib/glow/tools/glow_2.0.0_Windows_x86_64/glow.exe", -- Set the correct path to glow.exe
			border = "solid", -- floating window border config
			width = 80,
			height = 100,
			width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
			height_ratio = 0.7,
		})
	end,
	cmd = "Glow", -- Only load the plugin when you use the :Glow command
	ft = { "markdown" }, -- Load only for markdown files
}
