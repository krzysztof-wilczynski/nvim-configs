local function lsp_status()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #clients > 0 then
    return " "
        .. table.concat(
          vim.tbl_map(function(c)
            return c.name
          end, clients),
          ", "
        )
  end
  return ""
end

local function venv()
  if vim.env.VIRTUAL_ENV then
    return " " .. vim.fn.fnamemodify(vim.env.VIRTUAL_ENV, ":t")
  elseif vim.env.CONDA_DEFAULT_ENV then
    return " " .. vim.env.CONDA_DEFAULT_ENV
  elseif vim.env.NVM_BIN then
    return " " .. vim.env.NVM_BIN:match("([^/\\]+)$")
  end
  return ""
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "iamvladw/lualine-time.nvim",
    "catppuccin/nvim", -- motyw z magentą i integracją z lualine
  },
  config = function()
    -- Motyw catppuccin z magentą/fioletem
    require("catppuccin").setup({ flavour = "mocha" })
    vim.cmd.colorscheme("catppuccin-mocha")

    require("lualine").setup({
      options = {
        theme = "catppuccin",
        globalstatus = vim.o.laststatus == 3,
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
      },
      sections = {
        lualine_a = {
          { "mode", icon = "", separator = { left = "", right = "" }, right_padding = 2 },
        },
        lualine_b = {
          { "branch", icon = "", separator = { left = "", right = "" }, right_padding = 2 }, -- gałąź gita
          "diff",
          "diagnostics",
        },
        lualine_c = {
          { "filename", path = 1 },
        },
        lualine_x = {
          { lsp_status,  color = { fg = "#a6e3a1" } },
          { "fileformat" },
          { "filetype",  icon_only = true },
        },
        lualine_y = {
          { venv, color = { fg = "#fab387" } },
        },
        lualine_z = {
          { "time", separator = { left = "", right = "" }, right_padding = 2 }, -- zegar
        },
      },
      extensions = { "lazy", "fzf" },
    })
  end,
}
