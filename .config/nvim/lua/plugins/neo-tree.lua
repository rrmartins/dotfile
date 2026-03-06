return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts = opts or {}
      opts.use_default_mappings = true
      opts.default_component_configs = opts.default_component_configs or {}
      opts.default_component_configs.icon = {
        folder_closed = "+",
        folder_open = "-",
        folder_empty = ".",
        default = " ", -- files
      }
      opts.default_component_configs.git_status = {
        symbols = {
          added = "+",
          modified = "~",
          deleted = "-",
          renamed = ">",
          untracked = "?",
          ignored = "!",
          unstaged = "*",
          staged = "=",
          conflict = "x",
        },
      }
      opts.enable_diagnostics = false
      return opts
    end,
  },
}
