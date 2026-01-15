# Neovim Keymaps - Dotfiles Project

This document lists all important keymaps configured in the Neovim project.

## 📋 Table of Contents

- [Tab Navigation](#tab-navigation)
- [Buffer Management](#buffer-management)
- [Test Plugins](#test-plugins)
- [General Navigation](#general-navigation)
- [Search with Telescope](#search-with-telescope)
- [Opencode](#opencode)
- [AI and Commits](#ai-and-commits)
- [TypeScript](#typescript)
- [Elixir](#elixir)
- [Telescope](#telescope)

---

## 🗂️ Tab Navigation

| Keymap | Function | Description |
|--------|--------|-----------|
| `gb` | `gT` | Go to previous tab |
| `<leader><tab>-` | `:tabm-<CR>` | Move tab to the left |
| `<leader><tab>+` | `:tabm+<CR>` | Move tab to the right |
| `<Tab>` | `:tabnext<CR>` | Next tab |
| `<S-Tab>` | `:tabprevious<CR>` | Previous tab |

---

## 📄 Buffer Management

| Keymap | Function | Description |
|--------|--------|-----------|
| `<leader>bx` | `:%bd\|e#<CR>` | Delete all buffers except the current one |

---

## 🧪 Test Plugins

| Keymap | Function | Description |
|--------|--------|-----------|
| `<leader>ttn` | `:TestNearest<CR>` | Run nearest test |
| `<leader>ttf` | `:TestFile<CR>` | Run file tests |
| `<leader>ttl` | `:TestLast<CR>` | Run last test |

---

## 🚀 General Navigation

| Keymap | Function | Description |
|--------|--------|-----------|
| `<leader>nt` | `:Neotree toggle<CR>` | Toggle Neo-tree |
| `<C-e>` | `:e<cr>` | Open file |
| `<C-o>` | `:noh<cr><esc>` | Remove search highlight |
| `<C-s>` | `:w<cr><esc>` | Save file |
| `<C-Q>` | `:qa<cr><esc>` | Close all files |
| `<C-q>` | `:q<cr><esc>` | Close current file |

---

## 🔍 Search with Telescope

| Keymap | Function | Description |
|--------|--------|-----------|
| `<leader>zb` | Telescope live_grep | Search in .rb files |
| `<leader>zsd` | Telescope live_grep | Search in .rb excluding spec and db |
| `<leader>zss` | Telescope live_grep | Search in .rb excluding spec |
| `<leader>fp` | Telescope find_files | Search plugin files |

---

## 🧠 Opencode

Shortcuts to interact with the opencode.nvim panel.

| Keymap | Mode | Function | Description |
|--------|------|--------|-----------|
| `<C-a>` | Normal/Visual | `opencode.ask("@this: ", { submit = true })` | Open prompt already sending the selected context |
| `<C-x>` | Normal/Visual | `opencode.select()` | Execute suggested action by opencode |
| `<C-.>` | Normal/Terminal | `opencode.toggle()` | Show or hide the opencode panel |
| `go` | Normal/Visual | `opencode.operator("@this ")` | Send selection or movement to opencode |
| `goo` | Normal | `opencode.operator("@this ") .. "_"` | Send current line to opencode |
| `<C-k>` | Normal | `opencode.command("session.half.page.up")` | Scroll half page up in panel |
| `<C-j>` | Normal | `opencode.command("session.half.page.down")` | Scroll half page down in panel |

### Quick Flow

- Select a snippet or use `go{motion}` in Normal mode.
- Press `<C-a>` to open the prompt with context.
- Use `<C-x>` to choose the suggested action (or `Esc` to cancel).
- When opencode asks for permission to change something, confirm with `y` or deny with `n`.

---

## 🤖 AI and Commits

| Keymap | Function | Description |
|--------|--------|-----------|
| `<leader>ai` | `:AICommits<CR>` | Generate commits with AI |

---

## 📝 TypeScript

| Keymap | Function | Description |
|--------|--------|-----------|
| `<leader>co` | `TypescriptOrganizeImports` | Organize imports |
| `<leader>cR` | `TypescriptRenameFile` | Rename file |

---

## 💧 Elixir

| Keymap | Function | Description |
|--------|--------|-----------|
| `<leader>cp` | Manipulate Pipes | Convert to pipe |
| `<leader>cP` | Manipulate Pipes | Convert from pipe |

---

## 🔭 Telescope

### Internal Mappings

| Keymap | Function | Description |
|--------|--------|-----------|
| `<c-t>` (Insert) | `actions.select_tab` | Open selection in new tab |
| `<c-t>` (Normal) | `actions.select_tab` | Open selection in new tab |

---

## 📚 Configured Plugins

### AI and Automation
- **github/copilot.vim** - Autocomplete with AI
- **marco-souza/ollero.nvim** - Interface for Ollama
- **yetone/avante.nvim** - Cursor-like interface
- **skywind3000/vim-gpt-commit** - Automatic commits with AI
- **NickvanDyke/opencode.nvim** - Opencode assistant in Neovim

### Development
- **vim-test** - Test execution
- **typescript.nvim** - Advanced support for TypeScript
- **elixirls** - Language Server for Elixir
- **ruby_lsp** - Language Server for Ruby

### Interface
- **telescope.nvim** - Search and navigation
- **nvim-treesitter** - Syntax highlighting
- **lualine.nvim** - Status bar

---

## 🧭 Quick Guide to Navigation and Search

These are the most used shortcuts for daily workflow:

| Action | Shortcut | Notes |
| :--- | :--- | :--- |
| **Find File** | `<leader> <space>` | Smart search (Find Files) |
| **Find Text** | `<leader> /` | Global search (Live Grep) |
| **Opencode Panel** | `<C-.>` | Show or hide the panel |
| **Send to Opencode** | `go` | Send selection or movement |
| **File Tree** | `<leader> nt` | Toggle Neo-tree |
| **Next Tab** | `<Tab>` | Quick navigation |
| **Previous Tab** | `<S-Tab>` | Quick navigation |
| **Clear Buffers** | `<leader> bx` | Keep only the current one |
| **Open in New Tab** | `<C-t>` | (Inside Telescope) |

---

## 🎯 Usage Tips

1. **Leader Key**: The default leader is `<space>`
2. **Modes**: Keymaps work mostly in Normal mode (`n`)
3. **Plugins**: Many keymaps depend on specific plugins being loaded
4. **LSP**: Some keymaps only work when the Language Server is active

---

## 🔧 Customization

To add new keymaps, edit the file:
```
nvim/lua/config/keymaps.lua
```

To configure specific plugins, edit files in:
```
nvim/lua/plugins/
```

---

*Documentation automatically generated from project configuration.*
