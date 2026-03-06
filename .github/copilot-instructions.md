# Copilot Instructions for Dotfiles Repository

## Project Overview

This is a **macOS-focused dotfiles repository** for configuring development environments. It manages shell configuration, editor setup (Neovim), window management (Hammerspoon), package management (Homebrew), and system tools through symlinked configuration files.

## Architecture & Key Components

### 1. Installation & Symlink System
- **Entry point:** [setup.sh](../setup.sh) - idempotent script that creates necessary directories and symlinks all configs
- Uses `ln -sfn` pattern to link repo files to home directory (~/.zshrc → ~/Dotfiles/zshrc)
- **Key pattern:** All config files are sourced from the Dotfiles repo, not edited in ~/.config
- Handles tool installation: Homebrew, Oh My Zsh, TPM (Tmux Plugin Manager), asdf

### 2. Shell Configuration
- **zshrc** is the main shell config; sourced files are `zshrc_aliases` and brew-managed tools
- **zshrc_aliases** contains 400+ lines of productivity aliases and functions
- Uses these layers: Homebrew completions → zsh plugins (autosuggestions, syntax-highlighting) → Oh My Zsh → custom aliases
- **Powerlevel10k** prompt is managed via [p10k.zsh](../p10k.zsh)
- History is saved with timestamps (9.2 billion line limit, immediately appended)

### 3. Neovim Configuration
- Uses **lazy.nvim** as plugin manager (lazy-loaded by default)
- **Bootstrap location:** [nvim/lua/config/lazy.lua](../nvim/lua/config/lazy.lua) - downloads lazy.nvim on first run
- Structure: `init.lua` → `config/lazy.lua` → plugin specs in `plugins/*.lua`
- **Configuration layers:**
  - [options.lua](../nvim/lua/config/options.lua) - vim settings
  - [keymaps.lua](../nvim/lua/config/keymaps.lua) - key bindings
  - [autocmds.lua](../nvim/lua/config/autocmds.lua) - autocommands
  - [plugins/](../nvim/lua/plugins/) - 20+ plugin configurations (LSP, telescope, treesitter, git, copilot, etc.)
- Extends **LazyVim** distro (see example.lua pattern for LazyVim modifications)
- **Code style:** Configured with stylua.toml (Lua formatter)

### 4. Hammerspoon (macOS Window Management)
- **Entry point:** [hammerspoon/init.lua](../hammerspoon/init.lua)
- Uses SpoonInstall for plugin management (custom spoons in Spoons/ directory)
- **Key spoons:** WindowGrid (Hyper+W), ShiftIt (window tiling), ReloadConfiguration (auto-reload)
- Hyper key = Ctrl+Alt for hotkey bindings

### 5. Git Configuration
- Modular structure in [git/](../git/) directory: config, attributes, gitattributes, ignore
- Symlinked to ~/.config/git by setup.sh

### 6. Package Management
- **Brewfile** manages all system packages and casks (2 taps, 40+ tools)
- **asdf** installed via Homebrew for runtime version management (default-gems in asdf/)
- **setup.sh** runs `brew bundle` automatically

## Critical Developer Workflows

### Setting Up Development Environment
```bash
cd ~/Dotfiles
sh setup.sh                    # Creates directories, symlinks, installs Homebrew, Oh My Zsh, etc.
brew bundle                    # Installs packages from Brewfile (idempotent)
chsh -s "$(which zsh)"        # Change shell to zsh
source ~/.zshrc               # Reload shell config
```

### Updating Configs
- **Shell changes:** Edit `zshrc` or `zshrc_aliases`, then `source ~/.zshrc` or `ar` alias
- **Neovim changes:** Edit [nvim/](../nvim/) files, changes apply on next Neovim restart
- **Hammerspoon:** Edit [hammerspoon/init.lua](../hammerspoon/init.lua), Ctrl+Alt+Shift+R reloads
- **Packages:** Add to Brewfile, run `brew bundle`

### Uninstall
- Run [unsetup.sh](../unsetup.sh) to remove symlinks

## Project-Specific Conventions

### Naming Patterns
- Config files match their target names: `zshrc` → ~/.zshrc, `tmuxconf` → ~/.tmux.conf
- Lua files follow snake_case (lazy.lua, lspconfig.lua)
- Spoon directories use PascalCase (WindowGrid, ShiftIt)

### Lua Code Style
- Uses **stylua** formatter (configured in [stylua.toml](../stylua.toml))
- Plugins follow lazy.nvim spec (return table with config/opts/keys/cmd)
- LazyVim distro patterns for overriding/extending (see [nvim/lua/plugins/example.lua](../nvim/lua/plugins/example.lua#L10-L50))

### Cross-Platform Support
- Some aliases detect macOS (Darwin) vs Linux: `ll` command uses different flags per platform
- Most tools are macOS-primary (Hammerspoon, Brewfile focused on macOS)

## Integration Points & External Dependencies

- **Homebrew:** Package manager for all tools (zsh, neovim, asdf, fzf, etc.)
- **GitHub CLI (gh):** Included in Brewfile for repo management
- **asdf:** Runtime version manager (Ruby, Node, Elixir, etc. via default-gems)
- **Oh My Zsh:** Installed by setup.sh, provides completion system
- **LazyVim:** Neovim distro providing sensible defaults and plugin ecosystem
- **Spoon ecosystem:** Hammerspoon uses community spoons (WindowGrid, ShiftIt, SpoonInstall)

## Key Files to Understand

| File | Purpose |
|------|---------|
| [setup.sh](../setup.sh) | Main installation & symlink orchestration |
| [zshrc](../zshrc) | Primary shell configuration |
| [zshrc_aliases](../zshrc_aliases) | 400+ shell aliases and functions |
| [nvim/init.lua](../nvim/init.lua) | Neovim entry point (minimal, delegates to lazy.lua) |
| [nvim/lua/config/lazy.lua](../nvim/lua/config/lazy.lua) | Lazy.nvim bootstrap and setup |
| [nvim/lua/plugins/](../nvim/lua/plugins/) | Plugin specifications (LSP, tools, themes) |
| [hammerspoon/init.lua](../hammerspoon/init.lua) | Hammerspoon config and spoon management |
| [Brewfile](../Brewfile) | Homebrew package list (taps, brews, casks) |
| [git/config](../git/config) | Git user and tool configuration |

## When Modifying This Repo

1. **Symlink consistency:** If adding new config file, update [setup.sh](../setup.sh) with symlink command
2. **Lua formatting:** Run `stylua` on any Lua changes (IDE integration available)
3. **Plugin changes:** For Neovim, add/edit files in [nvim/lua/plugins/](../nvim/lua/plugins/), lazy.nvim auto-discovers them
4. **Brewfile changes:** Test with `brew bundle --dry-run` before committing
5. **Shell alias testing:** Test aliases in both bash and zsh (zshrc_aliases header notes compatibility)
