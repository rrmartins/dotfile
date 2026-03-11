return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      -- ruby = { "rubocop" },

      elixir = { "mix" },
      heex = { "mix" },
      eex = { "mix" },

      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    },
  },
}
