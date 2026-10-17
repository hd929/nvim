M = {}

local uis = vim.api.nvim_list_uis()
local ui_height = (uis and uis[1]) and uis[1].height or (vim.o.lines or 24)
local ui_width = (uis and uis[1]) and uis[1].width or (vim.o.columns or 80)

M.user_config = {
  width = 40,
  height = 10,
  style = "minimal",
  border = "rounded",
  -- anchor = "NW",
  -- TODO: fine a good way to center in window later
  -- relative = "win",
  relative = "editor",
  row = math.floor((ui_height / 2) - (10 / 2)),
  col = math.floor((ui_width / 2) - (40 / 2)),
}

M.openOptions = {
  window = "b %s",
  vsplit = "vert sb %s",
  hsplit = "sb %s",
}

-- vim extend table
-- vim.tbl_extend(M.config, M.openOptions)

return M
