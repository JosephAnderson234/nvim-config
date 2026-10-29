# nvim-config

Mi config de [LazyVim](https://github.com/LazyVim/LazyVim), pensada para ser idéntica en
Windows nativo y en WSL (Ubuntu). Los archivos detectan la plataforma donde corren, así que
este mismo repo se clona sin cambios en ambos lados.

## Instalación

**Windows** (PowerShell):

```powershell
irm https://raw.githubusercontent.com/JosephAnderson234/nvim-config/main/install.ps1 | iex
```

Clona el repo en `%LOCALAPPDATA%\nvim`. Si ya existe una config ahí, se hace backup con
timestamp antes de reemplazarla.

**WSL / Linux / macOS**:

```bash
curl -fsSL https://raw.githubusercontent.com/JosephAnderson234/nvim-config/main/install.sh | bash
```

Clona el repo en `~/.config/nvim`. Si detecta que corre bajo WSL, también instala
`scripts/mkdp-open` en `~/.local/bin` (necesario para que `markdown-preview.nvim` abra el
navegador de Windows desde WSL).

Después de clonar en cualquiera de los dos lados:

```sh
nvim --headless "+Lazy! sync" +qa   # instala los plugins
```

Y dentro de nvim, una vez: `:Codeium Auth` (el login no se sincroniza entre máquinas).

## Dependencias externas (no gestionadas por lazy.nvim)

- **rust-analyzer / cargo**, **clangd** (Windows: `winget install LLVM.LLVM`; WSL: `apt install clangd`)
- **lazygit** (Windows: `winget install JesseDuffield.lazygit`; WSL/Linux: no está en apt, bajar el
  binario del [release](https://github.com/jesseduffield/lazygit/releases))
- Node.js, Go y Python en el PATH, para los LSPs/formatters de esos lenguajes
- Una Nerd Font instalada en la terminal (uso JetBrainsMono Nerd Font)

## Qué trae

- **Explorador de archivos**: extra `editor.neo-tree` (sidebar estilo VS Code)
- **Colorscheme**: Gruvbox Dark (`ellisonleao/gruvbox.nvim`, contraste "hard")
- **Markdown**: preview en vivo (`markdown-preview.nvim` + `render-markdown.nvim`)
- **Discord Rich Presence**: solo en Windows nativo (`lua/plugins/discord.lua` se auto-desactiva
  en Linux/WSL porque no hay IPC a Discord)
- **Lenguajes**: TypeScript (vtsls), Go, Python, clangd (C/C++), JSON/YAML/TOML/Docker
- **Navegación**: Harpoon2 (`<leader>H` marcar, `<leader>h` menú, `<leader>1-9` saltar)
- **Resaltado de referencias**: vim-illuminate (`]]`/`[[` saltar, `<leader>ux` toggle)
- **Cliente REST**: kulala.nvim para archivos `.http` (`<leader>Rs` enviar request)
- **Autocompletado IA**: Codeium (extra `ai.codeium`, vía blink.cmp)
- **Git**: gitsigns + lazygit (`<leader>gg`)

## Estructura

```
lua/config/   -- opciones, keymaps, autocmds, spec de lazy.nvim (extras incluidos)
lua/plugins/  -- plugins propios/overrides
scripts/      -- helpers externos (mkdp-open para WSL)
install.ps1   -- instalador para Windows
install.sh    -- instalador para WSL/Linux/macOS
```
