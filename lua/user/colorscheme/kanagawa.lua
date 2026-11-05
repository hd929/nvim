local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
  return
end

kanagawa.setup {
  compile = true,
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,
  dimInactive = false,
  terminalColors = true,
  theme = "wave", -- "wave", "dragon", "lotus"
  background = {
    dark = "wave",
    light = "lotus",
  },
}

kanagawa.load "wave"
