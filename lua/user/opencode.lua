local status_ok, opencode = pcall(require, "opencode")

-- Enable autoread so external edits made by OpenCode are picked up
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  callback = function()
    if vim.fn.getcmdwintype() == "" then
      pcall(vim.cmd, "checktime")
    end
  end,
})

-- Setup ToggleTerm floating terminal for OpenCode TUI
local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if toggleterm_ok then
  local Terminal = require("toggleterm.terminal").Terminal
  local opencode_term = Terminal:new {
    cmd = "opencode",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "curved",
      width = function()
        return math.floor(vim.o.columns * 0.9)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.9)
      end,
    },
    on_open = function(term)
      vim.cmd "startinsert!"
      vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<m-o>", "<cmd>lua _OPENCODE_TOGGLE()<cr>", { noremap = true, silent = true })
    end,
    on_close = function(_)
      if vim.fn.getcmdwintype() == "" then
        pcall(vim.cmd, "checktime")
      end
    end,
    count = 88,
  }

  function _OPENCODE_TOGGLE()
    opencode_term:toggle()
  end
else
  function _OPENCODE_TOGGLE()
    vim.cmd "vsplit term://opencode | wincmd p"
  end
end

-- Fast global shortcut to toggle OpenCode TUI anytime
vim.keymap.set({ "n", "t", "i" }, "<M-o>", function()
  _OPENCODE_TOGGLE()
end, { noremap = true, silent = true, desc = "Toggle OpenCode TUI" })

if not status_ok then
  return
end

---@type opencode.Opts
vim.g.opencode_opts = {
  server = {
    connect = true,
    start = function()
      _OPENCODE_TOGGLE()
    end,
  },
  events = {
    enabled = true,
    reload = {
      enabled = true,
    },
  },
}

-- Fast shortcuts for in-editor OpenCode vibe coding
vim.keymap.set({ "n", "x" }, "<leader>aa", function()
  opencode.ask("@this: ")
end, { noremap = true, silent = true, desc = "Ask OpenCode" })

vim.keymap.set({ "n", "x" }, "<leader>as", function()
  opencode.select()
end, { noremap = true, silent = true, desc = "Select OpenCode Action" })

vim.keymap.set({ "n", "x" }, "<M-a>", function()
  opencode.ask("@this: ")
end, { noremap = true, silent = true, desc = "Ask OpenCode" })

vim.keymap.set({ "n", "x" }, "<M-x>", function()
  opencode.select()
end, { noremap = true, silent = true, desc = "Select OpenCode Action" })

vim.keymap.set({ "n", "x" }, "go", function()
  return opencode.operator("@this")
end, { expr = true, desc = "Send motion to OpenCode" })

vim.keymap.set("n", "goo", function()
  return opencode.operator("@this") .. "_"
end, { expr = true, desc = "Send line to OpenCode" })
