return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    filetypes = { "*" },
    user_default_options = {
      mode = "background",
      RGB = true,
      RRGGBB = true,
      rgb_fn = true,
      hsl_fn = true,
      names = false,
    },
  },
}
