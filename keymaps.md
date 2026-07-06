# Neovim Keymaps

Documento gerado a partir da config em `.config/nvim` com `nvim --headless` e complementado pela leitura dos specs Lua em `.config/nvim/lua/plugins`. A config define `vim.g.mapleader = \\`, portanto `<leader>` aparece como `\` nas tabelas exportadas.

Notas rapidas:
- Total exportado pelo Neovim: 579 mappings globais.
- Modos: `n` normal, `i` insert, `v` visual, `x` visual/select, `s` select, `o` operator-pending, `c` command-line, `t` terminal.
- Entradas `lua callback` sao funcoes Lua; a descricao vem de `desc` quando o plugin/config expos essa informacao.
- Mappings condicionais de buffer, filetype ou UI interna podem aparecer na secao propria mesmo quando nao entram na exportacao global.

## Atalhos Mais Uteis

| Modo | Atalho | Acao |
| --- | --- | --- |
| `n` | `\ ` | Find Files (Root Dir) |
| `n` | `\/` | Grep (Root Dir) |
| `n` | `\,` | Switch Buffer |
| `n` | `\ff` | Find Files (Root Dir) |
| `n` | `\fg` | Find Files (git-files) |
| `n` | `\fb` | Buffers |
| `n` | `\fr` | Recent |
| `n` | `\e` | Explorer NeoTree (Root Dir) |
| `n` | `\nt` | Neotree toggle (custom .config/nvim) |
| `n` | `\ug` | Toggle Git signs |
| `n` | `\aa` | Avante ask |
| `n` | `\at` | Avante toggle |
| `n` | `<C-.>` | Toggle opencode |
| `n/x` | `<C-a>` | Ask opencode with context |
| `n/x` | `go` | Add motion/selection to opencode |
| `i` | `<Tab>` | Accept Copilot suggestion |
| `i` | `<M-Right>` | Accept Copilot word |
| `i` | `<M-C-Right>` | Accept Copilot line |

## Mappings Condicionais e Internos

| Contexto | Modo | Atalho | Acao | Origem |
| --- | --- | --- | --- | --- |
| Elixir LSP | `n` | `\cp` | Manipulate Pipes: converter para pipe | `.config/nvim/lua/plugins/lspconfig.lua` |
| Elixir LSP | `n` | `\cP` | Manipulate Pipes: converter de pipe | `.config/nvim/lua/plugins/lspconfig.lua` |
| Telescope picker | `i` | `<C-t>` | Abrir selecao em nova tab | `.config/nvim/lua/plugins/telescope.lua` |
| Telescope picker | `n` | `<C-t>` | Abrir selecao em nova tab | `.config/nvim/lua/plugins/telescope.lua` |
| Neo-tree | `n` | `mappings padrao` | \`use_default_mappings = true\`; atalhos padrao do neo-tree ficam ativos | `.config/nvim/lua/plugins/neo-tree.lua` |

## Meus Atalhos Customizados

| Modo | Atalho | Acao |
| --- | --- | --- |
| `i` | `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> |
| `i` | `<Tab>` | empty(get(g:, 'copilot_no_tab_map')) ? copilot#Accept() : "\t" |
| `n` | `<C-.>` | Toggle opencode |
| `n` | `<C-Q>` | :q<CR><Esc> |
| `n` | `<S-Tab>` | :tabprevious<CR> |
| `n` | `<Tab>` | :tabnext<CR> |
| `n` | `\ai` | AI Commit message -> :GptCommit<CR> |
| `n` | `\bx` | Delete Buffers Except Current -> :%bd\|e#<CR> |
| `n` | `\e` | Explorer NeoTree (Root Dir) -> \fe |
| `n` | `\nt` | :Neotree toggle<CR> |
| `n` | `\ttf` | Test file -> :TestFile<CR> |
| `n` | `\ttl` | Test last -> :TestLast<CR> |
| `n` | `\ttn` | Test nearest -> :TestNearest<CR> |
| `n` | `\zb` | search files .rb |
| `n` | `\zsd` | Search files .rb excluding spec and db folders |
| `n` | `\zss` | Search files .rb excluding spec folder |
| `n` | `gb` | Go back one tab -> gT |
| `n` | `go` | Add range to opencode |
| `n` | `goo` | Add line to opencode |
| `s` | `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> |
| `s` | `<Tab>` | vim.snippet.jump if active, otherwise <Tab> |
| `t` | `<C-.>` | Toggle opencode |
| `v` | `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> |
| `v` | `<Tab>` | vim.snippet.jump if active, otherwise <Tab> |
| `v` | `go` | Add range to opencode |
| `x` | `go` | Add range to opencode |

## Busca, Ficheiros e Buffers

| Modo | Atalho | Acao |
| --- | --- | --- |
| `n` | `\ ` | Find Files (Root Dir) |
| `n` | `\,` | Switch Buffer -> <Cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR> |
| `n` | `\/` | Grep (Root Dir) |
| `n` | `\:` | Command History -> <Cmd>FzfLua command_history<CR> |
| `n` | `\?` | Buffer Keymaps (which-key) |
| `n` | `\fB` | Buffers (all) -> <Cmd>FzfLua buffers<CR> |
| `n` | `\fE` | Explorer NeoTree (cwd) |
| `n` | `\fF` | Find Files (cwd) |
| `n` | `\fR` | Recent (cwd) |
| `n` | `\fT` | Terminal (cwd) |
| `n` | `\fb` | Buffers -> <Cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR> |
| `n` | `\fc` | Find Config File |
| `n` | `\fe` | Explorer NeoTree (Root Dir) |
| `n` | `\ff` | Find Files (Root Dir) |
| `n` | `\fg` | Find Files (git-files) -> <Cmd>FzfLua git_files<CR> |
| `n` | `\fn` | New File -> <Cmd>enew<CR> |
| `n` | `\fr` | Recent -> <Cmd>FzfLua oldfiles<CR> |
| `n` | `\ft` | Terminal (Root Dir) |
| `n` | `\s"` | Registers -> <Cmd>FzfLua registers<CR> |
| `n` | `\s/` | Search History -> <Cmd>FzfLua search_history<CR> |
| `n` | `\sC` | Commands -> <Cmd>FzfLua commands<CR> |
| `n` | `\sD` | Buffer Diagnostics -> <Cmd>FzfLua diagnostics_document<CR> |
| `n` | `\sG` | Grep (cwd) |
| `n` | `\sH` | Search Highlight Groups -> <Cmd>FzfLua highlights<CR> |
| `n` | `\sM` | Man Pages -> <Cmd>FzfLua man_pages<CR> |
| `n` | `\sR` | Resume -> <Cmd>FzfLua resume<CR> |
| `n` | `\sS` | Goto Symbol (Workspace) |
| `n` | `\sW` | Word (cwd) |
| `n` | `\sa` | Auto Commands -> <Cmd>FzfLua autocmds<CR> |
| `n` | `\sb` | Buffer Lines -> <Cmd>FzfLua lines<CR> |
| `n` | `\sc` | Command History -> <Cmd>FzfLua command_history<CR> |
| `n` | `\sd` | Diagnostics -> <Cmd>FzfLua diagnostics_workspace<CR> |
| `n` | `\sg` | Grep (Root Dir) |
| `n` | `\sh` | Help Pages -> <Cmd>FzfLua help_tags<CR> |
| `n` | `\sj` | Jumplist -> <Cmd>FzfLua jumps<CR> |
| `n` | `\sk` | Key Maps -> <Cmd>FzfLua keymaps<CR> |
| `n` | `\sl` | Location List -> <Cmd>FzfLua loclist<CR> |
| `n` | `\sm` | Jump to Mark -> <Cmd>FzfLua marks<CR> |
| `n` | `\sn` | +noice |
| `n` | `\sna` | Noice All |
| `n` | `\snd` | Dismiss All |
| `n` | `\snh` | Noice History |
| `n` | `\snl` | Noice Last Message |
| `n` | `\snt` | Noice Picker (Telescope/FzfLua) |
| `n` | `\sq` | Quickfix List -> <Cmd>FzfLua quickfix<CR> |
| `n` | `\sr` | Search and Replace |
| `n` | `\ss` | Goto Symbol |
| `n` | `\sw` | Word (Root Dir) |
| `v` | `\sW` | Selection (cwd) |
| `v` | `\sr` | Search and Replace |
| `v` | `\sw` | Selection (Root Dir) |
| `x` | `\sW` | Selection (cwd) |
| `x` | `\sr` | Search and Replace |
| `x` | `\sw` | Selection (Root Dir) |

## Git

| Modo | Atalho | Acao |
| --- | --- | --- |
| `c` | `<C-R><C-G>` | fnameescape(fugitive#Object(@%)) |
| `n` | `<Plug>fugitive:y<C-G>` | :<C-U>call setreg(v:register, fugitive#Object(@%))<CR> |
| `n` | `\fg` | Find Files (git-files) -> <Cmd>FzfLua git_files<CR> |
| `n` | `\gB` | Git Browse (open) |
| `n` | `\gG` | Lazygit (cwd) |
| `n` | `\gL` | Git Log (cwd) |
| `n` | `\gS` | Git Stash -> <Cmd>FzfLua git_stash<CR> |
| `n` | `\gY` | Git Browse (copy) |
| `n` | `\gb` | Git Blame Line |
| `n` | `\gc` | Commits -> <Cmd>FzfLua git_commits<CR> |
| `n` | `\gd` | Git Diff (files) -> <Cmd>FzfLua git_diff<CR> |
| `n` | `\ge` | Git Explorer |
| `n` | `\gf` | Git Current File History |
| `n` | `\gg` | Lazygit (Root Dir) |
| `n` | `\gl` | Commits -> <Cmd>FzfLua git_commits<CR> |
| `n` | `\gs` | Status -> <Cmd>FzfLua git_status<CR> |
| `n` | `\uG` | Toggle Git Signs |
| `n` | `\ug` | Toggle Git signs |
| `n` | `y<C-G>` | :<C-U>call setreg(v:register, fugitive#Object(@%))<CR> |
| `v` | `\gB` | Git Browse (open) |
| `v` | `\gY` | Git Browse (copy) |
| `x` | `\gB` | Git Browse (open) |
| `x` | `\gY` | Git Browse (copy) |

## Avante

| Modo | Atalho | Acao |
| --- | --- | --- |
| `i` | `<Plug>(AvanteSuggestionAccept)` | lua callback |
| `i` | `<Plug>(AvanteSuggestionDismiss)` | lua callback |
| `i` | `<Plug>(AvanteSuggestionNext)` | lua callback |
| `i` | `<Plug>(AvanteSuggestionPrev)` | lua callback |
| `n` | `<Plug>(AvanteAddAllBuffers)` | lua callback |
| `n` | `<Plug>(AvanteAsk)` | lua callback |
| `n` | `<Plug>(AvanteAskNew)` | lua callback |
| `n` | `<Plug>(AvanteBuild)` | lua callback |
| `n` | `<Plug>(AvanteChat)` | lua callback |
| `n` | `<Plug>(AvanteConflictAllTheirs)` | lua callback |
| `n` | `<Plug>(AvanteConflictBoth)` | lua callback |
| `n` | `<Plug>(AvanteConflictCursor)` | lua callback |
| `n` | `<Plug>(AvanteConflictNextConflict)` | lua callback |
| `n` | `<Plug>(AvanteConflictOurs)` | lua callback |
| `n` | `<Plug>(AvanteConflictPrevConflict)` | lua callback |
| `n` | `<Plug>(AvanteConflictTheirs)` | lua callback |
| `n` | `<Plug>(AvanteFocus)` | lua callback |
| `n` | `<Plug>(AvanteRefresh)` | lua callback |
| `n` | `<Plug>(AvanteSelectACPMode)` | lua callback |
| `n` | `<Plug>(AvanteSelectACPModel)` | lua callback |
| `n` | `<Plug>(AvanteSelectHistory)` | lua callback |
| `n` | `<Plug>(AvanteSelectModel)` | lua callback |
| `n` | `<Plug>(AvanteShowRepoMap)` | lua callback |
| `n` | `<Plug>(AvanteStop)` | lua callback |
| `n` | `<Plug>(AvanteToggle)` | lua callback |
| `n` | `<Plug>(AvanteToggleDebug)` | lua callback |
| `n` | `<Plug>(AvanteToggleSelection)` | lua callback |
| `n` | `<Plug>(AvanteToggleSuggestion)` | lua callback |
| `n` | `<Plug>(AvanteZenMode)` | lua callback |
| `n` | `\a?` | avante: select model -> <Plug>(AvanteSelectModel) |
| `n` | `\aB` | avante: add all open buffers -> <Plug>(AvanteAddAllBuffers) |
| `n` | `\aC` | avante: toggle selection -> <Plug>(AvanteToggleSelection) |
| `n` | `\aM` | avante: select ACP model -> <Plug>(AvanteSelectACPModel) |
| `n` | `\aR` | avante: display repo map -> <Plug>(AvanteShowRepoMap) |
| `n` | `\aS` | avante: stop -> <Plug>(AvanteStop) |
| `n` | `\aa` | avante: ask -> <Plug>(AvanteAsk) |
| `n` | `\ad` | avante: toggle debug -> <Plug>(AvanteToggleDebug) |
| `n` | `\af` | avante: focus -> <Plug>(AvanteFocus) |
| `n` | `\ah` | avante: select history -> <Plug>(AvanteSelectHistory) |
| `n` | `\ai` | AI Commit message -> :GptCommit<CR> |
| `n` | `\am` | avante: select ACP mode -> <Plug>(AvanteSelectACPMode) |
| `n` | `\an` | avante: create new ask -> <Plug>(AvanteAskNew) |
| `n` | `\ar` | avante: refresh -> <Plug>(AvanteRefresh) |
| `n` | `\as` | avante: toggle suggestion -> <Plug>(AvanteToggleSuggestion) |
| `n` | `\at` | avante: toggle -> <Plug>(AvanteToggle) |
| `n` | `\az` | avante: toggle Zen Mode -> <Plug>(AvanteZenMode) |
| `s` | `<Plug>(AvanteAsk)` | lua callback |
| `s` | `<Plug>(AvanteAskNew)` | lua callback |
| `s` | `<Plug>(AvanteChat)` | lua callback |
| `s` | `<Plug>(AvanteConflictAllTheirs)` | lua callback |
| `s` | `<Plug>(AvanteConflictBoth)` | lua callback |
| `s` | `<Plug>(AvanteConflictCursor)` | lua callback |
| `s` | `<Plug>(AvanteConflictOurs)` | lua callback |
| `s` | `<Plug>(AvanteConflictTheirs)` | lua callback |
| `s` | `<Plug>(AvanteEdit)` | lua callback |
| `s` | `<Plug>(AvanteZenMode)` | lua callback |
| `s` | `\aa` | avante: ask -> <Plug>(AvanteAsk) |
| `s` | `\ae` | avante: edit -> <Plug>(AvanteEdit) |
| `s` | `\an` | avante: create new ask -> <Plug>(AvanteAskNew) |
| `s` | `\az` | avante: toggle Zen Mode -> <Plug>(AvanteZenMode) |
| `v` | `<Plug>(AvanteAsk)` | lua callback |
| `v` | `<Plug>(AvanteAskNew)` | lua callback |
| `v` | `<Plug>(AvanteChat)` | lua callback |
| `v` | `<Plug>(AvanteConflictAllTheirs)` | lua callback |
| `v` | `<Plug>(AvanteConflictBoth)` | lua callback |
| `v` | `<Plug>(AvanteConflictCursor)` | lua callback |
| `v` | `<Plug>(AvanteConflictOurs)` | lua callback |
| `v` | `<Plug>(AvanteConflictTheirs)` | lua callback |
| `v` | `<Plug>(AvanteEdit)` | lua callback |
| `v` | `<Plug>(AvanteZenMode)` | lua callback |
| `v` | `\aa` | avante: ask -> <Plug>(AvanteAsk) |
| `v` | `\ae` | avante: edit -> <Plug>(AvanteEdit) |
| `v` | `\an` | avante: create new ask -> <Plug>(AvanteAskNew) |
| `v` | `\az` | avante: toggle Zen Mode -> <Plug>(AvanteZenMode) |
| `x` | `<Plug>(AvanteAsk)` | lua callback |
| `x` | `<Plug>(AvanteAskNew)` | lua callback |
| `x` | `<Plug>(AvanteChat)` | lua callback |
| `x` | `<Plug>(AvanteConflictAllTheirs)` | lua callback |
| `x` | `<Plug>(AvanteConflictBoth)` | lua callback |
| `x` | `<Plug>(AvanteConflictCursor)` | lua callback |
| `x` | `<Plug>(AvanteConflictOurs)` | lua callback |
| `x` | `<Plug>(AvanteConflictTheirs)` | lua callback |
| `x` | `<Plug>(AvanteEdit)` | lua callback |
| `x` | `<Plug>(AvanteZenMode)` | lua callback |
| `x` | `\aa` | avante: ask -> <Plug>(AvanteAsk) |
| `x` | `\ae` | avante: edit -> <Plug>(AvanteEdit) |
| `x` | `\an` | avante: create new ask -> <Plug>(AvanteAskNew) |
| `x` | `\az` | avante: toggle Zen Mode -> <Plug>(AvanteZenMode) |

## Copilot

| Modo | Atalho | Acao |
| --- | --- | --- |
| `i` | `<C-]>` | copilot#Dismiss() . "\<C-]>" |
| `i` | `<M-Bslash>` | <Plug>(copilot-suggest) |
| `i` | `<M-C-Right>` | <Plug>(copilot-accept-line) |
| `i` | `<M-Right>` | <Plug>(copilot-accept-word) |
| `i` | `<M-[>` | <Plug>(copilot-previous) |
| `i` | `<M-]>` | <Plug>(copilot-next) |
| `i` | `<Plug>(copilot-accept-line)` | copilot#AcceptLine() |
| `i` | `<Plug>(copilot-accept-word)` | copilot#AcceptWord() |
| `i` | `<Plug>(copilot-dismiss)` | <Cmd>call copilot#Dismiss()<CR> |
| `i` | `<Plug>(copilot-next)` | <Cmd>call copilot#Next()<CR> |
| `i` | `<Plug>(copilot-previous)` | <Cmd>call copilot#Previous()<CR> |
| `i` | `<Plug>(copilot-suggest)` | <Cmd>call copilot#Suggest()<CR> |
| `i` | `<Tab>` | empty(get(g:, 'copilot_no_tab_map')) ? copilot#Accept() : "\t" |

## Mini Pairs / Mini Align / Textobjects

| Modo | Atalho | Acao |
| --- | --- | --- |
| `c` | `"` | Closeopen action for '""' pair -> v:lua.MiniPairs.closeopen('""', "^[^\\]") |
| `c` | `'` | Closeopen action for "''" pair -> v:lua.MiniPairs.closeopen("''", "^[^%a\\]") |
| `c` | `(` | Open action for "()" pair -> v:lua.MiniPairs.open("()", "^[^\\]") |
| `c` | `)` | Close action for "()" pair -> v:lua.MiniPairs.close("()", "^[^\\]") |
| `c` | `<BS>` | MiniPairs <BS> -> v:lua.MiniPairs.bs() |
| `c` | `[` | Open action for "[]" pair -> v:lua.MiniPairs.open("[]", "^[^\\]") |
| `c` | `]` | Close action for "[]" pair -> v:lua.MiniPairs.close("[]", "^[^\\]") |
| `c` | `\`` | Closeopen action for "\`\`" pair -> v:lua.MiniPairs.closeopen("\`\`", "^[^\\]") |
| `c` | `{` | Open action for "{}" pair -> v:lua.MiniPairs.open("{}", "^[^\\]") |
| `c` | `}` | Close action for "{}" pair -> v:lua.MiniPairs.close("{}", "^[^\\]") |
| `i` | `"` | Closeopen action for '""' pair -> v:lua.MiniPairs.closeopen('""', "^[^\\]") |
| `i` | `'` | Closeopen action for "''" pair -> v:lua.MiniPairs.closeopen("''", "^[^%a\\]") |
| `i` | `(` | Open action for "()" pair -> v:lua.MiniPairs.open("()", "^[^\\]") |
| `i` | `)` | Close action for "()" pair -> v:lua.MiniPairs.close("()", "^[^\\]") |
| `i` | `<BS>` | MiniPairs <BS> -> v:lua.MiniPairs.bs() |
| `i` | `<CR>` | MiniPairs <CR> -> v:lua.MiniPairs.cr() |
| `i` | `[` | Open action for "[]" pair -> v:lua.MiniPairs.open("[]", "^[^\\]") |
| `i` | `]` | Close action for "[]" pair -> v:lua.MiniPairs.close("[]", "^[^\\]") |
| `i` | `\`` | Closeopen action for "\`\`" pair -> v:lua.MiniPairs.closeopen("\`\`", "^[^\\]") |
| `i` | `{` | Open action for "{}" pair -> v:lua.MiniPairs.open("{}", "^[^\\]") |
| `i` | `}` | Close action for "{}" pair -> v:lua.MiniPairs.close("{}", "^[^\\]") |
| `n` | `gA` | Align with preview |
| `n` | `ga` | Align |
| `o` | `a` | Around textobject |
| `o` | `al` | Around last textobject |
| `o` | `an` | Around next textobject |
| `o` | `gc` | Comment textobject |
| `o` | `i` | Inside textobject |
| `o` | `il` | Inside last textobject |
| `o` | `in` | Inside next textobject |
| `v` | `a` | Around textobject |
| `v` | `al` | Around last textobject |
| `v` | `an` | Around next textobject |
| `v` | `gA` | Align with preview |
| `v` | `ga` | Align |
| `v` | `i` | Inside textobject |
| `v` | `il` | Inside last textobject |
| `v` | `in` | Inside next textobject |
| `x` | `a` | Around textobject |
| `x` | `al` | Around last textobject |
| `x` | `an` | Around next textobject |
| `x` | `gA` | Align with preview |
| `x` | `ga` | Align |
| `x` | `i` | Inside textobject |
| `x` | `il` | Inside last textobject |
| `x` | `in` | Inside next textobject |

## Surround / Repeat

| Modo | Atalho | Acao |
| --- | --- | --- |
| `i` | `<C-G>S` | <Plug>ISurround |
| `i` | `<Plug>ISurround` | <C-R>=<SNR>7_insert(1)<CR> |
| `i` | `<Plug>Isurround` | <C-R>=<SNR>7_insert()<CR> |
| `n` | `<Plug>CSurround` | :<C-U>call <SNR>7_changesurround(1)<CR> |
| `n` | `<Plug>Csurround` | :<C-U>call <SNR>7_changesurround()<CR> |
| `n` | `<Plug>Dsurround` | :<C-U>call <SNR>7_dosurround(<SNR>7_inputtarget())<CR> |
| `n` | `<Plug>SurroundRepeat` | . |
| `n` | `<Plug>YSsurround` | <SNR>7_opfunc2('setup').'_' |
| `n` | `<Plug>YSurround` | <SNR>7_opfunc2('setup') |
| `n` | `<Plug>Yssurround` | '^'.v:count1.<SNR>7_opfunc('setup').'g_' |
| `n` | `<Plug>Ysurround` | <SNR>7_opfunc('setup') |
| `n` | `cS` | <Plug>CSurround |
| `n` | `yS` | <Plug>YSurround |
| `s` | `<Plug>VSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR> |
| `s` | `<Plug>VgSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 0 : 1)<CR> |
| `v` | `<Plug>VSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR> |
| `v` | `<Plug>VgSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 0 : 1)<CR> |
| `v` | `S` | <Plug>VSurround |
| `v` | `gS` | <Plug>VgSurround |
| `x` | `<Plug>VSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR> |
| `x` | `<Plug>VgSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 0 : 1)<CR> |
| `x` | `S` | <Plug>VSurround |
| `x` | `gS` | <Plug>VgSurround |

## LSP, Diagnosticos e Trouble

| Modo | Atalho | Acao |
| --- | --- | --- |
| `n` | `<C-W><C-D>` | Show diagnostics under the cursor -> <C-W>d |
| `n` | `<C-W>d` | Show diagnostics under the cursor |
| `n` | `[D` | Jump to the first diagnostic in the current buffer |
| `n` | `[d` | Prev Diagnostic |
| `n` | `[q` | Previous Trouble/Quickfix Item |
| `n` | `\cS` | LSP references/definitions/... (Trouble) -> <Cmd>Trouble lsp toggle<CR> |
| `n` | `\cd` | Line Diagnostics |
| `n` | `\cs` | Symbols (Trouble) -> <Cmd>Trouble symbols toggle<CR> |
| `n` | `\sD` | Buffer Diagnostics -> <Cmd>FzfLua diagnostics_document<CR> |
| `n` | `\sd` | Diagnostics -> <Cmd>FzfLua diagnostics_workspace<CR> |
| `n` | `\ud` | Toggle Diagnostics |
| `n` | `\xL` | Location List (Trouble) -> <Cmd>Trouble loclist toggle<CR> |
| `n` | `\xQ` | Quickfix List (Trouble) -> <Cmd>Trouble qflist toggle<CR> |
| `n` | `\xX` | Buffer Diagnostics (Trouble) -> <Cmd>Trouble diagnostics toggle filter.buf=0<CR> |
| `n` | `\xx` | Diagnostics (Trouble) -> <Cmd>Trouble diagnostics toggle<CR> |
| `n` | `]D` | Jump to the last diagnostic in the current buffer |
| `n` | `]d` | Next Diagnostic |
| `n` | `]q` | Next Trouble/Quickfix Item |
| `n` | `gO` | vim.lsp.buf.document_symbol() |
| `n` | `gra` | vim.lsp.buf.code_action() |
| `n` | `gri` | vim.lsp.buf.implementation() |
| `n` | `grn` | vim.lsp.buf.rename() |
| `n` | `grr` | vim.lsp.buf.references() |
| `n` | `grt` | vim.lsp.buf.type_definition() |
| `n` | `grx` | vim.lsp.codelens.run() |
| `v` | `gra` | vim.lsp.buf.code_action() |
| `x` | `gra` | vim.lsp.buf.code_action() |

## Navegacao LazyVim

| Modo | Atalho | Acao |
| --- | --- | --- |
| `c` | `[` | Open action for "[]" pair -> v:lua.MiniPairs.open("[]", "^[^\\]") |
| `c` | `]` | Close action for "[]" pair -> v:lua.MiniPairs.close("[]", "^[^\\]") |
| `i` | `<C-B>` | Scroll Backward |
| `i` | `<C-F>` | Scroll Forward |
| `i` | `[` | Open action for "[]" pair -> v:lua.MiniPairs.open("[]", "^[^\\]") |
| `i` | `]` | Close action for "[]" pair -> v:lua.MiniPairs.close("[]", "^[^\\]") |
| `n` | `<C-B>` | Scroll Backward |
| `n` | `<C-F>` | Scroll Forward |
| `n` | `<C-L>` | Go to Right Window -> <C-W>l |
| `n` | `Y` | :help Y-default -> y$ |
| `n` | `[ ` | Add empty line above cursor |
| `n` | `[%` | <Plug>(MatchitNormalMultiBackward) |
| `n` | `[<C-L>` | :lpfile |
| `n` | `[<C-Q>` | :cpfile |
| `n` | `[<C-T>` | :ptprevious |
| `n` | `[A` | :rewind |
| `n` | `[B` | :brewind |
| `n` | `[D` | Jump to the first diagnostic in the current buffer |
| `n` | `[L` | :lrewind |
| `n` | `[Q` | :crewind |
| `n` | `[T` | :trewind |
| `n` | `[a` | :previous |
| `n` | `[b` | Prev Buffer -> <Cmd>bprevious<CR> |
| `n` | `[d` | Prev Diagnostic |
| `n` | `[e` | Prev Error |
| `n` | `[l` | :lprevious |
| `n` | `[q` | Previous Trouble/Quickfix Item |
| `n` | `[t` | :tprevious |
| `n` | `[w` | Prev Warning |
| `n` | `] ` | Add empty line below cursor |
| `n` | `]%` | <Plug>(MatchitNormalMultiForward) |
| `n` | `]<C-L>` | :lnfile |
| `n` | `]<C-Q>` | :cnfile |
| `n` | `]<C-T>` | :ptnext |
| `n` | `]A` | :last |
| `n` | `]B` | :blast |
| `n` | `]D` | Jump to the last diagnostic in the current buffer |
| `n` | `]L` | :llast |
| `n` | `]Q` | :clast |
| `n` | `]T` | :tlast |
| `n` | `]a` | :next |
| `n` | `]b` | Next Buffer -> <Cmd>bnext<CR> |
| `n` | `]d` | Next Diagnostic |
| `n` | `]e` | Next Error |
| `n` | `]l` | :lnext |
| `n` | `]q` | Next Trouble/Quickfix Item |
| `n` | `]t` | :tnext |
| `n` | `]w` | Next Warning |
| `n` | `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `o` | `[%` | <Plug>(MatchitOperationMultiBackward) |
| `o` | `]%` | <Plug>(MatchitOperationMultiForward) |
| `s` | `<C-B>` | Scroll Backward |
| `s` | `<C-F>` | Scroll Forward |
| `v` | `<C-B>` | Scroll Backward |
| `v` | `<C-F>` | Scroll Forward |
| `v` | `[%` | <Plug>(MatchitVisualMultiBackward) |
| `v` | `[n` | Select previous node |
| `v` | `]%` | <Plug>(MatchitVisualMultiForward) |
| `v` | `]n` | Select next node |
| `v` | `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `x` | `[%` | <Plug>(MatchitVisualMultiBackward) |
| `x` | `[n` | Select previous node |
| `x` | `]%` | <Plug>(MatchitVisualMultiForward) |
| `x` | `]n` | Select next node |
| `x` | `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |

## Todos os Mappings Exportados

### Normal (`n`)

| Atalho | Acao/Descricao | Expr | Silent | Noremap |
| --- | --- | --- | --- | --- |
| `%` | <Plug>(MatchitNormalForward) |  | yes |  |
| `&` | :help &-default -> :&&<CR> |  |  | yes |
| `<C-.>` | Toggle opencode |  | yes | yes |
| `<C-/>` | Terminal (Root Dir) |  | yes | yes |
| `<C-A>` | Ask opencode |  | yes | yes |
| `<C-B>` | Scroll Backward | yes | yes | yes |
| `<C-Down>` | Decrease Window Height -> <Cmd>resize -2<CR> |  | yes | yes |
| `<C-E>` | :e<CR> |  | yes | yes |
| `<C-F>` | Scroll Forward | yes | yes | yes |
| `<C-H>` | Go to Left Window -> <C-W>h |  | yes | yes |
| `<C-J>` | Opencode half page down |  | yes | yes |
| `<C-K>` | Opencode half page up |  | yes | yes |
| `<C-L>` | Go to Right Window -> <C-W>l |  | yes | yes |
| `<C-Left>` | Decrease Window Width -> <Cmd>vertical resize -2<CR> |  | yes | yes |
| `<C-O>` | :noh<CR><Esc> |  | yes | yes |
| `<C-Q>` | :q<CR><Esc> |  | yes | yes |
| `<C-Right>` | Increase Window Width -> <Cmd>vertical resize +2<CR> |  | yes | yes |
| `<C-S>` | :w<CR><Esc> |  | yes | yes |
| `<C-Up>` | Increase Window Height -> <Cmd>resize +2<CR> |  | yes | yes |
| `<C-W> ` | Window Hydra Mode (which-key) |  |  | yes |
| `<C-W><C-D>` | Show diagnostics under the cursor -> <C-W>d |  |  |  |
| `<C-W>d` | Show diagnostics under the cursor |  |  | yes |
| `<C-X>` | Execute opencode action |  | yes | yes |
| `<C-_>` | which_key_ignore |  | yes | yes |
| `<Down>` | Down -> v:count == 0 ? 'gj' : 'j' | yes | yes | yes |
| `<Esc>` | Escape and Clear hlsearch | yes | yes | yes |
| `<M-j>` | Move Down -> <Cmd>execute 'move .+' . v:count1<CR>== |  | yes | yes |
| `<M-k>` | Move Up -> <Cmd>execute 'move .-' . (v:count1 + 1)<CR>== |  | yes | yes |
| `<Plug>(AvanteAddAllBuffers)` | lua callback |  |  | yes |
| `<Plug>(AvanteAsk)` | lua callback |  |  | yes |
| `<Plug>(AvanteAskNew)` | lua callback |  |  | yes |
| `<Plug>(AvanteBuild)` | lua callback |  |  | yes |
| `<Plug>(AvanteChat)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictAllTheirs)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictBoth)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictCursor)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictNextConflict)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictOurs)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictPrevConflict)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictTheirs)` | lua callback |  |  | yes |
| `<Plug>(AvanteFocus)` | lua callback |  |  | yes |
| `<Plug>(AvanteRefresh)` | lua callback |  |  | yes |
| `<Plug>(AvanteSelectACPMode)` | lua callback |  |  | yes |
| `<Plug>(AvanteSelectACPModel)` | lua callback |  |  | yes |
| `<Plug>(AvanteSelectHistory)` | lua callback |  |  | yes |
| `<Plug>(AvanteSelectModel)` | lua callback |  |  | yes |
| `<Plug>(AvanteShowRepoMap)` | lua callback |  | yes | yes |
| `<Plug>(AvanteStop)` | lua callback |  |  | yes |
| `<Plug>(AvanteToggle)` | lua callback |  |  | yes |
| `<Plug>(AvanteToggleDebug)` | lua callback |  |  | yes |
| `<Plug>(AvanteToggleSelection)` | lua callback |  |  | yes |
| `<Plug>(AvanteToggleSuggestion)` | lua callback |  |  | yes |
| `<Plug>(AvanteZenMode)` | lua callback |  |  | yes |
| `<Plug>(MatchitNormalBackward)` | :<C-U>call matchit#Match_wrapper('',0,'n')<CR> |  | yes | yes |
| `<Plug>(MatchitNormalForward)` | :<C-U>call matchit#Match_wrapper('',1,'n')<CR> |  | yes | yes |
| `<Plug>(MatchitNormalMultiBackward)` | :<C-U>call matchit#MultiMatch("bW", "n")<CR> |  | yes | yes |
| `<Plug>(MatchitNormalMultiForward)` | :<C-U>call matchit#MultiMatch("W",  "n")<CR> |  | yes | yes |
| `<Plug>(dial-decrement)` | <Cmd>lua require"dial.command".select_augend_normal()<CR><Cmd>let &opfunc="dial#operator#decrement_normal"<CR>g@<Cmd>lua require("dial.command").textobj()<CR> |  |  | yes |
| `<Plug>(dial-g-decrement)` | <Cmd>lua require"dial.command".select_augend_gnormal()<CR><Cmd>let &opfunc="dial#operator#decrement_gnormal"<CR>g@<Cmd>lua require("dial.command").textobj()<CR> |  |  | yes |
| `<Plug>(dial-g-increment)` | <Cmd>lua require"dial.command".select_augend_gnormal()<CR><Cmd>let &opfunc="dial#operator#increment_gnormal"<CR>g@<Cmd>lua require("dial.command").textobj()<CR> |  |  | yes |
| `<Plug>(dial-increment)` | <Cmd>lua require"dial.command".select_augend_normal()<CR><Cmd>let &opfunc="dial#operator#increment_normal"<CR>g@<Cmd>lua require("dial.command").textobj()<CR> |  |  | yes |
| `<Plug>CSurround` | :<C-U>call <SNR>7_changesurround(1)<CR> |  | yes | yes |
| `<Plug>Csurround` | :<C-U>call <SNR>7_changesurround()<CR> |  | yes | yes |
| `<Plug>Dsurround` | :<C-U>call <SNR>7_dosurround(<SNR>7_inputtarget())<CR> |  | yes | yes |
| `<Plug>PlenaryTestFile` | :lua require('plenary.test_harness').test_file(vim.fn.expand("%:p"))<CR> |  |  | yes |
| `<Plug>SurroundRepeat` | . |  | yes | yes |
| `<Plug>YSsurround` | <SNR>7_opfunc2('setup').'_' | yes |  | yes |
| `<Plug>YSurround` | <SNR>7_opfunc2('setup') | yes |  | yes |
| `<Plug>Yssurround` | '^'.v:count1.<SNR>7_opfunc('setup').'g_' | yes |  | yes |
| `<Plug>Ysurround` | <SNR>7_opfunc('setup') | yes |  | yes |
| `<Plug>fugitive:` | lua callback |  |  |  |
| `<Plug>fugitive:y<C-G>` | :<C-U>call setreg(v:register, fugitive#Object(@%))<CR> |  | yes |  |
| `<S-Tab>` | :tabprevious<CR> |  | yes | yes |
| `<Tab>` | :tabnext<CR> |  | yes | yes |
| `<Up>` | Up -> v:count == 0 ? 'gk' : 'k' | yes | yes | yes |
| `H` | Prev Buffer -> <Cmd>bprevious<CR> |  | yes | yes |
| `L` | Next Buffer -> <Cmd>bnext<CR> |  | yes | yes |
| `N` | Prev Search Result -> 'nN'[v:searchforward].'zv' | yes | yes | yes |
| `Y` | :help Y-default -> y$ |  |  | yes |
| `[ ` | Add empty line above cursor | yes |  | yes |
| `[%` | <Plug>(MatchitNormalMultiBackward) |  | yes |  |
| `[<C-L>` | :lpfile |  |  | yes |
| `[<C-Q>` | :cpfile |  |  | yes |
| `[<C-T>` | :ptprevious |  |  | yes |
| `[A` | :rewind |  |  | yes |
| `[B` | :brewind |  |  | yes |
| `[D` | Jump to the first diagnostic in the current buffer |  |  | yes |
| `[L` | :lrewind |  |  | yes |
| `[Q` | :crewind |  |  | yes |
| `[T` | :trewind |  |  | yes |
| `[a` | :previous |  |  | yes |
| `[b` | Prev Buffer -> <Cmd>bprevious<CR> |  | yes | yes |
| `[d` | Prev Diagnostic |  | yes | yes |
| `[e` | Prev Error |  | yes | yes |
| `[l` | :lprevious |  |  | yes |
| `[q` | Previous Trouble/Quickfix Item |  |  | yes |
| `[t` | :tprevious |  |  | yes |
| `[w` | Prev Warning |  | yes | yes |
| `\ ` | Find Files (Root Dir) |  |  | yes |
| `\,` | Switch Buffer -> <Cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR> |  |  | yes |
| `\-` | Split Window Below -> <C-W>s |  | yes | yes |
| `\.` | Toggle Scratch Buffer |  |  | yes |
| `\/` | Grep (Root Dir) |  |  | yes |
| `\:` | Command History -> <Cmd>FzfLua command_history<CR> |  |  | yes |
| `\<Tab>+` | Move tab to the right -> :tabm+<CR> |  | yes | yes |
| `\<Tab>-` | Move tab to the left -> :tabm-<CR> |  | yes | yes |
| `\<Tab><Tab>` | New Tab -> <Cmd>tabnew<CR> |  | yes | yes |
| `\<Tab>[` | Previous Tab -> <Cmd>tabprevious<CR> |  | yes | yes |
| `\<Tab>]` | Next Tab -> <Cmd>tabnext<CR> |  | yes | yes |
| `\<Tab>d` | Close Tab -> <Cmd>tabclose<CR> |  | yes | yes |
| `\<Tab>f` | First Tab -> <Cmd>tabfirst<CR> |  | yes | yes |
| `\<Tab>l` | Last Tab -> <Cmd>tablast<CR> |  | yes | yes |
| `\<Tab>o` | Close Other Tabs -> <Cmd>tabonly<CR> |  | yes | yes |
| `\?` | Buffer Keymaps (which-key) |  |  | yes |
| `\E` | Explorer NeoTree (cwd) -> \fE |  |  |  |
| `\K` | Keywordprg -> <Cmd>norm! K<CR> |  | yes | yes |
| `\L` | LazyVim Changelog |  | yes | yes |
| `\S` | Select Scratch Buffer |  |  | yes |
| `\\`` | Switch to Other Buffer -> <Cmd>e #<CR> |  | yes | yes |
| `\a?` | avante: select model -> <Plug>(AvanteSelectModel) |  | yes | yes |
| `\aB` | avante: add all open buffers -> <Plug>(AvanteAddAllBuffers) |  | yes | yes |
| `\aC` | avante: toggle selection -> <Plug>(AvanteToggleSelection) |  | yes | yes |
| `\aM` | avante: select ACP model -> <Plug>(AvanteSelectACPModel) |  | yes | yes |
| `\aR` | avante: display repo map -> <Plug>(AvanteShowRepoMap) |  | yes | yes |
| `\aS` | avante: stop -> <Plug>(AvanteStop) |  | yes | yes |
| `\aa` | avante: ask -> <Plug>(AvanteAsk) |  | yes | yes |
| `\ad` | avante: toggle debug -> <Plug>(AvanteToggleDebug) |  | yes | yes |
| `\af` | avante: focus -> <Plug>(AvanteFocus) |  | yes | yes |
| `\ah` | avante: select history -> <Plug>(AvanteSelectHistory) |  | yes | yes |
| `\ai` | AI Commit message -> :GptCommit<CR> |  | yes | yes |
| `\am` | avante: select ACP mode -> <Plug>(AvanteSelectACPMode) |  | yes | yes |
| `\an` | avante: create new ask -> <Plug>(AvanteAskNew) |  | yes | yes |
| `\ar` | avante: refresh -> <Plug>(AvanteRefresh) |  | yes | yes |
| `\as` | avante: toggle suggestion -> <Plug>(AvanteToggleSuggestion) |  | yes | yes |
| `\at` | avante: toggle -> <Plug>(AvanteToggle) |  | yes | yes |
| `\az` | avante: toggle Zen Mode -> <Plug>(AvanteZenMode) |  | yes | yes |
| `\bD` | Delete Buffer and Window -> <Cmd>:bd<CR> |  | yes | yes |
| `\bb` | Switch to Other Buffer -> <Cmd>e #<CR> |  | yes | yes |
| `\bd` | Delete Buffer |  | yes | yes |
| `\be` | Buffer Explorer |  |  | yes |
| `\bi` | Delete Invisible Buffers |  | yes | yes |
| `\bo` | Delete Other Buffers |  | yes | yes |
| `\bx` | Delete Buffers Except Current -> :%bd\|e#<CR> |  | yes | yes |
| `\cF` | Format Injected Langs |  |  | yes |
| `\cS` | LSP references/definitions/... (Trouble) -> <Cmd>Trouble lsp toggle<CR> |  |  | yes |
| `\cd` | Line Diagnostics |  | yes | yes |
| `\cf` | Format |  | yes | yes |
| `\cm` | Mason -> <Cmd>Mason<CR> |  |  | yes |
| `\cs` | Symbols (Trouble) -> <Cmd>Trouble symbols toggle<CR> |  |  | yes |
| `\dph` | Toggle Profiler Highlights |  | yes | yes |
| `\dpp` | Toggle Profiler |  | yes | yes |
| `\dps` | Profiler Scratch Buffer |  |  | yes |
| `\e` | Explorer NeoTree (Root Dir) -> \fe |  |  |  |
| `\ec` | Elixir Module Complete |  |  | yes |
| `\ed` | Elixir View Docs |  |  | yes |
| `\em` | Elixir View Docs (mix libs) |  |  | yes |
| `\fB` | Buffers (all) -> <Cmd>FzfLua buffers<CR> |  |  | yes |
| `\fE` | Explorer NeoTree (cwd) |  |  | yes |
| `\fF` | Find Files (cwd) |  |  | yes |
| `\fR` | Recent (cwd) |  |  | yes |
| `\fT` | Terminal (cwd) |  | yes | yes |
| `\fb` | Buffers -> <Cmd>FzfLua buffers sort_mru=true sort_lastused=true<CR> |  |  | yes |
| `\fc` | Find Config File |  |  | yes |
| `\fe` | Explorer NeoTree (Root Dir) |  |  | yes |
| `\ff` | Find Files (Root Dir) |  |  | yes |
| `\fg` | Find Files (git-files) -> <Cmd>FzfLua git_files<CR> |  |  | yes |
| `\fn` | New File -> <Cmd>enew<CR> |  | yes | yes |
| `\fr` | Recent -> <Cmd>FzfLua oldfiles<CR> |  |  | yes |
| `\ft` | Terminal (Root Dir) |  | yes | yes |
| `\gB` | Git Browse (open) |  | yes | yes |
| `\gG` | Lazygit (cwd) |  | yes | yes |
| `\gL` | Git Log (cwd) |  | yes | yes |
| `\gS` | Git Stash -> <Cmd>FzfLua git_stash<CR> |  |  | yes |
| `\gY` | Git Browse (copy) |  | yes | yes |
| `\gb` | Git Blame Line |  | yes | yes |
| `\gc` | Commits -> <Cmd>FzfLua git_commits<CR> |  |  | yes |
| `\gd` | Git Diff (files) -> <Cmd>FzfLua git_diff<CR> |  |  | yes |
| `\ge` | Git Explorer |  |  | yes |
| `\gf` | Git Current File History |  | yes | yes |
| `\gg` | Lazygit (Root Dir) |  | yes | yes |
| `\gl` | Commits -> <Cmd>FzfLua git_commits<CR> |  |  | yes |
| `\gs` | Status -> <Cmd>FzfLua git_status<CR> |  |  | yes |
| `\l` | Lazy -> <Cmd>Lazy<CR> |  | yes | yes |
| `\n` | Notification History |  |  | yes |
| `\nt` | :Neotree toggle<CR> |  | yes | yes |
| `\qS` | Select Session |  |  | yes |
| `\qd` | Don't Save Current Session |  |  | yes |
| `\ql` | Restore Last Session |  |  | yes |
| `\qq` | Quit All -> <Cmd>qa<CR> |  | yes | yes |
| `\qs` | Restore Session |  |  | yes |
| `\s"` | Registers -> <Cmd>FzfLua registers<CR> |  |  | yes |
| `\s/` | Search History -> <Cmd>FzfLua search_history<CR> |  |  | yes |
| `\sC` | Commands -> <Cmd>FzfLua commands<CR> |  |  | yes |
| `\sD` | Buffer Diagnostics -> <Cmd>FzfLua diagnostics_document<CR> |  |  | yes |
| `\sG` | Grep (cwd) |  |  | yes |
| `\sH` | Search Highlight Groups -> <Cmd>FzfLua highlights<CR> |  |  | yes |
| `\sM` | Man Pages -> <Cmd>FzfLua man_pages<CR> |  |  | yes |
| `\sR` | Resume -> <Cmd>FzfLua resume<CR> |  |  | yes |
| `\sS` | Goto Symbol (Workspace) |  |  | yes |
| `\sW` | Word (cwd) |  |  | yes |
| `\sa` | Auto Commands -> <Cmd>FzfLua autocmds<CR> |  |  | yes |
| `\sb` | Buffer Lines -> <Cmd>FzfLua lines<CR> |  |  | yes |
| `\sc` | Command History -> <Cmd>FzfLua command_history<CR> |  |  | yes |
| `\sd` | Diagnostics -> <Cmd>FzfLua diagnostics_workspace<CR> |  |  | yes |
| `\sg` | Grep (Root Dir) |  |  | yes |
| `\sh` | Help Pages -> <Cmd>FzfLua help_tags<CR> |  |  | yes |
| `\sj` | Jumplist -> <Cmd>FzfLua jumps<CR> |  |  | yes |
| `\sk` | Key Maps -> <Cmd>FzfLua keymaps<CR> |  |  | yes |
| `\sl` | Location List -> <Cmd>FzfLua loclist<CR> |  |  | yes |
| `\sm` | Jump to Mark -> <Cmd>FzfLua marks<CR> |  |  | yes |
| `\sn` | +noice |  |  | yes |
| `\sna` | Noice All |  |  | yes |
| `\snd` | Dismiss All |  |  | yes |
| `\snh` | Noice History |  |  | yes |
| `\snl` | Noice Last Message |  |  | yes |
| `\snt` | Noice Picker (Telescope/FzfLua) |  |  | yes |
| `\sq` | Quickfix List -> <Cmd>FzfLua quickfix<CR> |  |  | yes |
| `\sr` | Search and Replace |  |  | yes |
| `\ss` | Goto Symbol |  |  | yes |
| `\sw` | Word (Root Dir) |  |  | yes |
| `\ttf` | Test file -> :TestFile<CR> |  | yes | yes |
| `\ttl` | Test last -> :TestLast<CR> |  | yes | yes |
| `\ttn` | Test nearest -> :TestNearest<CR> |  | yes | yes |
| `\uA` | Toggle Tabline |  | yes | yes |
| `\uC` | Colorscheme with Preview |  |  | yes |
| `\uD` | Toggle Dimming |  | yes | yes |
| `\uF` | Toggle Auto Format (Buffer) |  | yes | yes |
| `\uG` | Toggle Git Signs |  | yes | yes |
| `\uI` | Inspect Tree |  | yes | yes |
| `\uL` | Toggle Relative Number |  | yes | yes |
| `\uS` | Toggle Smooth Scroll |  | yes | yes |
| `\uT` | Toggle Treesitter Highlight |  | yes | yes |
| `\uZ` | Toggle Zoom Mode |  | yes | yes |
| `\ua` | Toggle Animations |  | yes | yes |
| `\ub` | Toggle Dark Background |  | yes | yes |
| `\uc` | Toggle Conceal Level |  | yes | yes |
| `\ud` | Toggle Diagnostics |  | yes | yes |
| `\uf` | Toggle Auto Format (Global) |  | yes | yes |
| `\ug` | Toggle Git signs |  |  | yes |
| `\uh` | Toggle Inlay Hints |  | yes | yes |
| `\ui` | Inspect Pos |  | yes | yes |
| `\ul` | Toggle Line Numbers |  | yes | yes |
| `\um` | Toggle Render Markdown |  | yes | yes |
| `\un` | Dismiss All Notifications |  |  | yes |
| `\up` | Toggle Mini Pairs |  | yes | yes |
| `\ur` | Redraw / Clear hlsearch / Diff Update -> <Cmd>nohlsearch\|diffupdate\|normal! <C-L><CR> |  | yes | yes |
| `\us` | Toggle Spelling |  | yes | yes |
| `\uw` | Toggle Wrap |  | yes | yes |
| `\uz` | Toggle Zen Mode |  | yes | yes |
| `\wd` | Delete Window -> <C-W>c |  | yes | yes |
| `\wm` | Toggle Zoom Mode |  | yes | yes |
| `\xL` | Location List (Trouble) -> <Cmd>Trouble loclist toggle<CR> |  |  | yes |
| `\xQ` | Quickfix List (Trouble) -> <Cmd>Trouble qflist toggle<CR> |  |  | yes |
| `\xX` | Buffer Diagnostics (Trouble) -> <Cmd>Trouble diagnostics toggle filter.buf=0<CR> |  |  | yes |
| `\xl` | Location List |  | yes | yes |
| `\xq` | Quickfix List |  | yes | yes |
| `\xx` | Diagnostics (Trouble) -> <Cmd>Trouble diagnostics toggle<CR> |  |  | yes |
| `\zb` | search files .rb |  |  | yes |
| `\zsd` | Search files .rb excluding spec and db folders |  |  | yes |
| `\zss` | Search files .rb excluding spec folder |  |  | yes |
| `\\|` | Split Window Right -> <C-W>v |  | yes | yes |
| `] ` | Add empty line below cursor | yes |  | yes |
| `]%` | <Plug>(MatchitNormalMultiForward) |  | yes |  |
| `]<C-L>` | :lnfile |  |  | yes |
| `]<C-Q>` | :cnfile |  |  | yes |
| `]<C-T>` | :ptnext |  |  | yes |
| `]A` | :last |  |  | yes |
| `]B` | :blast |  |  | yes |
| `]D` | Jump to the last diagnostic in the current buffer |  |  | yes |
| `]L` | :llast |  |  | yes |
| `]Q` | :clast |  |  | yes |
| `]T` | :tlast |  |  | yes |
| `]a` | :next |  |  | yes |
| `]b` | Next Buffer -> <Cmd>bnext<CR> |  | yes | yes |
| `]d` | Next Diagnostic |  | yes | yes |
| `]e` | Next Error |  | yes | yes |
| `]l` | :lnext |  |  | yes |
| `]q` | Next Trouble/Quickfix Item |  |  | yes |
| `]t` | :tnext |  |  | yes |
| `]w` | Next Warning |  | yes | yes |
| `cS` | <Plug>CSurround |  |  |  |
| `cs` | <Plug>Csurround |  |  |  |
| `ds` | <Plug>Dsurround |  |  |  |
| `g%` | <Plug>(MatchitNormalBackward) |  | yes |  |
| `g<C-A>` | Increment | yes |  | yes |
| `g<C-X>` | Decrement | yes |  | yes |
| `gA` | Align with preview | yes | yes | yes |
| `gO` | vim.lsp.buf.document_symbol() |  |  | yes |
| `g[` | Move to left "around" | yes | yes |  |
| `g]` | Move to right "around" | yes | yes |  |
| `ga` | Align | yes | yes | yes |
| `gb` | Go back one tab -> gT |  | yes | yes |
| `gc` | Toggle comment | yes |  | yes |
| `gcO` | Add Comment Above -> O<Esc>Vcx<Esc><Cmd>normal gcc<CR>fxa<BS> |  | yes | yes |
| `gcc` | Toggle comment line | yes |  | yes |
| `gco` | Add Comment Below -> o<Esc>Vcx<Esc><Cmd>normal gcc<CR>fxa<BS> |  | yes | yes |
| `go` | Add range to opencode | yes | yes | yes |
| `goo` | Add line to opencode | yes | yes | yes |
| `gra` | vim.lsp.buf.code_action() |  |  | yes |
| `gri` | vim.lsp.buf.implementation() |  |  | yes |
| `grn` | vim.lsp.buf.rename() |  |  | yes |
| `grr` | vim.lsp.buf.references() |  |  | yes |
| `grt` | vim.lsp.buf.type_definition() |  |  | yes |
| `grx` | vim.lsp.codelens.run() |  |  | yes |
| `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |  |  | yes |
| `j` | Down -> v:count == 0 ? 'gj' : 'j' | yes | yes | yes |
| `k` | Up -> v:count == 0 ? 'gk' : 'k' | yes | yes | yes |
| `n` | Next Search Result -> 'Nn'[v:searchforward].'zv' | yes | yes | yes |
| `y<C-G>` | :<C-U>call setreg(v:register, fugitive#Object(@%))<CR> |  | yes |  |
| `yS` | <Plug>YSurround |  |  |  |
| `ySS` | <Plug>YSsurround |  |  |  |
| `ySs` | <Plug>YSsurround |  |  |  |
| `ys` | <Plug>Ysurround |  |  |  |
| `yss` | <Plug>Yssurround |  |  |  |

### Insert (`i`)

| Atalho | Acao/Descricao | Expr | Silent | Noremap |
| --- | --- | --- | --- | --- |
| `"` | Closeopen action for '""' pair -> v:lua.MiniPairs.closeopen('""', "^[^\\]") | yes |  | yes |
| `'` | Closeopen action for "''" pair -> v:lua.MiniPairs.closeopen("''", "^[^%a\\]") | yes |  | yes |
| `(` | Open action for "()" pair -> v:lua.MiniPairs.open("()", "^[^\\]") | yes |  | yes |
| `)` | Close action for "()" pair -> v:lua.MiniPairs.close("()", "^[^\\]") | yes |  | yes |
| `,` | ,<C-G>u |  | yes | yes |
| `.` | .<C-G>u |  | yes | yes |
| `;` | ;<C-G>u |  | yes | yes |
| `<BS>` | MiniPairs <BS> -> v:lua.MiniPairs.bs() | yes | yes | yes |
| `<C-B>` | Scroll Backward | yes | yes | yes |
| `<C-F>` | Scroll Forward | yes | yes | yes |
| `<C-G>S` | <Plug>ISurround |  |  |  |
| `<C-G>s` | <Plug>Isurround |  |  |  |
| `<C-S>` | Save File -> <Cmd>w<CR><Esc> |  | yes | yes |
| `<C-U>` | :help i_CTRL-U-default -> <C-G>u<C-U> |  |  | yes |
| `<C-W>` | :help i_CTRL-W-default -> <C-G>u<C-W> |  |  | yes |
| `<C-]>` | copilot#Dismiss() . "\<C-]>" | yes | yes |  |
| `<CR>` | MiniPairs <CR> -> v:lua.MiniPairs.cr() | yes | yes | yes |
| `<Esc>` | Escape and Clear hlsearch | yes | yes | yes |
| `<M-Bslash>` | <Plug>(copilot-suggest) |  |  |  |
| `<M-C-Right>` | <Plug>(copilot-accept-line) |  |  |  |
| `<M-Right>` | <Plug>(copilot-accept-word) |  |  |  |
| `<M-[>` | <Plug>(copilot-previous) |  |  |  |
| `<M-]>` | <Plug>(copilot-next) |  |  |  |
| `<M-j>` | Move Down -> <Esc><Cmd>m .+1<CR>==gi |  | yes | yes |
| `<M-k>` | Move Up -> <Esc><Cmd>m .-2<CR>==gi |  | yes | yes |
| `<Plug>(AvanteSuggestionAccept)` | lua callback |  | yes | yes |
| `<Plug>(AvanteSuggestionDismiss)` | lua callback |  | yes | yes |
| `<Plug>(AvanteSuggestionNext)` | lua callback |  | yes | yes |
| `<Plug>(AvanteSuggestionPrev)` | lua callback |  | yes | yes |
| `<Plug>(copilot-accept-line)` | copilot#AcceptLine() | yes | yes |  |
| `<Plug>(copilot-accept-word)` | copilot#AcceptWord() | yes | yes |  |
| `<Plug>(copilot-dismiss)` | <Cmd>call copilot#Dismiss()<CR> |  |  |  |
| `<Plug>(copilot-next)` | <Cmd>call copilot#Next()<CR> |  |  |  |
| `<Plug>(copilot-previous)` | <Cmd>call copilot#Previous()<CR> |  |  |  |
| `<Plug>(copilot-suggest)` | <Cmd>call copilot#Suggest()<CR> |  |  |  |
| `<Plug>ISurround` | <C-R>=<SNR>7_insert(1)<CR> |  | yes | yes |
| `<Plug>Isurround` | <C-R>=<SNR>7_insert()<CR> |  | yes | yes |
| `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> | yes | yes | yes |
| `<Tab>` | empty(get(g:, 'copilot_no_tab_map')) ? copilot#Accept() : "\t" | yes | yes |  |
| `[` | Open action for "[]" pair -> v:lua.MiniPairs.open("[]", "^[^\\]") | yes |  | yes |
| `]` | Close action for "[]" pair -> v:lua.MiniPairs.close("[]", "^[^\\]") | yes |  | yes |
| `\`` | Closeopen action for "\`\`" pair -> v:lua.MiniPairs.closeopen("\`\`", "^[^\\]") | yes |  | yes |
| `{` | Open action for "{}" pair -> v:lua.MiniPairs.open("{}", "^[^\\]") | yes |  | yes |
| `}` | Close action for "{}" pair -> v:lua.MiniPairs.close("{}", "^[^\\]") | yes |  | yes |

### Visual (`v`)

| Atalho | Acao/Descricao | Expr | Silent | Noremap |
| --- | --- | --- | --- | --- |
| `#` | :help v_#-default | yes |  | yes |
| `%` | <Plug>(MatchitVisualForward) |  | yes |  |
| `*` | :help v_star-default | yes |  | yes |
| `<C-A>` | Ask opencode |  | yes | yes |
| `<C-A>` | Increment | yes |  | yes |
| `<C-B>` | Scroll Backward | yes | yes | yes |
| `<C-F>` | Scroll Forward | yes | yes | yes |
| `<C-S>` | Save File -> <Cmd>w<CR><Esc> |  | yes | yes |
| `<C-S>` | Save File -> <Cmd>w<CR><Esc> |  | yes | yes |
| `<C-X>` | Execute opencode action |  | yes | yes |
| `<C-X>` | Decrement | yes |  | yes |
| `<Down>` | Down -> v:count == 0 ? 'gj' : 'j' | yes | yes | yes |
| `<Esc>` | Escape and Clear hlsearch | yes | yes | yes |
| `<M-j>` | Move Down -> :<C-U>execute "'<lt>,'>move '>+" . v:count1<CR>gv=gv |  | yes | yes |
| `<M-k>` | Move Up -> :<C-U>execute "'<lt>,'>move '<lt>-" . (v:count1 + 1)<CR>gv=gv |  | yes | yes |
| `<Plug>(AvanteAsk)` | lua callback |  |  | yes |
| `<Plug>(AvanteAskNew)` | lua callback |  |  | yes |
| `<Plug>(AvanteChat)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictAllTheirs)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictBoth)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictCursor)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictOurs)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictTheirs)` | lua callback |  |  | yes |
| `<Plug>(AvanteEdit)` | lua callback |  |  | yes |
| `<Plug>(AvanteZenMode)` | lua callback |  |  | yes |
| `<Plug>(MatchitVisualBackward)` | :<C-U>call matchit#Match_wrapper('',0,'v')<CR>m'gv\`\` |  | yes | yes |
| `<Plug>(MatchitVisualForward)` | :<C-U>call matchit#Match_wrapper('',1,'v')<CR>:if col("''") != col("$") \| exe ":normal! m'" \| endif<CR>gv\`\` |  | yes | yes |
| `<Plug>(MatchitVisualMultiBackward)` | :<C-U>call matchit#MultiMatch("bW", "n")<CR>m'gv\`\` |  | yes | yes |
| `<Plug>(MatchitVisualMultiForward)` | :<C-U>call matchit#MultiMatch("W",  "n")<CR>m'gv\`\` |  | yes | yes |
| `<Plug>(MatchitVisualTextObject)` | <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward) |  | yes |  |
| `<Plug>(dial-decrement)` | <Cmd>lua require"dial.command".select_augend_visual()<CR><Cmd>let &opfunc="dial#operator#decrement_visual"<CR>g@gv |  |  | yes |
| `<Plug>(dial-g-decrement)` | <Cmd>lua require"dial.command".select_augend_gvisual()<CR><Cmd>let &opfunc="dial#operator#decrement_gvisual"<CR>g@gv |  |  | yes |
| `<Plug>(dial-g-increment)` | <Cmd>lua require"dial.command".select_augend_gvisual()<CR><Cmd>let &opfunc="dial#operator#increment_gvisual"<CR>g@gv |  |  | yes |
| `<Plug>(dial-increment)` | <Cmd>lua require"dial.command".select_augend_visual()<CR><Cmd>let &opfunc="dial#operator#increment_visual"<CR>g@gv |  |  | yes |
| `<Plug>VSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR> |  | yes | yes |
| `<Plug>VgSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 0 : 1)<CR> |  | yes | yes |
| `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> | yes | yes | yes |
| `<Tab>` | vim.snippet.jump if active, otherwise <Tab> | yes | yes | yes |
| `<Up>` | Up -> v:count == 0 ? 'gk' : 'k' | yes | yes | yes |
| `<lt>` | <lt>gv |  | yes | yes |
| `>` | >gv |  | yes | yes |
| `@` | :help v_@-default -> mode() ==# 'V' ? ':normal! @'.getcharstr().'<CR>' : '@' | yes | yes | yes |
| `N` | Prev Search Result -> 'nN'[v:searchforward] | yes | yes | yes |
| `Q` | :help v_Q-default -> mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q' | yes | yes | yes |
| `S` | <Plug>VSurround |  |  |  |
| `[%` | <Plug>(MatchitVisualMultiBackward) |  | yes |  |
| `[n` | Select previous node |  |  | yes |
| `\aa` | avante: ask -> <Plug>(AvanteAsk) |  | yes | yes |
| `\ae` | avante: edit -> <Plug>(AvanteEdit) |  | yes | yes |
| `\an` | avante: create new ask -> <Plug>(AvanteAskNew) |  | yes | yes |
| `\az` | avante: toggle Zen Mode -> <Plug>(AvanteZenMode) |  | yes | yes |
| `\cF` | Format Injected Langs |  |  | yes |
| `\cf` | Format |  | yes | yes |
| `\gB` | Git Browse (open) |  | yes | yes |
| `\gY` | Git Browse (copy) |  | yes | yes |
| `\sW` | Selection (cwd) |  |  | yes |
| `\sr` | Search and Replace |  |  | yes |
| `\sw` | Selection (Root Dir) |  |  | yes |
| `]%` | <Plug>(MatchitVisualMultiForward) |  | yes |  |
| `]n` | Select next node |  |  | yes |
| `a` | Around textobject | yes | yes |  |
| `a%` | <Plug>(MatchitVisualTextObject) |  |  |  |
| `al` | Around last textobject | yes | yes |  |
| `an` | Around next textobject | yes | yes |  |
| `g%` | <Plug>(MatchitVisualBackward) |  | yes |  |
| `g<C-A>` | Increment | yes |  | yes |
| `g<C-X>` | Decrement | yes |  | yes |
| `gA` | Align with preview |  | yes | yes |
| `gS` | <Plug>VgSurround |  |  |  |
| `g[` | Move to left "around" | yes | yes |  |
| `g]` | Move to right "around" | yes | yes |  |
| `ga` | Align |  | yes | yes |
| `gc` | Toggle comment | yes |  | yes |
| `go` | Add range to opencode | yes | yes | yes |
| `gra` | vim.lsp.buf.code_action() |  |  | yes |
| `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |  |  | yes |
| `i` | Inside textobject | yes | yes |  |
| `il` | Inside last textobject | yes | yes |  |
| `in` | Inside next textobject | yes | yes |  |
| `j` | Down -> v:count == 0 ? 'gj' : 'j' | yes | yes | yes |
| `k` | Up -> v:count == 0 ? 'gk' : 'k' | yes | yes | yes |
| `n` | Next Search Result -> 'Nn'[v:searchforward] | yes | yes | yes |

### Visual/Select (`x`)

| Atalho | Acao/Descricao | Expr | Silent | Noremap |
| --- | --- | --- | --- | --- |
| `#` | :help v_#-default | yes |  | yes |
| `%` | <Plug>(MatchitVisualForward) |  | yes |  |
| `*` | :help v_star-default | yes |  | yes |
| `<C-A>` | Ask opencode |  | yes | yes |
| `<C-S>` | Save File -> <Cmd>w<CR><Esc> |  | yes | yes |
| `<C-X>` | Execute opencode action |  | yes | yes |
| `<Down>` | Down -> v:count == 0 ? 'gj' : 'j' | yes | yes | yes |
| `<M-j>` | Move Down -> :<C-U>execute "'<lt>,'>move '>+" . v:count1<CR>gv=gv |  | yes | yes |
| `<M-k>` | Move Up -> :<C-U>execute "'<lt>,'>move '<lt>-" . (v:count1 + 1)<CR>gv=gv |  | yes | yes |
| `<Plug>(AvanteAsk)` | lua callback |  |  | yes |
| `<Plug>(AvanteAskNew)` | lua callback |  |  | yes |
| `<Plug>(AvanteChat)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictAllTheirs)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictBoth)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictCursor)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictOurs)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictTheirs)` | lua callback |  |  | yes |
| `<Plug>(AvanteEdit)` | lua callback |  |  | yes |
| `<Plug>(AvanteZenMode)` | lua callback |  |  | yes |
| `<Plug>(MatchitVisualBackward)` | :<C-U>call matchit#Match_wrapper('',0,'v')<CR>m'gv\`\` |  | yes | yes |
| `<Plug>(MatchitVisualForward)` | :<C-U>call matchit#Match_wrapper('',1,'v')<CR>:if col("''") != col("$") \| exe ":normal! m'" \| endif<CR>gv\`\` |  | yes | yes |
| `<Plug>(MatchitVisualMultiBackward)` | :<C-U>call matchit#MultiMatch("bW", "n")<CR>m'gv\`\` |  | yes | yes |
| `<Plug>(MatchitVisualMultiForward)` | :<C-U>call matchit#MultiMatch("W",  "n")<CR>m'gv\`\` |  | yes | yes |
| `<Plug>(MatchitVisualTextObject)` | <Plug>(MatchitVisualMultiBackward)o<Plug>(MatchitVisualMultiForward) |  | yes |  |
| `<Plug>(dial-decrement)` | <Cmd>lua require"dial.command".select_augend_visual()<CR><Cmd>let &opfunc="dial#operator#decrement_visual"<CR>g@gv |  |  | yes |
| `<Plug>(dial-g-decrement)` | <Cmd>lua require"dial.command".select_augend_gvisual()<CR><Cmd>let &opfunc="dial#operator#decrement_gvisual"<CR>g@gv |  |  | yes |
| `<Plug>(dial-g-increment)` | <Cmd>lua require"dial.command".select_augend_gvisual()<CR><Cmd>let &opfunc="dial#operator#increment_gvisual"<CR>g@gv |  |  | yes |
| `<Plug>(dial-increment)` | <Cmd>lua require"dial.command".select_augend_visual()<CR><Cmd>let &opfunc="dial#operator#increment_visual"<CR>g@gv |  |  | yes |
| `<Plug>VSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR> |  | yes | yes |
| `<Plug>VgSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 0 : 1)<CR> |  | yes | yes |
| `<Up>` | Up -> v:count == 0 ? 'gk' : 'k' | yes | yes | yes |
| `<lt>` | <lt>gv |  | yes | yes |
| `>` | >gv |  | yes | yes |
| `@` | :help v_@-default -> mode() ==# 'V' ? ':normal! @'.getcharstr().'<CR>' : '@' | yes | yes | yes |
| `N` | Prev Search Result -> 'nN'[v:searchforward] | yes | yes | yes |
| `Q` | :help v_Q-default -> mode() ==# 'V' ? ':normal! @<C-R>=reg_recorded()<CR><CR>' : 'Q' | yes | yes | yes |
| `S` | <Plug>VSurround |  |  |  |
| `[%` | <Plug>(MatchitVisualMultiBackward) |  | yes |  |
| `[n` | Select previous node |  |  | yes |
| `\aa` | avante: ask -> <Plug>(AvanteAsk) |  | yes | yes |
| `\ae` | avante: edit -> <Plug>(AvanteEdit) |  | yes | yes |
| `\an` | avante: create new ask -> <Plug>(AvanteAskNew) |  | yes | yes |
| `\az` | avante: toggle Zen Mode -> <Plug>(AvanteZenMode) |  | yes | yes |
| `\cF` | Format Injected Langs |  |  | yes |
| `\cf` | Format |  | yes | yes |
| `\gB` | Git Browse (open) |  | yes | yes |
| `\gY` | Git Browse (copy) |  | yes | yes |
| `\sW` | Selection (cwd) |  |  | yes |
| `\sr` | Search and Replace |  |  | yes |
| `\sw` | Selection (Root Dir) |  |  | yes |
| `]%` | <Plug>(MatchitVisualMultiForward) |  | yes |  |
| `]n` | Select next node |  |  | yes |
| `a` | Around textobject | yes | yes |  |
| `a%` | <Plug>(MatchitVisualTextObject) |  |  |  |
| `al` | Around last textobject | yes | yes |  |
| `an` | Around next textobject | yes | yes |  |
| `g%` | <Plug>(MatchitVisualBackward) |  | yes |  |
| `g<C-A>` | Increment | yes |  | yes |
| `g<C-X>` | Decrement | yes |  | yes |
| `gA` | Align with preview |  | yes | yes |
| `gS` | <Plug>VgSurround |  |  |  |
| `g[` | Move to left "around" | yes | yes |  |
| `g]` | Move to right "around" | yes | yes |  |
| `ga` | Align |  | yes | yes |
| `gc` | Toggle comment | yes |  | yes |
| `go` | Add range to opencode | yes | yes | yes |
| `gra` | vim.lsp.buf.code_action() |  |  | yes |
| `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |  |  | yes |
| `i` | Inside textobject | yes | yes |  |
| `il` | Inside last textobject | yes | yes |  |
| `in` | Inside next textobject | yes | yes |  |
| `j` | Down -> v:count == 0 ? 'gj' : 'j' | yes | yes | yes |
| `k` | Up -> v:count == 0 ? 'gk' : 'k' | yes | yes | yes |
| `n` | Next Search Result -> 'Nn'[v:searchforward] | yes | yes | yes |

### Select (`s`)

| Atalho | Acao/Descricao | Expr | Silent | Noremap |
| --- | --- | --- | --- | --- |
| `<C-A>` | Increment | yes |  | yes |
| `<C-B>` | Scroll Backward | yes | yes | yes |
| `<C-F>` | Scroll Forward | yes | yes | yes |
| `<C-S>` | Save File -> <Cmd>w<CR><Esc> |  | yes | yes |
| `<C-X>` | Decrement | yes |  | yes |
| `<Esc>` | Escape and Clear hlsearch | yes | yes | yes |
| `<M-j>` | Move Down -> :<C-U>execute "'<lt>,'>move '>+" . v:count1<CR>gv=gv |  | yes | yes |
| `<M-k>` | Move Up -> :<C-U>execute "'<lt>,'>move '<lt>-" . (v:count1 + 1)<CR>gv=gv |  | yes | yes |
| `<Plug>(AvanteAsk)` | lua callback |  |  | yes |
| `<Plug>(AvanteAskNew)` | lua callback |  |  | yes |
| `<Plug>(AvanteChat)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictAllTheirs)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictBoth)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictCursor)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictOurs)` | lua callback |  |  | yes |
| `<Plug>(AvanteConflictTheirs)` | lua callback |  |  | yes |
| `<Plug>(AvanteEdit)` | lua callback |  |  | yes |
| `<Plug>(AvanteZenMode)` | lua callback |  |  | yes |
| `<Plug>(dial-decrement)` | <Cmd>lua require"dial.command".select_augend_visual()<CR><Cmd>let &opfunc="dial#operator#decrement_visual"<CR>g@gv |  |  | yes |
| `<Plug>(dial-g-decrement)` | <Cmd>lua require"dial.command".select_augend_gvisual()<CR><Cmd>let &opfunc="dial#operator#decrement_gvisual"<CR>g@gv |  |  | yes |
| `<Plug>(dial-g-increment)` | <Cmd>lua require"dial.command".select_augend_gvisual()<CR><Cmd>let &opfunc="dial#operator#increment_gvisual"<CR>g@gv |  |  | yes |
| `<Plug>(dial-increment)` | <Cmd>lua require"dial.command".select_augend_visual()<CR><Cmd>let &opfunc="dial#operator#increment_visual"<CR>g@gv |  |  | yes |
| `<Plug>VSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR> |  | yes | yes |
| `<Plug>VgSurround` | :<C-U>call <SNR>7_opfunc(visualmode(),visualmode() ==# 'V' ? 0 : 1)<CR> |  | yes | yes |
| `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> | yes | yes | yes |
| `<Tab>` | vim.snippet.jump if active, otherwise <Tab> | yes | yes | yes |
| `\aa` | avante: ask -> <Plug>(AvanteAsk) |  | yes | yes |
| `\ae` | avante: edit -> <Plug>(AvanteEdit) |  | yes | yes |
| `\an` | avante: create new ask -> <Plug>(AvanteAskNew) |  | yes | yes |
| `\az` | avante: toggle Zen Mode -> <Plug>(AvanteZenMode) |  | yes | yes |

### Operator-pending (`o`)

| Atalho | Acao/Descricao | Expr | Silent | Noremap |
| --- | --- | --- | --- | --- |
| `%` | <Plug>(MatchitOperationForward) |  | yes |  |
| `<Plug>(MatchitOperationBackward)` | :<C-U>call matchit#Match_wrapper('',0,'o')<CR> |  | yes | yes |
| `<Plug>(MatchitOperationForward)` | :<C-U>call matchit#Match_wrapper('',1,'o')<CR> |  | yes | yes |
| `<Plug>(MatchitOperationMultiBackward)` | :<C-U>call matchit#MultiMatch("bW", "o")<CR> |  | yes | yes |
| `<Plug>(MatchitOperationMultiForward)` | :<C-U>call matchit#MultiMatch("W",  "o")<CR> |  | yes | yes |
| `N` | Prev Search Result -> 'nN'[v:searchforward] | yes | yes | yes |
| `[%` | <Plug>(MatchitOperationMultiBackward) |  | yes |  |
| `]%` | <Plug>(MatchitOperationMultiForward) |  | yes |  |
| `a` | Around textobject | yes | yes |  |
| `al` | Around last textobject | yes | yes |  |
| `an` | Around next textobject | yes | yes |  |
| `g%` | <Plug>(MatchitOperationBackward) |  | yes |  |
| `g[` | Move to left "around" | yes | yes |  |
| `g]` | Move to right "around" | yes | yes |  |
| `gc` | Comment textobject |  |  | yes |
| `i` | Inside textobject | yes | yes |  |
| `il` | Inside last textobject | yes | yes |  |
| `in` | Inside next textobject | yes | yes |  |
| `n` | Next Search Result -> 'Nn'[v:searchforward] | yes | yes | yes |

### Terminal (`t`)

| Atalho | Acao/Descricao | Expr | Silent | Noremap |
| --- | --- | --- | --- | --- |
| `<C-.>` | Toggle opencode |  | yes | yes |
| `<C-/>` | Terminal (Root Dir) |  | yes | yes |
| `<C-_>` | which_key_ignore |  | yes | yes |

### Command-line (`c`)

| Atalho | Acao/Descricao | Expr | Silent | Noremap |
| --- | --- | --- | --- | --- |
| `"` | Closeopen action for '""' pair -> v:lua.MiniPairs.closeopen('""', "^[^\\]") | yes |  | yes |
| `'` | Closeopen action for "''" pair -> v:lua.MiniPairs.closeopen("''", "^[^%a\\]") | yes |  | yes |
| `(` | Open action for "()" pair -> v:lua.MiniPairs.open("()", "^[^\\]") | yes |  | yes |
| `)` | Close action for "()" pair -> v:lua.MiniPairs.close("()", "^[^\\]") | yes |  | yes |
| `<BS>` | MiniPairs <BS> -> v:lua.MiniPairs.bs() | yes |  | yes |
| `<C-R><C-G>` | fnameescape(fugitive#Object(@%)) | yes |  |  |
| `<Plug>(TelescopeFuzzyCommandSearch)` | <C-\>e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"<CR><CR> |  | yes | yes |
| `<S-CR>` | Redirect Cmdline |  |  | yes |
| `[` | Open action for "[]" pair -> v:lua.MiniPairs.open("[]", "^[^\\]") | yes |  | yes |
| `]` | Close action for "[]" pair -> v:lua.MiniPairs.close("[]", "^[^\\]") | yes |  | yes |
| `\`` | Closeopen action for "\`\`" pair -> v:lua.MiniPairs.closeopen("\`\`", "^[^\\]") | yes |  | yes |
| `{` | Open action for "{}" pair -> v:lua.MiniPairs.open("{}", "^[^\\]") | yes |  | yes |
| `}` | Close action for "{}" pair -> v:lua.MiniPairs.close("{}", "^[^\\]") | yes |  | yes |

## Plugins Detectados

- `ChatGPT.nvim`
- `LazyVim`
- `SchemaStore.nvim`
- `avante.nvim`
- `blink-copilot`
- `blink.cmp`
- `bufferline.nvim`
- `catppuccin`
- `conform.nvim`
- `copilot.lua`
- `copilot.vim`
- `dial.nvim`
- `dressing.nvim`
- `elixir-extras.nvim`
- `flash.nvim`
- `friendly-snippets`
- `fzf-lua`
- `gitsigns.nvim`
- `grug-far.nvim`
- `img-clip.nvim`
- `inc-rename.nvim`
- `lazy.nvim`
- `lazydev.nvim`
- `lualine.nvim`
- `markdown-preview.nvim`
- `mason-lspconfig.nvim`
- `mason.nvim`
- `mini.ai`
- `mini.align`
- `mini.icons`
- `mini.pairs`
- `mini.pick`
- `neo-tree.nvim`
- `noice.nvim`
- `nui.nvim`
- `nvim-lint`
- `nvim-lspconfig`
- `nvim-treesitter`
- `nvim-treesitter-textobjects`
- `nvim-ts-autotag`
- `nvim-web-devicons`
- `opencode.nvim`
- `persistence.nvim`
- `plenary.nvim`
- `render-markdown.nvim`
- `snacks.nvim`
- `telescope-fzf-native.nvim`
- `telescope.nvim`
- `todo-comments.nvim`
- `tokyonight.nvim`
- `trouble.nvim`
- `ts-comments.nvim`
- `vim-fugitive`
- `vim-gpt-commit`
- `vim-rails`
- `vim-repeat`
- `vim-rhubarb`
- `vim-surround`
- `vim-test`
- `which-key.nvim`
- `window-picker`

## Observacoes da Captura

- O comando headless instalou/carregou plugins faltantes antes da exportacao; durante a execucao apareceram avisos de rename para `echasnovski/mini.pick`, `echasnovski/mini.indentscope` e `echasnovski/mini.align`, sugerindo atualizar para `nvim-mini/*` quando quiser limpar warnings do LazyVim.
- Tambem apareceu aviso de `vim-gpt-commit` porque `OPENAI_API_KEY` nao estava definido no ambiente da execucao.
- A pasta `nvim/` no repo difere de `.config/nvim/`; esta documentacao prioriza `.config/nvim`, que foi a config carregada na captura.
