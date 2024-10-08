return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = {
        enabled = false,
      },
      diagnostics = {
        underline = false,
        virtual_text = false,
      },
      servers = {
        ruby_lsp = {
          mason = false,
          enabled = true,
          cmd = { "/Users/rrmartins/.asdf/shims/ruby-lsp" },
        },
        rubocop = {
          mason = false,
          enabled = true,
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          -- cmd = { "/Users/ogirginc/.asdf/shims/rubocop", "--lsp" },
        },
      },
    },
  },
}
