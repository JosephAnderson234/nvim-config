#!/usr/bin/env bash
# Installs this config into ~/.config/nvim on Linux/WSL/macOS.
# Usage: curl -fsSL https://raw.githubusercontent.com/JosephAnderson234/nvim-config/main/install.sh | bash
set -e

TARGET="$HOME/.config/nvim"
REPO="https://github.com/JosephAnderson234/nvim-config.git"

if [ -d "$TARGET" ]; then
  backup="$TARGET.bak-$(date +%Y%m%d-%H%M%S)"
  echo "Backing up existing config to $backup"
  mv "$TARGET" "$backup"
fi

git clone "$REPO" "$TARGET"

if grep -qi microsoft /proc/version 2>/dev/null; then
  mkdir -p "$HOME/.local/bin"
  cp "$TARGET/scripts/mkdp-open" "$HOME/.local/bin/mkdp-open"
  chmod +x "$HOME/.local/bin/mkdp-open"
  if ! grep -q '.local/bin' "$HOME/.bashrc" 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
  fi
  echo "WSL detected: installed mkdp-open to ~/.local/bin"
fi

echo ""
echo "Config cloned. Still needed manually:"
echo "  - rust-analyzer/cargo, clangd, lazygit (download release binary, not in apt)"
echo "  - Node.js + Go + Python toolchains in PATH (for LSPs/formatters)"
echo "  - Open nvim once to let lazy.nvim install plugins: nvim --headless '+Lazy! sync' +qa"
echo "  - Run :Codeium Auth inside nvim to log in to Codeium (per machine, not synced)"
