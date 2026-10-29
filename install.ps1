#!/usr/bin/env pwsh
# Installs this config into %LOCALAPPDATA%\nvim on native Windows.
# Usage: irm https://raw.githubusercontent.com/JosephAnderson234/nvim-config/main/install.ps1 | iex

$Target = "$env:LOCALAPPDATA\nvim"
$Repo = "https://github.com/JosephAnderson234/nvim-config.git"

if (Test-Path $Target) {
    $backup = "$Target.bak-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Write-Host "Backing up existing config to $backup"
    Move-Item $Target $backup
}

git clone $Repo $Target

Write-Host ""
Write-Host "Config cloned. Still needed manually:"
Write-Host "  - rust-analyzer, clangd (winget install LLVM.LLVM), lazygit (winget install JesseDuffield.lazygit)"
Write-Host "  - Node.js + Go + Python toolchains in PATH (for LSPs/formatters)"
Write-Host "  - Open nvim once to let lazy.nvim install plugins: nvim --headless '+Lazy! sync' +qa"
Write-Host "  - Run :Codeium Auth inside nvim to log in to Codeium (per machine, not synced)"
