# Neovim Search Cheatsheet

## Por que acontece o erro `E486: Pattern not found: neo-tr`?

Esse erro acontece porque, neste setup, o `leader` nao e `l` nem `<space>`.
Ele foi definido como `\`.

Entao o atalho da arvore nao e `l+n`.
O atalho correto e:

`\\nt`

Quando voce aperta `n` fora de contexto, o Vim tenta repetir a ultima busca.
Se a ultima busca era `neo-tr`, ele procura esse texto de novo e mostra:

`E486: Pattern not found: neo-tr`

Ou seja:

- o problema nao e o Neo-tree quebrado
- o problema e a combinacao de teclas errada

## Arvore de arquivos

Plugin em uso:

- `Neo-tree`

Atalho para abrir/fechar a arvore:

- `\\nt` - toggle do Neo-tree

## Atalhos do Neo-tree para localizar arquivos

Dentro da janela do Neo-tree:

- `?` - mostra a ajuda de atalhos
- `/` - busca fuzzy por arquivos e pastas
- `D` - busca fuzzy apenas por diretorios
- `#` - fuzzy sorter na arvore
- `f` - filtra itens pelo texto digitado
- `<C-x>` - limpa o filtro atual
- `H` - mostra/esconde arquivos ocultos
- `<bs>` - sobe para o diretorio pai
- `.` - redefine a raiz da arvore para a pasta atual
- `R` - recarrega a arvore
- `<cr>` - abre arquivo
- `s` - abre em split vertical
- `S` - abre em split horizontal
- `t` - abre em nova aba
- `q` - fecha a janela do Neo-tree

## Buscar arquivos no projeto

Esses atalhos usam o picker do seu setup:

- `\\<space>` - encontrar arquivos no root do projeto
- `\\ff` - encontrar arquivos no root do projeto
- `\\fF` - encontrar arquivos no diretorio atual
- `\\fg` - encontrar arquivos versionados no git
- `\\fr` - arquivos recentes
- `\\fR` - arquivos recentes do diretorio atual
- `\\fc` - buscar arquivos de configuracao
- `\\fb` - listar buffers

## Pesquisar texto no projeto

- `\\/` - grep no root do projeto
- `\\sg` - grep no root do projeto
- `\\sG` - grep no diretorio atual
- `\\sw` - buscar a palavra sob o cursor no projeto
- `\\sW` - buscar a palavra sob o cursor ou selecao no diretorio atual
- `\\sb` - buscar linhas no buffer atual
- `\\sB` - grep entre buffers abertos
- `\\s/` - historico de buscas
- `\\sk` - listar atalhos

## Buscas customizadas deste setup

Atalhos personalizados para Ruby:

- `\\zb` - busca somente em arquivos `.rb`
- `\\zsd` - busca em `.rb` excluindo `spec/**` e `db/**`
- `\\zss` - busca em `.rb` excluindo `spec/**`

## Dica rapida

Se quiser descobrir qualquer atalho com `leader`, digite:

- `\\`

e espere o `which-key` mostrar os grupos e atalhos disponiveis.
