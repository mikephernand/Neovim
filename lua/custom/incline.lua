-- incline.nvim
return {
	"b0o/incline.nvim",
	config = function()
		require("incline").setup({
			highlight = {
				groups = {
					InclineNormal = { guibg = "#3e4452", guifg = "#abb2bf" },
					InclineNormalNC = { guibg = "#2c323c", guifg = "#abb2bf" },
				},
			},
			window = {
				margin = { vertical = 0, horizontal = 1 },
				zindex = 50,
				padding = { left = 1, right = 1 },
				width = "fit",
				placement = { horizontal = "right", vertical = "top" },
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and " " or ""
				return filename .. modified
			end,
		})
	end,
}
