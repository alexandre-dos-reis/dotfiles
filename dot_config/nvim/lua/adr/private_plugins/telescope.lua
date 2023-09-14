return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")
			local fb_actions = require("telescope").extensions.file_browser.actions

			require("telescope").setup({
				defaults = {
					mappings = {
						n = {
							["q"] = actions.close,
						},
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
						},
					},
				},
				extensions = {
					file_browser = {
						theme = "dropdown",
						hijack_netrw = true,
						initial_mode = "normal",
						mappings = {
							["i"] = {
								["<C-w>"] = function()
									vim.cmd("normal vbd")
								end,
							},
							["n"] = {
								["h"] = fb_actions.goto_parent_dir,
								["/"] = function()
									vim.cmd("startinsert")
								end,
							},
						},
					},
				},
			})

			require("telescope").load_extension("file_browser")

			vim.keymap.set("n", "<Leader>ff", function()
				builtin.find_files({
					no_ignore = false,
					hidden = true,
				})
			end)

			vim.keymap.set("n", "<Leader>fs", function()
				builtin.live_grep()
			end)

			vim.keymap.set("n", "<Leader>e", function()
				require("telescope").extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = vim.fn.expand("%:p:h"),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = false,
					initial_mode = "normal",
					layout_config = { height = 40 },
				})
			end)
		end,
	},
}
