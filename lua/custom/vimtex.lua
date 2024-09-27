return {
	"lervag/vimtex",
	config = function()
		-- Configure vimtex settings
		vim.g.vimtex_view_method = "general"
		vim.g.vimtex_view_general_viewer = "SumatraPDF"
		vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
		vim.g.vimtex_compiler_method = "latexmk" -- Default compiler
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_quickfix_mode = 0
		vim.opt.concealcursor = "nc"
		vim.o.conceallevel = 2
		vim.g.tex_conceal = "abdmg"
		-- Keybind for VimtexCompile
		vim.keymap.set("n", "<leader>lc", "<cmd>VimtexCompile<CR>", { noremap = true, silent = true })
	end,
}
