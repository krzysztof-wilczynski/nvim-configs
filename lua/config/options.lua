local options = {
	cmdheight = 0, --- Give more space for displaying messages
	completeopt = "menu,menuone,preview", --- Better autocompletion
	clipboard = "unnamed,unnamedplus",
	cursorline = true, --- Highlight of current line
	emoji = false, --- Fix emoji display
	expandtab = true, --- Use spaces instead of tabs
	foldcolumn = "0",
	foldnestmax = 0,
	foldlevel = 99, --- Using ufo provider need a large value
	foldlevelstart = 99, --- Expand all folds by default
	ignorecase = true, --- Needed for smartcase
	laststatus = 3, --- Have a global statusline at the bottom instead of one for each window
	mouse = "a", --- Enable mouse
	number = true, --- Shows current line number
	pumheight = 10, --- Max num of items in completion menu
	relativenumber = false, --- Enables relative number
	scrolloff = 8, --- Always keep space when scrolling to bottom/top edge
	shiftwidth = 2, --- Change a number of space characters inserted for indentation
	showtabline = 1, --- Show tabs if there's more than one
	signcolumn = "yes:2", --- Add extra sign column next to line number
	smartcase = true, --- Uses case in search
	smartindent = true, --- Makes indenting smart
	smarttab = true, --- Makes tabbing smarter will realize you have 2 vs 4
	softtabstop = 2, --- Insert 2 spaces for a tab
	spelllang = { "en", "pl" },
	splitright = true, --- Vertical splits will automatically be to the right
	swapfile = false, --- Swap not needed
	tabstop = 2, --- Insert 2 spaces for a tab
	termguicolors = true, --- Correct terminal colors
	timeoutlen = 200, --- Faster completion (cannot be lower than 200 because then commenting doesn't work)
	undofile = true, --- Sets undo to file
	updatetime = 100, --- Faster completion
	viminfo = "'1000", --- Increase the size of file history
	wildignore = "*node_modules/**", --- Don't search inside Node.js modules (works for gutentag)
	wrap = false, --- Display long lines as just one line
	writebackup = false, --- Not needed
	-- Neovim defaults
	autoindent = true, --- Good auto indent
	backspace = "indent,eol,start", --- Making sure backspace works
	backup = false, --- Recommended by coc
	--- Concealed text is completely hidden unless it has a custom replacement character defined (needed for dynamically showing tailwind classes)
	conceallevel = 2,
	concealcursor = "", --- Set to an empty string to expand tailwind class when on cursorline
	encoding = "utf-8", --- The encoding displayed
	errorbells = false, --- Disables sound effect for errors
	fileencoding = "utf-8", --- The encoding written to file
	incsearch = true, --- Start searching before pressing enter
	showmode = false, --- Don't show things like -- INSERT -- anymore
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Schedule the setting after `UiEnter` casue it can increase startup-time.
-- vim.schedule(function()
-- 	vim.opt.
-- end)

vim.g.markdown_recommended_style = 0
