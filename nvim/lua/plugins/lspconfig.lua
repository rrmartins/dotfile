return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = {
        enabled = true,
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
          enabled = false,
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          -- cmd = { "/Users/ogirginc/.asdf/shims/rubocop", "--lsp" },
          on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
          end,
        },
      },
    },
  },
}
