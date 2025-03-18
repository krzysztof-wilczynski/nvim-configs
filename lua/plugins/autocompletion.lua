local function lspkind_config()
	local lspKindConfig = require("lspkind")
	lspKindConfig.init({
		symbol_map = {
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
	})
end

local border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Exafunction/codeium.nvim",
		{ "onsails/lspkind.nvim", config = lspkind_config },
	},

	version = "v0.*",

	opts = {
		snippets = {},
		-- C-space -> open menu/docs
		-- C-e -> hide
		-- C-k -> toggle signature help
		-- C-y -> accept
		-- C-n -> next (down)
		-- C-p -> previous (up)
		keymap = { preset = "default" },

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
				"pypi",
				-- "codeium",
			},
			providers = {
				pypi = {
					name = "PyPi",
					module = "py-requirements.integrations.blink",
					fallback = { "lsp" },
				},
			},
			-- providers = {
			-- 	codeium = {
			-- 		module = "codeium",
			-- 		name = "Codeium",
			-- 		score_offset = 100,
			-- 		async = true,
			-- },
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
				border = border_chars,
				draw = {
					components = {
						kind_icon = {
							text = function(ctx)
								return require("lspkind").symbolic(ctx.kind, {
									mode = "symbol",
									preset = "codicons",
								})
							end,
						},
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				window = {
					border = border_chars,
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

		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
