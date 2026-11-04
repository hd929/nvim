local servers = {
  "lua_ls",
  "cssls",
  "html",
  "ts_ls",
  "tailwindcss",
  "emmet_ls",
  "stylelint_lsp",
  "glint",
  "jsonls",
  "pyright",
  "powershell_es",
  "intelephense",
  "clangd",
  "rust_analyzer",
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local has_native_lsp_config = vim.fn.has("nvim-0.11") == 1 and vim.lsp.config and vim.lsp.enable
local lspconfig = nil
if not has_native_lsp_config then
  local ok, mod = pcall(require, "lspconfig")
  if ok then
    lspconfig = mod
  else
    return
  end
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  if has_native_lsp_config then
    vim.lsp.config[server] = opts
    vim.lsp.enable(server)
  elseif lspconfig then
    lspconfig[server].setup(opts)
  end
end
