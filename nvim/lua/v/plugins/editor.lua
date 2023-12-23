return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
			{
				"nvim-telescope/telescope-file-browser.nvim",
				config = function()
					require("telescope").load_extension("file_browser")
				end,
			},
		},
		version = "*",
		cmd = "Telescope",
		keys = {
			{ "<leader>?", "<cmd>Telescope oldfiles<cr>", desc = "[?] Find recently opened files" },
			{ "<leader><space>", "<cmd>Telescope buffers<cr>", desc = "[ ] Find existing buffers" },
			{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch Files" },
			{
				"<leader>/",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
						winblen = 10,
						previewer = false,
					}))
				end,
				desc = "[/] Fuzzily search in current buffer",
			},
			{ "<leader>sh", require("telescope.builtin").help_tags, desc = "[S]earch [H]elp" },
			{ "<leader>sw", require("telescope.builtin").grep_string, desc = "[S]earch current [W]ord" },
			{ "<leader>sg", require("telescope.builtin").live_grep, desc = "[S]earch by [G]rep" },
			{ "<leader>sd", require("telescope.builtin").diagnostics, desc = "[S]earch [D]iagnostics" },
			{
				"<leader>ff",
				"<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>",
				desc = "[F]ile [F]rowser",
			},
		},
		opts = {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				mappings = {
					n = {
						["<esc><esc>"] = function(...)
							require("telescope.actions").close(...)
						end,
					},
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
						["<esc><esc>"] = require("telescope.actions").close,
					},
				},
			},
			extensions = {
				theme = "ivy",
				hijack_netrw = true,
			},
		},
	},
}
