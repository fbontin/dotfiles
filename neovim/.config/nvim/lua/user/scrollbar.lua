local scrollbar_status_ok, scrollbar = pcall(require, "scrollbar")
if not scrollbar_status_ok then
  return
end

local scrollbar_gitsigns_status_ok, scrollbar_gitsigns = pcall(require, "scrollbar.handlers.gitsigns")
if not scrollbar_gitsigns_status_ok then
  return
end

scrollbar.setup()
scrollbar_gitsigns.setup()
