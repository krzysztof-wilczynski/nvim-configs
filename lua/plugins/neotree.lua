-- Drzewo plików
return {
	-- Współpraca operacji na plikach z LSP (update importów itd.)
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},

		config = function()
			vim.keymap.set("n", "<leader>n", ":Neotree right toggle<CR>", { desc = "Pokaż/ukryj drzewo plików" })

			require("neo-tree").setup({
				window = {
					position = "right",
					width = 40,
					mapping_options = {
						noremap = true,
						nowait = true,
					},
					mappings = {
						["l"] = "open",
						["h"] = "close_node",

						-- disable toggling with space
						["<space>"] = "noop",
					},
				},
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_hidden = false,
						hide_by_name = {
							"node_modules",
						},
					},
				},
			})
		end,
	},
}
