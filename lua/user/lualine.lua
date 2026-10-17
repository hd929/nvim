local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local cb_status_ok, cb = pcall(require, "colorbuddy.init")
if not cb_status_ok then
  return
end

local colors = cb.colors
local Group = cb.Group
local styles = cb.styles

-- check if value in table
local function contains(t, value)
  for _, v in pairs(t) do
    if v == value then
      return true
    end
  end
  return false
end

local icons = require "user.icons"

local black = "#15161e"
local gray = "#3b4261"
local red = "#f7768e"
local green = "#9ece6a"
local yellow = "#e0af68"
local blue = "#7aa2f7"
local purple = "#bb9af7"
local cyan = "#7dcfff"
local white = "#a9b1d6"
local bg = "#1a1b26"
local fg = "#c0caf5"

vim.api.nvim_set_hl(0, "StatusLine", { fg = fg, bg = bg })
vim.api.nvim_set_hl(0, "SLGitIcon", { fg = yellow, bg = gray })
vim.api.nvim_set_hl(0, "SLBranchName", { fg = fg, bg = gray, bold = false })
vim.api.nvim_set_hl(0, "SLProgress", { fg = purple, bg = gray })
vim.api.nvim_set_hl(0, "SLLocation", { fg = blue, bg = gray })
vim.api.nvim_set_hl(0, "SLIndent", { fg = white, bg = gray })
vim.api.nvim_set_hl(0, "SLTermIcon", { fg = purple, bg = gray })
vim.api.nvim_set_hl(0, "SLFT", { fg = cyan, bg = gray })
vim.api.nvim_set_hl(0, "SLLSP", { fg = gray, bg = bg })
vim.api.nvim_set_hl(0, "SLSep", { fg = gray, bg = bg })
vim.api.nvim_set_hl(0, "SLSeparator", { fg = fg, bg = "NONE", italic = true })
vim.api.nvim_set_hl(0, "SLError", { fg = red, bg = "NONE" })
vim.api.nvim_set_hl(0, "SLWarning", { fg = yellow, bg = "NONE" })

if vim.g.colors_name == "neosolarized" then
  gray = "#002b36"
  bg = "NONE"

  Group.new("StatusLine", colors.none, colors.none, styles.NONE)
  Group.new("StatusLineNC", colors.base3, colors.NONE, styles.NONE)
  Group.new("SLWarning", colors.yellow, colors.none, styles.NONE)
  Group.new("SLError", colors.red, colors.none, styles.NONE)
  Group.new("SLGitIcon", colors.yellow, colors.base03, styles.NONE)
  Group.new("SLBranchName", colors.base3, colors.base03, styles.NONE)
  Group.new("SLProgress", colors.magenta, colors.base03, styles.NONE)

  vim.api.nvim_set_hl(0, "SLLocation", { fg = blue, bg = gray })
  vim.api.nvim_set_hl(0, "SLIndent", { fg = white, bg = gray })
  vim.api.nvim_set_hl(0, "SLTermIcon", { fg = purple, bg = gray })
  vim.api.nvim_set_hl(0, "SLFT", { fg = cyan, bg = gray })
  vim.api.nvim_set_hl(0, "SLLSP", { fg = gray, bg = bg })
  vim.api.nvim_set_hl(0, "SLSep", { fg = gray, bg = "NONE" })
  vim.api.nvim_set_hl(0, "SLSeparator", { fg = fg, bg = "NONE", italic = true })
elseif vim.g.colors_name == "onedark" then
  bg = "#1f2329"
  gray = "#282c34"

  vim.api.nvim_set_hl(0, "StatusLine", { fg = fg, bg = bg })
  vim.api.nvim_set_hl(0, "SLGitIcon", { fg = yellow, bg = gray })
  vim.api.nvim_set_hl(0, "SLBranchName", { fg = fg, bg = gray, bold = false })
  vim.api.nvim_set_hl(0, "SLProgress", { fg = purple, bg = gray })
  vim.api.nvim_set_hl(0, "SLLocation", { fg = blue, bg = gray })
  vim.api.nvim_set_hl(0, "SLIndent", { fg = white, bg = gray })
  vim.api.nvim_set_hl(0, "SLTermIcon", { fg = purple, bg = gray })
  vim.api.nvim_set_hl(0, "SLFT", { fg = cyan, bg = gray })
  vim.api.nvim_set_hl(0, "SLLSP", { fg = gray, bg = bg })
  vim.api.nvim_set_hl(0, "SLSep", { fg = gray, bg = bg })
  vim.api.nvim_set_hl(0, "SLSeparator", { fg = fg, bg = "NONE", italic = true })
  vim.api.nvim_set_hl(0, "SLError", { fg = red, bg = "NONE" })
  vim.api.nvim_set_hl(0, "SLWarning", { fg = yellow, bg = "NONE" })
elseif vim.g.colors_name == "everforest" then
  bg = "#292e32"
  fg = "#D3C6AA"
  red = "#d98382"
  yellow = "#d6bd87"
  gray = "#30383b"
  purple = "#cd9bb4"
  blue = "#8cb9b4"
  cyan = "#90bf95"
  green = "#acbf87"
  white = "#d0c7af"

  vim.api.nvim_set_hl(0, "SLGitIcon", { fg = yellow, bg = gray })
  vim.api.nvim_set_hl(0, "SLBranchName", { fg = fg, bg = gray, bold = false })
  vim.api.nvim_set_hl(0, "SLSeparator", { fg = fg, bg = "NONE", italic = true })
  vim.api.nvim_set_hl(0, "SLSep", { fg = gray, bg = bg })
  vim.api.nvim_set_hl(0, "SLError", { fg = red, bg = "NONE" })
  vim.api.nvim_set_hl(0, "SLWarning", { fg = yellow, bg = "NONE" })
  vim.api.nvim_set_hl(0, "SLLSP", { fg = gray, bg = bg })
  vim.api.nvim_set_hl(0, "StatusLine", { fg = fg, bg = bg })
  vim.api.nvim_set_hl(0, "SLProgress", { fg = purple, bg = gray })
  vim.api.nvim_set_hl(0, "SLLocation", { fg = blue, bg = gray })
  vim.api.nvim_set_hl(0, "SLIndent", { fg = white, bg = gray })
  vim.api.nvim_set_hl(0, "SLFT", { fg = cyan, bg = gray })
end

local hl_str = function(str, hl)
  return "%#" .. hl .. "#" .. str .. "%*"
end

local mode_color = {
  n = blue,
  i = green,
  v = purple,
  [""] = purple,
  V = purple,
  c = yellow,
  no = yellow,
  s = green,
  S = yellow,
  [""] = yellow,
  ic = red,
  R = red,
  Rv = red,
  cv = blue,
  ce = blue,
  r = red,
  rm = cyan,
  ["r?"] = cyan,
  ["!"] = cyan,
  t = red,
}

local left_pad = {
  function()
    return " "
  end,
  padding = 0,
  color = function()
    return { fg = gray, bg = bg }
  end,
}

local right_pad = {
  function()
    return " "
  end,
  padding = 0,
  color = function()
    return { fg = gray, bg = bg }
  end,
}

local left_pad_alt = {
  function()
    return " "
  end,
  padding = 0,
  color = function()
    return { fg = gray, bg = bg }
  end,
}

local right_pad_alt = {
  function()
    return " "
  end,
  padding = 0,
  color = function()
    return { fg = gray, bg = bg }
  end,
}

local mode = {
  -- mode component
  function()
    return icons.misc.Orbit
  end,
  color = function()
    -- auto change color according to neovims mode
    return { fg = mode_color[vim.fn.mode()], bg = gray }
  end,
  padding = 0,
}

local hide_in_width_60 = function()
  return vim.o.columns > 60
end

local hide_in_width = function()
  return vim.o.columns > 80
end

local hide_in_width_100 = function()
  return vim.o.columns > 100
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = {
    error = "%#SLError#" .. icons.diagnostics.Error .. "%*",
    warn = "%#SLWarning#" .. icons.diagnostics.Warning .. "%*",
  },
  update_in_insert = false,
  always_visible = true,
  padding = 0,
  color = function()
    return { fg = red, bg = bg }
  end,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
  cond = hide_in_width_60,
  separator = "%#SLSeparator#" .. "│ " .. "%*",
}

local filetype = {
  "filetype",
  fmt = function(str)
    local ui_filetypes = {
      "help",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "",
      "nil",
    }

    local return_val = function(str)
      return hl_str(" ", "SLSep") .. hl_str(str, "SLFT") .. hl_str("", "SLSep")
    end

    if str == "TelescopePrompt" then
      return return_val(icons.ui.Telescope)
    end

    local function get_term_num()
      local t_status_ok, toggle_num = pcall(vim.api.nvim_buf_get_var, 0, "toggle_number")
      if not t_status_ok then
        return ""
      end
      return toggle_num
    end

    if str == "toggleterm" then
      -- 
      local term = "%#SLTermIcon#" .. " " .. "%*" .. "%#SLFT#" .. get_term_num() .. "%*"

      return return_val(term)
    end

    if contains(ui_filetypes, str) then
      return ""
    else
      return return_val(str)
    end
  end,
  icons_enabled = false,
  padding = 0,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "%#SLGitIcon#" .. " " .. "%*" .. "%#SLBranchName#",
  color = "Constant",
  -- colored = false,
  padding = 0,
  -- cond = hide_in_width_100,
  fmt = function(str)
    if str == "" or str == nil then
      return "!= vcs"
    end

    return str
  end,
}

local progress = {
  "progress",
  fmt = function(str)
    -- return "▊"
    return hl_str("", "SLSep") .. hl_str("%P/%L", "SLProgress") .. hl_str(" ", "SLSep")
    -- return "  "
  end,
  -- color = "SLProgress",
  padding = 0,
}

local current_signature = {
  function()
    local buf_ft = vim.bo.filetype

    if buf_ft == "toggleterm" or buf_ft == "TelescopePrompt" then
      return ""
    end
    if not pcall(require, "lsp_signature") then
      return ""
    end
    local sig = require("lsp_signature").status_line(30)
    local hint = sig.hint

    if not require("user.functions").isempty(hint) then
      -- return "%#SLSeparator#│ : " .. hint .. "%*"
      -- return "%#SLSeparator#│ " .. hint .. "%*"
      return "%#SLSeparator# " .. hint .. "%*"
    end

    return ""
  end,
  cond = hide_in_width_100,
  padding = 0,
}

-- cool function for progress
-- local progress = function()
--   local current_line = vim.fn.line "."
--   local total_lines = vim.fn.line "$"
--   local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
--   local line_ratio = current_line / total_lines
--   local index = math.ceil(line_ratio * #chars)
--   -- return chars[index]
--   return "%#SLProgress#" .. chars[index] .. "%*"
-- end

local spaces = {
  function()
    local buf_ft = vim.bo.filetype

    local ui_filetypes = {
      "help",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "DressingSelect",
      "",
    }
    local space = ""

    if contains(ui_filetypes, buf_ft) then
      space = " "
    end

    local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")

    if shiftwidth == nil then
      return ""
    end

    return hl_str(" ", "SLSep") .. hl_str(" " .. shiftwidth .. space, "SLIndent") .. hl_str("", "SLSep")
  end,
  padding = 0,
  -- separator = "%#SLSeparator#" .. " │" .. "%*",
  -- cond = hide_in_width_100,
}

local lanuage_server = {
  function()
    local buf_ft = vim.bo.filetype
    local ui_filetypes = {
      "help",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
      "lir",
      "Outline",
      "spectre_panel",
      "toggleterm",
      "DressingSelect",
      "TelescopePrompt",
      "lspinfo",
      "lsp-installer",
      "",
    }

    if contains(ui_filetypes, buf_ft) then
      if M.language_servers == nil then
        return ""
      else
        return M.language_servers
      end
    end

    local clients = vim.lsp.get_clients and vim.lsp.get_clients({ bufnr = 0 }) or vim.lsp.buf_get_clients()
    local client_names = {}
    local copilot_active = false

    -- add client
    for _, client in pairs(clients) do
      if client.name ~= "copilot" and client.name ~= "null-ls" then
        table.insert(client_names, client.name)
      end
      if client.name == "copilot" then
        copilot_active = true
      end
    end

    -- add formatter
    local s = require "null-ls.sources"
    local available_sources = s.get_available(buf_ft)
    local registered = {}
    for _, source in ipairs(available_sources) do
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end

    local formatter = registered["NULL_LS_FORMATTING"]
    local linter = registered["NULL_LS_DIAGNOSTICS"]
    if formatter ~= nil then
      vim.list_extend(client_names, formatter)
    end
    if linter ~= nil then
      vim.list_extend(client_names, linter)
    end

    -- join client names with commas
    local client_names_str = table.concat(client_names, ", ")

    -- check client_names_str if empty
    local language_servers = ""
    local client_names_str_len = #client_names_str
    if client_names_str_len ~= 0 then
      language_servers = hl_str("", "SLSep") .. hl_str(client_names_str, "SLSeparator") .. hl_str("", "SLSep")
    end
    if copilot_active then
      language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*"
    end

    if client_names_str_len == 0 and not copilot_active then
      return ""
    else
      M.language_servers = language_servers
      return language_servers:gsub(", anonymous source", "")
    end
  end,
  padding = 0,
  cond = hide_in_width,
  -- separator = "%#SLSeparator#" .. " │" .. "%*",
}

local location = {
  "location",
  fmt = function(str)
    -- return "▊"
    return hl_str(" ", "SLSep") .. hl_str(str, "SLLocation") .. hl_str(" ", "SLSep")
    -- return "  "
  end,
  padding = 0,
}

local ok_gb, git_branch = pcall(require, "lualine.components.branch.git_branch")
if ok_gb and git_branch then
  local orig_find = git_branch.find_git_dir
  git_branch.find_git_dir = function(...)
    if not package or not package.loaded then return nil end
    return orig_find(...)
  end
end

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    -- theme = "solarized_dark",
    normal = {
      theme = {
        a = { fg = fg, bg = bg },
        b = { fg = fg, bg = bg },
        c = { fg = fg, bg = bg },
      },
    },
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { left_pad, mode, branch, right_pad },
    lualine_b = { left_pad_alt, diagnostics, right_pad_alt },
    lualine_c = { current_signature },
    -- lualine_x = { diff, spaces, "encoding", filetype },
    -- lualine_x = { diff, lanuage_server, spaces, filetype },
    -- lualine_x = { lanuage_server, spaces, filetype },
    lualine_x = { lanuage_server, spaces, filetype },
    lualine_y = {},
    lualine_z = { location, progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

Group.new("lualine_c_normal", colors.none, colors.none, styles.NONE)
Group.new("lualine_c_command", colors.none, colors.none, styles.NONE)
Group.new("lualine_c_visual", colors.none, colors.none, styles.NONE)
Group.new("lualine_c_replace", colors.none, colors.none, styles.NONE)
Group.new("lualine_c_insert", colors.none, colors.none, styles.NONE)
Group.new("lualine_c_terminal", colors.none, colors.none, styles.NONE)
