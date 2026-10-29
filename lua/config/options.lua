-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- WSL: open markdown preview in the Windows browser (no-op on native Windows/Linux)
if vim.fn.has("wsl") == 1 then
  vim.g.mkdp_browser = "mkdp-open"
  vim.g.mkdp_echo_preview_url = 1
end
