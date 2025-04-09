return {
	"saghen/blink.cmp",
	lazy = false,
	version = "v0.*",

	dependencies = {
		{
			"saghen/blink.compat",
			opts = { impersonate_nvim_cmp = true },
		},
		"rafamadriz/friendly-snippets",
		-- "echasnovski/mini.snippets",
		-- "Exafunction/codeium.nvim",
	},

	opts = {
		-- C-space -> open menu/docs
		-- C-e -> hide
		-- C-k -> toggle signature help
		-- C-y -> accept
		-- C-n -> next (down)
		-- C-p -> previous (up)

		keymap = { preset = "default" },
		snippets = {
			preset = "default",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			-- providers = {
			-- 	lsp = {
			-- 		name = "lsp",
			-- 		enabled = true,
			-- 		module = "blink.cmp.sources.lsp",
			-- 		fallbacks = { "snippets", "buffer" },
			-- 		score_offset = 90,
			-- 	},
			-- 	path = {
			-- 		name = "path",
			-- 		module = "blink.cmp.sources.path",
			-- 		score_offset = 25,
			-- 		fallbacks = { "snippets", "buffer" },
			-- 		opts = {
			-- 			trailing_slash = false,
			-- 			label_trailing_slash = true,
			-- 			get_cwd = function(context)
			-- 				return vim.fn.expand("#%d:p:h").format(context.bufnr)
			-- 			end,
			-- 			show_hidden_files_by_default = true,
			-- 		},
			-- 	},
			-- 	snippets = {
			-- 		name = "snippets",
			-- 		enabled = true,
			-- 		max_items = 8,
			-- 		min_keyword_length = 2,
			-- 		module = "blink.cmp.sources.snippets",
			-- 		score_offset = 85,
			-- 	},
			-- },
		},
		completion = {
			trigger = {
				show_on_trigger_character = true,
				show_on_insert_on_trigger_character = true,
				show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
			},
			menu = {
				auto_show = true,
				border = "rounded",
				draw = {
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
					treesitter = {},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = {
					border = "rounded",
				},
			},
			list = { selection = { preselect = false, auto_insert = true } },
			ghost_text = {
				enabled = true,
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		signature = { enabled = true, window = { border = "rounded" } },
	},
	opts_extend = { "sources.default" },

	appearance = {
		kind_icons = {
			Boolean = "[] Boolean",
			Character = "[] Character",
			Class = "[] Class",
			Color = "[] Color",
			Constant = "[] Constant",
			Constructor = "[] Constructor",
			Enum = "[] Enum",
			EnumMember = "[] EnumMember",
			Event = "[ﳅ] Event",
			Field = "[] Field",
			File = "[] File",
			Folder = "[ﱮ] Folder",
			Function = "[ﬦ] Function",
			Interface = "[] Interface",
			Keyword = "[] Keyword",
			Method = "[] Method",
			Module = "[] Module",
			Number = "[] Number",
			Operator = "[Ψ] Operator",
			Parameter = "[] Parameter",
			Property = "[ﭬ] Property",
			Reference = "[] Reference",
			Snippet = "[] Snippet",
			String = "[] String",
			Struct = "[ﯟ] Struct",
			Text = "[] Text",
			TypeParameter = "[] TypeParameter",
			Unit = "[] Unit",
			Value = "[] Value",
			Variable = "[ﳛ] Variable",
			Copilot = "",
		},
	},
}
