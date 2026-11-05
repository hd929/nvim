if vim.fn.has "win32" == 1 then
  local mingw_bin = vim.fn.expand "$LOCALAPPDATA/Microsoft/WinGet/Packages/BrechtSanders.WinLibs.POSIX.UCRT_Microsoft.Winget.Source_8wekyb3d8bbwe/mingw64/bin"
  if vim.fn.isdirectory(mingw_bin) == 1 and not string.find(vim.env.PATH or "", mingw_bin, 1, true) then
    vim.env.PATH = mingw_bin .. ";" .. (vim.env.PATH or "")
  end
  vim.env.CC = "gcc"
end

-- Fix Neovim 0.12 Nightly race condition where plugins delete already-cleaned augroups (E367: No such group "--Deleted--")
local orig_del_augroup_by_id = vim.api.nvim_del_augroup_by_id
vim.api.nvim_del_augroup_by_id = function(id)
  local ok, err = pcall(orig_del_augroup_by_id, id)
  if not ok and not (type(err) == "string" and err:match "E367") then
    error(err)
  end
end

local orig_del_augroup_by_name = vim.api.nvim_del_augroup_by_name
vim.api.nvim_del_augroup_by_name = function(name)
  local ok, err = pcall(orig_del_augroup_by_name, name)
  if not ok and not (type(err) == "string" and err:match "E367") then
    error(err)
  end
end

require "user.options"
require "user.keymaps"
require "user.autocommands"
require "user.plugins"
