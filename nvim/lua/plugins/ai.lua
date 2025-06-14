return {
  { "github/copilot.vim", event = "VeryLazy" },

  -- setup ollero
  {
    "marco-souza/ollero.nvim",
    build = ":!go install github.com/marco-souza/omg@latest",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "term.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require('term').setup({
        auto_close = true,
        auto_resize = true,
        auto_scroll = true,
        persist = true,
      })
    end,
    opts = { model = "deepseek-r1:14b" },
  },

  -- avante.nvim (nvim cursor-like)
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      -- add any opts here
      -- for example
      provider = "openai",
      providers = {
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4.1", -- your desired model (or use gpt-4o, etc.)
          -- timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
          -- temperature = 0.75,
          -- max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
          --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  {
    'skywind3000/vim-gpt-commit',
    config = function ()
        -- if you don't want to set your api key directly, add to your .zshrc:
        -- export OPENAI_API_KEY='sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        vim.g.gpt_commit_key = os.getenv("OPENAI_API_KEY")
        -- uncomment this line below to enable proxy
        -- vim.g.gpt_commit_proxy = 'socks5://127.0.0.1:1080'

        -- uncomment the following lines if you want to use Ollama:
        -- vim.g.gpt_commit_engine = 'ollama'
        -- vim.g.gpt_commit_ollama_url = 'http://127.0.0.1:11434/api/chat'
        -- vim.g.gpt_commit_ollama_model = 'llama2'
    end,
  },
}
