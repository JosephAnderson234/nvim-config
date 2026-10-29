-- Discord Rich Presence relies on IPC to the local Discord client,
-- which isn't reachable from WSL, so only load it on native Windows.
if vim.fn.has("win32") == 0 then
  return {}
end

return {
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = {
      neovim_image_text = "Neovim",
      main_image = "neovim",
      enable_line_number = false,
      buttons = false,
    },
  },
}
