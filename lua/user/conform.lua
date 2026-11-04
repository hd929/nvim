local status_ok, conform = pcall(require, "conform")
if not status_ok then
  return
end

conform.setup {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    c = { "clang-format" },
    cpp = { "clang-format" },
  },
}

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line and end_line:len() or 0 },
    }
  end
  conform.format { async = true, lsp_format = "fallback", range = range }
end, { range = true })
