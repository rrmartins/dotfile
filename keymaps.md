# Keymaps do Neovim - Projeto Dotfiles

Este documento lista todos os keymaps importantes configurados no projeto Neovim.

## 📋 Índice

- [Navegação de Abas](#navegação-de-abas)
- [Gerenciamento de Buffers](#gerenciamento-de-buffers)
- [Plugins de Teste](#plugins-de-teste)
- [Navegação Geral](#navegação-geral)
- [Busca com Telescope](#busca-com-telescope)
- [AI e Commits](#ai-e-commits)
- [TypeScript](#typescript)
- [Elixir](#elixir)
- [Telescope](#telescope)

---

## 🗂️ Navegação de Abas

| Keymap | Função | Descrição |
|--------|--------|-----------|
| `gb` | `gT` | Volta para a aba anterior |
| `<leader><tab>-` | `:tabm-<CR>` | Move aba para a esquerda |
| `<leader><tab>+` | `:tabm+<CR>` | Move aba para a direita |
| `<Tab>` | `:tabnext<CR>` | Próxima aba |
| `<S-Tab>` | `:tabprevious<CR>` | Aba anterior |

---

## 📄 Gerenciamento de Buffers

| Keymap | Função | Descrição |
|--------|--------|-----------|
| `<leader>bx` | `:%bd\|e#<CR>` | Deleta todos os buffers exceto o atual |

---

## 🧪 Plugins de Teste

| Keymap | Função | Descrição |
|--------|--------|-----------|
| `<leader>ttn` | `:TestNearest<CR>` | Executa teste mais próximo |
| `<leader>ttf` | `:TestFile<CR>` | Executa testes do arquivo |
| `<leader>ttl` | `:TestLast<CR>` | Executa último teste |

---

## 🚀 Navegação Geral

| Keymap | Função | Descrição |
|--------|--------|-----------|
| `<leader>nt` | `:NERDTreeToggle <CR><esc>` | Alterna NERDTree |
| `<C-e>` | `:e<cr>` | Abre arquivo |
| `<C-o>` | `:noh<cr><esc>` | Remove highlight de busca |
| `<C-s>` | `:w<cr><esc>` | Salva arquivo |
| `<C-Q>` | `:qa<cr><esc>` | Fecha todos os arquivos |
| `<C-q>` | `:q<cr><esc>` | Fecha arquivo atual |

---

## 🔍 Busca com Telescope

| Keymap | Função | Descrição |
|--------|--------|-----------|
| `<leader>zb` | Telescope live_grep | Busca em arquivos .rb |
| `<leader>zsd` | Telescope live_grep | Busca em .rb excluindo spec e db |
| `<leader>zss` | Telescope live_grep | Busca em .rb excluindo spec |
| `<leader>fp` | Telescope find_files | Busca arquivos de plugins |

---

## 🤖 AI e Commits

| Keymap | Função | Descrição |
|--------|--------|-----------|
| `<leader>ai` | `:AICommits<CR>` | Gera commits com IA |

---

## 📝 TypeScript

| Keymap | Função | Descrição |
|--------|--------|-----------|
| `<leader>co` | `TypescriptOrganizeImports` | Organiza imports |
| `<leader>cR` | `TypescriptRenameFile` | Renomeia arquivo |

---

## 💧 Elixir

| Keymap | Função | Descrição |
|--------|--------|-----------|
| `<leader>cp` | Manipulate Pipes | Converte para pipe |
| `<leader>cP` | Manipulate Pipes | Converte de pipe |

---

## 🔭 Telescope

### Mapeamentos Internos

| Keymap | Função | Descrição |
|--------|--------|-----------|
| `<c-t>` (Insert) | `actions.select_tab` | Abre seleção em nova aba |
| `<c-t>` (Normal) | `actions.select_tab` | Abre seleção em nova aba |

---

## 📚 Plugins Configurados

### AI e Automação
- **github/copilot.vim** - Autocompletar com IA
- **marco-souza/ollero.nvim** - Interface para Ollama
- **yetone/avante.nvim** - Interface similar ao Cursor
- **skywind3000/vim-gpt-commit** - Commits automáticos com IA

### Desenvolvimento
- **vim-test** - Execução de testes
- **typescript.nvim** - Suporte avançado para TypeScript
- **elixirls** - Language Server para Elixir
- **ruby_lsp** - Language Server para Ruby

### Interface
- **telescope.nvim** - Busca e navegação
- **nvim-treesitter** - Syntax highlighting
- **lualine.nvim** - Barra de status

---

## 🎯 Dicas de Uso

1. **Leader Key**: O leader padrão é `<space>`
2. **Modos**: Os keymaps funcionam principalmente em modo Normal (`n`)
3. **Plugins**: Muitos keymaps dependem de plugins específicos estarem carregados
4. **LSP**: Alguns keymaps só funcionam quando o Language Server está ativo

---

## 🔧 Personalização

Para adicionar novos keymaps, edite o arquivo:
```
nvim/lua/config/keymaps.lua
```

Para configurar plugins específicos, edite os arquivos em:
```
nvim/lua/plugins/
```

---

*Documentação gerada automaticamente a partir da configuração do projeto.*
