# AGENTS.md

Neovim config built on LazyVim. Entry point: `init.lua` → `lua/config/lazy.lua`.

## Architecture
- Base: LazyVim (`lua/lazyvim.plugins` imported automatically)
- Custom plugins: `lua/plugins/*.lua` (auto-discovered via lazy.nvim spec)
- Custom config: `lua/config/*.lua` (loaded by LazyVim on VeryLazy event)
- Plugin lockfile: `lazy-lock.json`

## Key conventions
- Leader = `;` (not space), localleader = `\` — see `lua/config/options.lua:8-9`
- Stylua: 2-space indent, 120 column width (`stylua.toml`)
- Optional plugins use `optional = true` in their spec (e.g., conform, nvim-lint)

## Filetype quirks
- `.qrc` files mapped to `xml`, `.ixx` mapped to `cpp` (`lua/config/options.lua:12-17`)

## Formatters & linters
- clang_format: c, cpp, arduino (expects `--style=file`)
- latexindent: tex
- gersemi: cmake
- beautysh: zsh
- biome: json
- markdownlint-cli2: uses `~/.markdownlint-cli2.yaml`

## VSCode support
Keymaps conditionally set for VSCode Neovim extension (`lua/config/keymaps.lua:38`)
