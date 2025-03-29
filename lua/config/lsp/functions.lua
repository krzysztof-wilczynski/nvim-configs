local M = {}

function M.format()
	local root_dir = vim.fn.getcwd() -- Adjust this if you have a more accurate way to find the project root
	local eslintrc_json = root_dir .. "/.eslintrc.json"
	local eslintrc_js = root_dir .. "/.eslintrc.js"

	-- Check if eslint LSP is active
	local active_clients = vim.lsp.buf_get_clients()
	local eslint_is_active = false

	for _, client in ipairs(active_clients) do
		if client.name == "eslint" then
			eslint_is_active = true
			break
		end
	end

	if eslint_is_active and (vim.fn.filereadable(eslintrc_json) == 1 or vim.fn.filereadable(eslintrc_js) == 1) then
		vim.cmd("EslintFixAll")
	else
		vim.lsp.buf.format({ async = true })
	end
end

return M
