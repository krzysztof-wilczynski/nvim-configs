local present, wk = pcall(require, "which-key")
if not present then
	return
end

wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions text_objects = false, -- help for text objects triggered after entering an operator
			windows = false, -- default bindings on <c-w>
			nav = false, -- misc bindings to work with windows
			z = false, -- bindings for folds, spelling and others prefixed with z
			g = false, -- bindings for prefixed with g
		},
	},
	preset = "helix",
	spec = {
		{
			mode = { "n", "v" },
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	win = {
		border = "rounded", -- none, single, double, shadow, rounded
		padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
	},
	-- layout = {
	-- 	height = { min = 4, max = 50 }, -- min and max height of the columns
	-- 	width = { min = 20, max = 25 }, -- min and max width of the columns
	-- 	spacing = 4, -- spacing between columns
	-- 	align = "left", -- align columns left, center or right
	-- },
	show_help = true, -- show help message on the command line when the popup is visible
})

-- single
wk.add({
	{
		"<leader>?",
		function()
			wk.show({ global = true })
		end,
		desc = "Wyświetl wszystkie skróty",
	},
	{ "<leader>q", desc = "Pokaż quickfixy" },
  { "<leader>cc", ":EslintFixAll<CR>", desc="Eslint Fix All"}
})

-- Neotest
local neotest = require("neotest")

wk.add({
	{ "<leader>t", group = "Tests" },
	{
		"<leader>tt",
		function()
			neotest.run.run()
		end,
		desc = "Uruchom test",
	},
	{
		"<leader>tf",
		function()
			neotest.run.run(vim.fn.expand("%"))
		end,
		desc = "Uruchom wszystkie testy w pliku",
	},
	{
		"<leader>to",
		function()
			neotest.output.toggle()
		end,
		desc = "Pokaż output",
	},
	{
		"<leader>ts",
		function()
			neotest.summary.toggle()
		end,
		desc = "Pokaż strukturę testów",
	},
	{
		"<leader>td",
		function()
			neotest.diagnostic.toggle()
		end,
		desc = "Pokaż błędy testów",
	},
	{
		"<leader>tc",
		function()
			neotest.status.toggle()
		end,
		desc = "Pokaż statusy testów",
	},
})
