local status_ok, snacks = pcall(require, "snacks")
if not status_ok then
  return
end

local icons = require "user.icons"

snacks.setup {
  bigfile = { enabled = true },
  dashboard = {
    enabled = true,
    preset = {
      header = [[
                               __                
  ___     ___    ___   __  __ /\_\    ___ ___    
 / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  
/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\
 \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      keys = {
        { icon = icons.documents.File .. " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = icons.ui.NewFile .. " ", key = "e", desc = "New File", action = ":ene | startinsert" },
        { icon = icons.git.Repo .. " ", key = "p", desc = "Find Project", action = ":Telescope projects" },
        { icon = icons.ui.History .. " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = icons.ui.List .. " ", key = "t", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = icons.ui.Gear .. " ", key = "c", desc = "Configuration", action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })" },
        { icon = icons.ui.SignOut .. " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
      {
        text = {
          { "Full xì nách", hl = "Type" },
        },
        align = "center",
        padding = 1,
      },
    },
  },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  input = { enabled = true },
  picker = { enabled = true },
  scroll = { enabled = true },
  words = { enabled = true },
  lazygit = { enabled = true },
  bufdelete = { enabled = true },
}
