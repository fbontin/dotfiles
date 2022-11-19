local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

local header = {
  type = "text",
  val = {
    --    [[                                            .      //         ]],
    --    [[                                       /) \ |\    //          ]],
    --    [[                                 (\\|  || \)u|   |I     /)    ]],
    --    [[                                  \```.FF  \  \  |J   .'/     ]],
    --    [[                               __  `.  `|   \  `-'J .'.'      ]],
    --    [[        ______           __.--'  `-. \_ J    >.   `'.'   .    ]],
    --    [[    _.-'      ""`-------'           `-.`.`. / )>.  /.' .<'    ]],
    --    [[  .'                                   `-._>--' )\ `--''      ]],
    --    [[  F .                                          ('.--'"        ]],
    --    [[ (_/                                            '\            ]],
    --    [[  \                                             'o`.          ]],
    --    [[  |\                                                `.        ]],
    --    [[  J \          |              /      |                \       ]],
    --    [[   L \                       J       (             .  |       ]],
    --    [[   J  \      .               F        _.--'`._  /`. \_)       ]],
    --    [[    F  `.    |                       /        ""   "'         ]],
    --    [[    F   /\   |_          ___|   `-_.'                         ]],
    --    [[   /   /  F  J `--.___.-'   F  - /                            ]],
    --    [[  /    F  |   L            J    /|                            ]],
    --    [[ (_   F   |   L            F  .'||                            ]],
    --    [[  L  F    |   |           |  /J  |                            ]],
    --    [[  | J     `.  |           | J  | |              ____.---.__   ]],
    --    [[  |_|______ \  L          | F__|_|___.---------'              ]],
    --    [[--'        `-`--`--.___.-'-'---                               ]],

    [[ ^  ^  ^   ^      ___I_      ^  ^   ^  ^  ^   ^  ^ ]],
    [[/|\/|\/|\ /|\    /\-_--\    /|\/|\ /|\/|\/|\ /|\/|\]],
    [[/|\/|\/|\ /|\   /  \_-__\   /|\/|\ /|\/|\/|\ /|\/|\]],
    [[/|\/|\/|\ /|\   |[]| [] |   /|\/|\ /|\/|\/|\ /|\/|\]],
  },
  opts = {
    position = "center",
    hl = "String",
  },
}

local buttons = {
  type = "group",
  val = {
    { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
    { type = "padding", val = 1 },
    dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
  },
}

local top_padding = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) })

local config = {
  layout = {
    { type = "padding", val = top_padding },
    header,
    { type = "padding", val = 2 },
    buttons,
  },
}

alpha.setup(config)
