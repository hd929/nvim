local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<M-h>", "<C-w>h", opts)
keymap("n", "<M-j>", "<C-w>j", opts)
keymap("n", "<M-k>", "<C-w>k", opts)
keymap("n", "<M-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<C-q>", ":bwipeout<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<M-j>", ":m .+1<CR>==", opts)
keymap("v", "<M-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<M-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<M-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<M-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<M-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<M-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<M-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Search-replace
keymap("v", "<C-r>", "<CMD>SearchReplaceSingleBufferVisualSelection<CR>", opts)
keymap("v", "<C-s>", "<CMD>SearchReplaceWithinVisualSelection<CR>", opts)
keymap("v", "<C-b>", "<CMD>SearchReplaceWithinVisualSelectionCWord<CR>", opts)

-- Renamer
keymap("n", "<F2>", '<cmd>lua require("renamer").rename()<cr>', opts)

-- Custom
keymap("n", "<C-z>", "<cmd>ZenMode<cr>", opts)
keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)

-- Fast C/C++ Compile & Run (<F5>)
local function run_cpp()
  local file = vim.fn.expand "%"
  local ext = vim.fn.expand "%:e"
  local fnoext = vim.fn.expand "%:r"
  if ext == "cpp" or ext == "c" then
    vim.cmd "write"
    local compiler = ext == "cpp" and "g++" or "gcc"
    local std = ext == "cpp" and "-std=c++20" or "-std=c11"
    local cmd = string.format('%s -O2 %s -Wall -Wextra -Wshadow -Wl,--stack,268435456 -static "%s" -o "%s.exe" ; if ($?) { & "./%s.exe" }', compiler, std, file, fnoext, fnoext)
    require("toggleterm").exec(cmd, 1, 15, nil, "horizontal")
  else
    vim.notify("Not a C/C++ file: " .. ext, vim.log.levels.WARN)
  end
end

vim.keymap.set("n", "<F5>", run_cpp, { noremap = true, silent = true, desc = "Compile & Run C++" })

