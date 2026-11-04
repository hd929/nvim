local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  preset = "classic",
  notify = false,
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  win = {
    border = "rounded",
    padding = { 2, 2 },
  },
  layout = {
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  show_help = true,
}

which_key.setup(setup)

which_key.add({
  { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
  { "<leader>q", "<cmd>q!<CR>", desc = "Quit" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
  { "<leader>d", "<cmd>lua Snacks.dashboard()<cr>", desc = "Dashboard" },
  { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers" },
  { "<leader>/", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', desc = "Comment" },
  { "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files" },
  { "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
  { "<leader>P", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },

  -- AI / OpenCode
  { "<leader>a", group = "AI / OpenCode" },
  { "<leader>aa", '<cmd>lua require("opencode").ask("@this: ")<cr>', desc = "Ask OpenCode" },
  { "<leader>as", '<cmd>lua require("opencode").select()<cr>', desc = "Select Action" },
  { "<leader>ao", "<cmd>lua _OPENCODE_TOGGLE()<cr>", desc = "OpenCode TUI" },
  { "<leader>ae", '<cmd>lua require("opencode").ask("Explain @this and its context")<cr>', desc = "Explain Code" },
  { "<leader>af", '<cmd>lua require("opencode").ask("Fix @diagnostics in @this")<cr>', desc = "Fix Diagnostics" },
  { "<leader>ad", '<cmd>lua require("opencode").ask("Add comments documenting @this")<cr>', desc = "Document Code" },
  { "<leader>at", '<cmd>lua require("opencode").ask("Add comprehensive tests for @this")<cr>', desc = "Add Tests" },
  { "<leader>ar", "<cmd>checktime<cr>", desc = "Reload Buffers" },

  -- CompetiTest
  { "<leader>c", group = "CompetiTest" },
  { "<leader>cr", "<cmd>CompetiTest run<cr>", desc = "Run Tests" },
  { "<leader>ca", "<cmd>CompetiTest add_testcase<cr>", desc = "Add Testcase" },
  { "<leader>cc", "<cmd>lua Snacks.bufdelete()<CR>", desc = "Close Buffer" },

  -- Plugins
  { "<leader>p", group = "Plugins" },
  { "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install" },
  { "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync" },
  { "<leader>pS", "<cmd>Lazy clear<cr>", desc = "Status" },
  { "<leader>pc", "<cmd>Lazy clean<cr>", desc = "Clean" },
  { "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update" },
  { "<leader>pp", "<cmd>Lazy profile<cr>", desc = "Profile" },
  { "<leader>pl", "<cmd>Lazy log<cr>", desc = "Log" },
  { "<leader>pd", "<cmd>Lazy debug<cr>", desc = "Debug" },

  -- Git
  { "<leader>g", group = "Git" },
  { "<leader>gg", "<cmd>lua Snacks.lazygit()<CR>", desc = "Lazygit" },
  { "<leader>gj", "<cmd>lua require('gitsigns').next_hunk()<cr>", desc = "Next Hunk" },
  { "<leader>gk", "<cmd>lua require('gitsigns').prev_hunk()<cr>", desc = "Prev Hunk" },
  { "<leader>gl", "<cmd>lua require('gitsigns').blame_line()<cr>", desc = "Blame" },
  { "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview Hunk" },
  { "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<leader>gR", "<cmd>lua require('gitsigns').reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
  { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },

  -- LSP
  { "<leader>l", group = "LSP" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
  { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
  { "<leader>lf", "<cmd>lua require('conform').format({ async = true, lsp_format = 'fallback' })<cr>", desc = "Format" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },

  -- Search
  { "<leader>s", group = "Search" },
  { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },

  -- Session
  { "<leader>S", group = "Session" },
  { "<leader>Ss", "<cmd>AutoSession search<cr>", desc = "Search Sessions" },
  { "<leader>Sr", "<cmd>AutoSession restore<cr>", desc = "Restore Session" },
  { "<leader>Sw", "<cmd>AutoSession save<cr>", desc = "Save Session" },
  { "<leader>Sd", "<cmd>AutoSession delete<cr>", desc = "Delete Session" },

  -- Terminal
  { "<leader>t", group = "Terminal" },
  { "<leader>to", "<cmd>lua _OPENCODE_TOGGLE()<cr>", desc = "OpenCode" },
  { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Node" },
  { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>", desc = "NCDU" },
  { "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>", desc = "Htop" },
  { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python" },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },

  -- Notes
  { "<leader>n", group = "Notes" },
  { "<leader>nn", "<cmd>e ~/notes<CR>", desc = "Notes" },

  -- Replace
  { "<leader>R", group = "Replace" },
  { "<leader>Rs", "<CMD>SearchReplaceSingleBufferSelections<CR>", desc = "SearchReplaceSingleBuffer [s]election list" },
  { "<leader>Ro", "<CMD>SearchReplaceSingleBufferOpen<CR>", desc = "[o]pen" },
  { "<leader>Rw", "<CMD>SearchReplaceSingleBufferCWord<CR>", desc = "[w]ord" },
  { "<leader>RW", "<CMD>SearchReplaceSingleBufferCWORD<CR>", desc = "[W]ORD" },
  { "<leader>Re", "<CMD>SearchReplaceSingleBufferCExpr<CR>", desc = "[e]xpr" },
  { "<leader>Rf", "<CMD>SearchReplaceSingleBufferCFile<CR>", desc = "[f]ile" },
  { "<leader>Rb", group = "SearchReplaceMultiBuffer" },
  { "<leader>Rbs", "<CMD>SearchReplaceMultiBufferSelections<CR>", desc = "SearchReplaceMultiBuffer [s]election list" },
  { "<leader>Rbo", "<CMD>SearchReplaceMultiBufferOpen<CR>", desc = "[o]pen" },
  { "<leader>Rbw", "<CMD>SearchReplaceMultiBufferCWord<CR>", desc = "[w]ord" },
  { "<leader>RbW", "<CMD>SearchReplaceMultiBufferCWORD<CR>", desc = "[W]ORD" },
  { "<leader>Rbe", "<CMD>SearchReplaceMultiBufferCExpr<CR>", desc = "[e]xpr" },
  { "<leader>Rbf", "<CMD>SearchReplaceMultiBufferCFile<CR>", desc = "[f]ile" },

  -- CompetiTest (Shift-C)
  { "<leader>C", group = "CompetiTest" },
  { "<leader>Cr", "<cmd>CompetiTest run<cr>", desc = "Run Tests" },
  { "<leader>Ca", "<cmd>CompetiTest add_testcase<cr>", desc = "Add Testcase" },
  { "<leader>Ce", "<cmd>CompetiTest edit_testcase<cr>", desc = "Edit Testcase" },
  { "<leader>Cd", "<cmd>CompetiTest delete_testcase<cr>", desc = "Delete Testcase" },
  { "<leader>Cu", "<cmd>CompetiTest show_ui<cr>", desc = "Show UI" },
  { "<leader>Cp", "<cmd>CompetiTest receive problem<cr>", desc = "Receive Problem" },
  { "<leader>Cc", "<cmd>CompetiTest receive contest<cr>", desc = "Receive Contest" },
})

-- Visual mappings
which_key.add({
  mode = { "v" },
  { "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', desc = "Comment" },
  { "<leader>a", group = "AI / OpenCode" },
  { "<leader>aa", '<cmd>lua require("opencode").ask("@this: ")<cr>', desc = "Ask Selection" },
  { "<leader>as", '<cmd>lua require("opencode").select()<cr>', desc = "Select Action" },
  { "<leader>ae", '<cmd>lua require("opencode").ask("Explain @this and its context")<cr>', desc = "Explain Selection" },
  { "<leader>af", '<cmd>lua require("opencode").ask("Refactor and optimize @this")<cr>', desc = "Refactor/Optimize" },
  { "<leader>at", '<cmd>lua require("opencode").ask("Add unit tests for @this")<cr>', desc = "Add Tests" },
})
