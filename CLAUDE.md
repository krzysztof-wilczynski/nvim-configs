# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a minimal, Rust-focused Neovim configuration using Lazy.nvim as the plugin manager. The configuration is written entirely in Lua.

## Architecture

**Entry Point:** `init.lua` loads modules in order:
1. `config.lazy` - Plugin manager bootstrap
2. `config.keymaps` - Global key bindings
3. `config.options` - Editor settings
4. `config.autocommands` - Event hooks

**Directory Structure:**
- `lua/config/` - Core configuration (options, keymaps, autocommands, LSP setup)
- `lua/config/lsp/` - LSP configuration with `setup.lua` (Mason/server init), `common.lua` (shared handlers), and `servers/` (per-server configs)
- `lua/plugins/` - Plugin specifications for Lazy.nvim (each file returns a plugin spec table)
- `lua/plugins/languages/` - Language-specific plugin configurations
- `snippets/` - Custom snippet definitions

**Key Design Patterns:**
- Plugin specs use Lazy.nvim's table format with lazy-loading via `event`, `ft`, or `keys`
- LSP servers are managed through Mason with configs in `lua/config/lsp/servers/`
- Which-key organizes keymaps into categories (File search, Git, LSP, Windows, Cargo)
- Leader key is spacebar

## Primary Technologies

- **Plugin Manager:** Lazy.nvim (folke/lazy.nvim)
- **LSP:** nvim-lspconfig + mason.nvim + mason-lspconfig.nvim
- **Completion:** blink.cmp with LuaSnip
- **Formatting:** conform.nvim (stylua for Lua, rustfmt for Rust)
- **Syntax:** nvim-treesitter
- **File Explorer:** neo-tree.nvim (right-side panel)
- **Picker:** snacks.nvim
- **Theme:** Catppuccin Mocha

## Rust-Specific Setup

The config has extensive Rust support:
- `rustaceanvim` - Full Rust IDE capabilities with DAP integration
- `crates.nvim` - Cargo.toml dependency management
- `cargo.nvim` - Task runner with which-key bindings under `<leader>c`
- rust_analyzer configured with Clippy on-save, full inlay hints, proc macro support
- Custom snippets in `snippets/rust.json`

## Debugging (DAP)

Debug Adapter Protocol configured for Rust via codelldb:
- `<leader>db` - Toggle breakpoint
- `<leader>dc` - Continue/Start debugging
- `<leader>di/do/dO` - Step into/over/out
- `<leader>du` - Toggle DAP UI
- `<leader>cD` - Debug: select target (Rust-specific)

DAP config: `lua/plugins/dap.lua`

## LSP Configuration Pattern

To add a new LSP server:
1. Create config file in `lua/config/lsp/servers/<server>.lua` returning a table with settings
2. Add server name to the `servers` table in `lua/config/lsp/setup.lua`
3. Mason will auto-install; config merges with common handlers from `lua/config/lsp/common.lua`

## Code Style

- **Formatter:** Stylua (configured in `.stylua.toml`)
- **Indent:** 2 spaces
- **Language:** Comments are primarily in Polish
- **Lua diagnostics:** `vim` is defined as a global

## Known Issues

- `lua/utils.lua` is referenced in keymaps.lua for font size adjustment (`<C-=>`, `<C-->`) but the module doesn't exist in this branch
