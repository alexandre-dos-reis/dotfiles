return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lspsaga").setup({})

		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<C-e>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_diagnostic<CR>", opts)
		vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
		vim.keymap.set("n", "gd", "<Cmd>Lspsaga finder<CR>", opts)
		-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
		vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
		vim.keymap.set("n", "<Leader>rn", "<Cmd>Lspsaga rename<CR>", opts)

		local codeaction = require("lspsaga.codeaction")
		vim.keymap.set("n", "<leader>ca", function()
			codeaction:code_action()
		end, { silent = true })
		vim.keymap.set("v", "<leader>ca", function()
			vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
			codeaction:range_code_action()
		end, { silent = true })
	end,
}
