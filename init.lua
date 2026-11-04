if vim.fn.has "win32" == 1 then
  local mingw_bin = vim.fn.expand "$LOCALAPPDATA/Microsoft/WinGet/Packages/BrechtSanders.WinLibs.POSIX.UCRT_Microsoft.Winget.Source_8wekyb3d8bbwe/mingw64/bin"
  if vim.fn.isdirectory(mingw_bin) == 1 and not string.find(vim.env.PATH or "", mingw_bin, 1, true) then
    vim.env.PATH = mingw_bin .. ";" .. (vim.env.PATH or "")
  end
  vim.env.CC = "gcc"
end

require "user.options"
require "user.keymaps"
require "user.autocommands"
require "user.plugins"
