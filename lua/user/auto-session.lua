local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
  return
end

auto_session.setup {
  auto_save = true,
  auto_restore = true,
  suppressed_dirs = { "~/", "~/Downloads", "/" },
  session_lens = {
    load_on_setup = true,
    previewer = false,
  },
}
