-- Dolny taskbar

local codestats = require("codestats")

local lvl = function()
	return codestats.get_level(0)
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "iamvladw/lualine-time.nvim",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "dracula",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = {
          statusline = {
            "dashboard",
            "alpha",
            "snacks_dashboard",
            "neo-tree",
          },
        },
      },
      sections = {
        lualine_y = {
          {
            xp,
            fmt = function(s)
              return s and s .. " xp"
            end,
          },
        },
        lualine_z = {
          { "time" },
        },
      },

      extensions = {
        "neo-tree",
        "lazy",
        "fzf",
      },
    })
  end,
}
