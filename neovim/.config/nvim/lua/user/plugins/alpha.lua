return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local header = {
      type = "text",
      val = "(◕ᴥ◕)",
      opts = { position = "center" },
    }
    local buttons = {
      type = "group",
      val = {
        { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("s", " " .. " Git status", ":Telescope git_status<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      },
    }

    local config = {
      layout = {
        { type = "padding", val = 2 },
        header,
        { type = "padding", val = 2 },
        buttons,
      },
    }

    alpha.setup(config)
  end,
}
