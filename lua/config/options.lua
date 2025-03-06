local opt = vim.opt

opt.autowrite = true
opt.number = true
-- opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false

-- Schedule the setting after `UiEnter` casue it can increase startup-time.
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

opt.cursorline = true
opt.expandtab = true
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 200
opt.timeoutlen = 300
opt.splitright = true
opt.list = true
opt.ruler = false
opt.shiftwidth = 2
opt.sidescrolloff = 8
opt.spelllang = { "en", "pl" }
opt.wrap = false
opt.winminwidth = 5
opt.wildmode = "longest:full,full"
opt.foldmethod = "expr"
opt.foldtext = ""
-- opt.smoothscroll = true
opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"

vim.g.markdown_recommended_style = 0
