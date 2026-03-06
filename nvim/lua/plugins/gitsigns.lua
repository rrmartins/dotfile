return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "Gitsigns" },
    keys = {
      {
        "<leader>ug",
        function()
          require("gitsigns").toggle_signs()
        end,
        desc = "Toggle Git signs",
      },
    },
    -- use simple ASCII symbols so no patched font is required
    opts = function(_, opts)
      opts = opts or {}
      opts.signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
        topdelete = { text = "-" },
        changedelete = { text = "~" },
        untracked = { text = "?" },
      }
      -- keep staged signs consistent to avoid mixed glyphs
      opts.signs_staged = opts.signs
      return opts
    end,
  },
}
