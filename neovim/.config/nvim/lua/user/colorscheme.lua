vim.cmd("colorscheme tokyonight")

local flavours = { "day", "night" }

vim.api.nvim_create_user_command("Tokyonight", function(inp)
  if not vim.tbl_contains(flavours, inp.args) then
    vim.notify("Tokyonight (error): Invalid arg'" .. "', arg must be 'day', 'night'", vim.log.levels.ERROR)
    return
  end
  if inp.args == "day" then
    vim.cmd("colorscheme tokyonight-day")
  end
  if inp.args == "night" then
    vim.cmd("colorscheme tokyonight")
  end
end, {
  nargs = 1,
  complete = function(line)
    return vim.tbl_filter(function(val)
      return vim.startswith(val, line)
    end, flavours)
  end,
})
