-- Podświetlanie składni
return {
   "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",

  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua", "javascript", "bash", 
        "css", "csv", "dockerfile", 
        "graphql", "html", "http", 
        "json", "markdown", "python", 
        "scss", "sql", "typescript", 
        "vue", "yaml"
      },
      highlight = {enable = true},
      indent = {enable = true},
    })
  end
}
