local status_ok, competitest = pcall(require, "competitest")
if not status_ok then
  return
end

competitest.setup {
  local_config_file_name = ".competitest.lua",

  floating_border = "rounded",
  floating_border_highlight = "FloatBorder",
  picker_ui = {
    width = 0.2,
    height = 0.3,
    mappings = {
      focus_next = { "j", "<down>", "<Tab>" },
      focus_prev = { "k", "<up>", "<S-Tab>" },
      close = { "<esc>", "<C-c>", "q", "Q" },
      submit = { "<cr>" },
    },
  },
  editor_ui = {
    popup_width = 0.4,
    popup_height = 0.6,
    show_nu = true,
    show_rnu = false,
    normal_mode_mappings = {
      switch_window = { "<C-h>", "<C-l>", "<C-i>" },
      save_and_close = { "<C-s>", ":wq" },
      cancel = { "<C-c>", ":q" },
    },
    insert_mode_mappings = {
      switch_window = { "<C-h>", "<C-l>", "<C-i>" },
      save_and_close = { "<C-s>" },
      cancel = { "<C-c>" },
    },
  },
  runner_ui = {
    interface = "popup",
    selector_show_nu = false,
    selector_show_rnu = false,
    show_nu = true,
    show_rnu = false,
    mappings = {
      run_again = "R",
      run_all_again = "<C-r>",
      kill = "K",
      kill_all = "<C-k>",
      view_input = { "i", "I" },
      view_output = { "a", "A" },
      view_stdout = { "o", "O" },
      view_stderr = { "e", "E" },
      toggle_diff = { "d", "D" },
      close = { "q", "Q", "<esc>" },
    },
    viewer = {
      width = 0.5,
      height = 0.5,
      show_nu = true,
      show_rnu = false,
    },
  },
  popup_ui = {
    total_width = 0.8,
    total_height = 0.8,
    layout = {
      { 4, "tc" },
      { 5, { { 1, "so" }, { 1, "si" } } },
      { 5, { { 1, "eo" }, { 1, "se" } } },
    },
  },
  split_ui = {
    position = "right",
    relative_to_editor = true,
    total_width = 0.3,
    vertical_layout = {
      { 1, "tc" },
      { 1, { { 1, "so" }, { 1, "eo" } } },
      { 1, { { 1, "si" }, { 1, "se" } } },
    },
    total_height = 0.4,
    horizontal_layout = {
      { 2, "tc" },
      { 3, { { 1, "so" }, { 1, "si" } } },
      { 3, { { 1, "eo" }, { 1, "se" } } },
    },
  },

  save_current_file = true,
  save_all_files = false,
  compile_directory = ".",
  compile_command = {
    c = {
      exec = "gcc",
      args = { "-O2", "-std=c11", "-Wall", "-Wextra", "-Wl,--stack,268435456", "-static", "$(FNAME)", "-o", "$(FNOEXT).exe" },
    },
    cpp = {
      exec = "g++",
      args = {
        "-O2",
        "-std=c++20",
        "-Wall",
        "-Wextra",
        "-Wshadow",
        "-Wl,--stack,268435456",
        "-static",
        "$(FNAME)",
        "-o",
        "$(FNOEXT).exe",
      },
    },
    rust = { exec = "rustc", args = { "$(FNAME)" } },
    java = { exec = "javac", args = { "$(FNAME)" } },
  },
  running_directory = ".",
  run_command = {
    c = { exec = "./$(FNOEXT).exe" },
    cpp = { exec = "./$(FNOEXT).exe" },
    rust = { exec = "./$(FNOEXT).exe" },
    python = { exec = "python", args = { "$(FNAME)" } },
    java = { exec = "java", args = { "$(FNOEXT)" } },
  },
  multiple_testing = -1,
  maximum_time = 5000,
  output_compare_method = "squish",
  view_output_diff = false,

  testcases_use_single_file = false,
  testcases_auto_detect_storage = true,
  testcases_single_file_format = "$(FNOEXT).testcases",
  testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
  testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",
  testcases_directory = ".",

  companion_port = 27121,
  receive_print_message = true,
  template_file = false,
  evaluate_template_modifiers = false,
  date_format = "%c",
  received_files_extension = "cpp",
  received_problems_path = "$(CWD)/$(PROBLEM).$(FEXT)",
  received_problems_prompt_path = false,
  received_contests_directory = "$(CWD)",
  received_contests_prompt_directory = false,
  received_contests_problems_path = "$(PROBLEM).$(FEXT)",
}

local map = vim.keymap.set
map("n", "<leader>cr", "<cmd>CompetiTest run<cr>", { silent = true, desc = "CompetiTest Run" })
map("n", "<leader>ca", "<cmd>CompetiTest add_testcase<cr>", { silent = true, desc = "CompetiTest Add Testcase" })
map("n", "<leader>Cr", "<cmd>CompetiTest run<cr>", { silent = true, desc = "CompetiTest Run" })
map("n", "<leader>Ca", "<cmd>CompetiTest add_testcase<cr>", { silent = true, desc = "CompetiTest Add Testcase" })
