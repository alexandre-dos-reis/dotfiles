return {
	"dinhhuy258/git.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("git").setup({
			blame = "<Leader>gb",
			browse = "<Leader>gb",
		})
	end,
}
