local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/notes",
          home = "~/notes/home",
        },
      },
    },
    ["core.concealer"] = {},
    ["core.neorgcmd"] = {},
    ["core.integrations.treesitter"] = {},
    ["core.presenter"] = {
      config = {
        zen_mode = "zen-mode",
      },
    },
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,

        hook = function(keybinds)
          keybinds.remap_event("norg", "n", "<C-t>", "core.qol.todo_items.todo.task_cycle")
          keybinds.remap_event("norg", "n", "<C-g>", "core.looking-glass.magnify-code-block")
        end,

        neorg_leader = "<leader>",
      },
    },
    ["core.autocommands"] = {},
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
        name = "[Neorg]",
      },
    },
    ["core.storage"] = {
      config = {
        path = vim.fn.stdpath "data" .. "/neorg.mpack",
      },
    },
    ["core.pivot"] = {},
    ["core.tempus"] = {},
    ["core.looking-glass"] = {},
    ["core.syntax"] = {},
  },
}
