-- Drzewo plików

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    config = function()
      require("neo-tree").setup({
        window = {
          position = "right",
          width = 40,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
            ["q"] = "close_window",
            ["s"] = "open_split",
            ["v"] = "open_vsplit",
            ["o"] = "system_open",
            ["<space>"] = "noop",             -- wyłącz toggle spacją
          },
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false,
            hide_by_name = {
              "node_modules", ".git"
            },
            always_show = {
              "package.json", "README.md", ".env"
            },
          },
          use_libuv_file_watcher = false,
          open_file_on_create = true,
        },
        commands = {
          system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            local sysname = vim.loop.os_uname().sysname

            if sysname == "Windows_NT" then
              -- Otwórz plik lub folder w domyślnej aplikacji Windows
              vim.fn.jobstart({ "cmd.exe", "/C", "start", "", path }, { detach = true })
            else
              -- Zakładamy Linux (xdg-open)
              vim.fn.jobstart({ "xdg-open", path }, { detach = true })
            end
          end,
        },
      })
    end,
  },
}
