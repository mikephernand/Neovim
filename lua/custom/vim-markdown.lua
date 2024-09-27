-- ~local/nvim/lua/custom/vim-markdown.lua

return {
	"plasticboy/vim-markdown",
	ft = { "markdown" },
	config = function()
		vim.g.vim_markdown_auto_insert_bullets = 1 -- Auto-insert list bullets
		vim.g.vim_markdown_math = 1 -- Enable LaTeX math support
		vim.g.vim_markdown_strikethrough = 1 -- Enable strikethrough text

		-- Map fenced code block languages to Neovim syntax highlighting
		vim.g.vim_markdown_fenced_languages = {
			"js=javascript",
			"py=python",
			"c=c",
			"cpp=cpp",
			"cs=csharp",
			"java=java",
			"html=html",
			"css=css",
			"bash=sh",
			"json=json",
			"yaml=yaml",
			"rb=ruby",
			"php=php",
			"go=go",
			"rs=rust",
		}
	end,
}
