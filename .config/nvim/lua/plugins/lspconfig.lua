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
        solargraph = {
          enabled = lsp == "solargraph",
          cmd = { "/Users/rrmartins/.asdf/shims/solargraph" },
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
        elixirls = {
          keys = {
            {
              "<leader>cp",
              function()
                local params = vim.lsp.util.make_position_params()
                LazyVim.lsp.execute({
                  command = "manipulatePipes:serverid",
                  arguments = { "toPipe", params.textDocument.uri, params.position.line, params.position.character },
                })
              end,
              desc = "To Pipe",
            },
            {
              "<leader>cP",
              function()
                local params = vim.lsp.util.make_position_params()
                LazyVim.lsp.execute({
                  command = "manipulatePipes:serverid",
                  arguments = { "fromPipe", params.textDocument.uri, params.position.line, params.position.character },
                })
              end,
              desc = "From Pipe",
            },
          },
        },
      },
    },
  },
}
