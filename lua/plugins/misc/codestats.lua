return {
  "liljaylj/codestats.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "TextChanged", "InsertEnter" },
  cmd = { "CodeStatsXpSend", "CodeStatsProfileUpdate" },
  config = function()
    require("codestats").setup({
      username = os.getenv("CS_USERNAME"),
      base_url = "https://codestats.net",
      api_key = os.getenv("CS_API_KEY"),
      send_on_exit = true,
      send_on_timer = true,
      timer_interval = 60000,
      curl_timeout = 5,
    })
  end,
}
