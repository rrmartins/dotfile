-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- You don't need this as you can use `<Leader><Tab>[` or `<Leader><Tab>]` instead!
vim.keymap.set("n", "gb", "gT", { desc = "Go back one tab", noremap = true, silent = true })

-- TABS
vim.keymap.set("n", "<leader><tab>-", ":tabm-<CR>", { desc = "Move tab to the left", noremap = true, silent = true })
vim.keymap.set("n", "<leader><tab>+", ":tabm+<CR>", { desc = "Move tab to the right", noremap = true, silent = true })

-- BUFFERS
vim.keymap.set(
  "n",
  "<leader>bx",
  ":%bd|e#<CR>",
  { desc = "Delete Buffers Except Current", noremap = true, silent = true }
)
---------------------------------------------------------------------------------
-- PLUGINGS
---------------------------------------------------------------------------------

-- VIM TEST
vim.keymap.set("n", "<leader>ttn", ":TestNearest<CR>", { desc = "Test nearest", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ttf", ":TestFile<CR>", { desc = "Test file", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ttl", ":TestLast<CR>", { desc = "Test last", noremap = true, silent = true })

vim.keymap.set("n", "<leader>nt", ":Neotree toggle<CR>", opts)

vim.keymap.set("n", "<C-e>", ":e<cr>", opts)
vim.keymap.set("n", "<C-o>", ":noh<cr><esc>", opts)
vim.keymap.set("n", "<C-s>", ":w<cr><esc>", opts)
vim.keymap.set("n", "<C-Q>", ":qa<cr><esc>", opts)
vim.keymap.set("n", "<C-q>", ":q<cr><esc>", opts)

vim.keymap.set("n", "<Tab>", ":tabnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", opts)

vim.keymap.set("n", "<leader>zb", function()
  require("telescope.builtin").live_grep({ glob_pattern = "*.rb" })
end, { desc = "search files .rb" })

vim.keymap.set("n", "<leader>zsd", function()
  require("telescope.builtin").live_grep({
    glob_pattern = { "*.rb", "!spec/**", "!db/**" },
  })
end, { desc = "Search files .rb excluding spec and db folders" })

vim.keymap.set("n", "<leader>zss", function()
  require("telescope.builtin").live_grep({
    glob_pattern = { "*.rb", "!spec/**" },
  })
end, { desc = "Search files .rb excluding spec folder" })

vim.keymap.set("n", "<leader>ai", ":AICommits<CR>", { desc = "AI Commits", noremap = true, silent = true })

-- OPENCODE
vim.keymap.set(
  { "n", "x" },
  "<C-a>",
  function()
    require("opencode").ask("@this: ", { submit = true })
  end,
  { desc = "Ask opencode", noremap = true, silent = true }
)
vim.keymap.set(
  { "n", "x" },
  "<C-x>",
  function()
    require("opencode").select()
  end,
  { desc = "Execute opencode action", noremap = true, silent = true }
)
vim.keymap.set(
  { "n", "t" },
  "<C-.>",
  function()
    require("opencode").toggle()
  end,
  { desc = "Toggle opencode", noremap = true, silent = true }
)

vim.keymap.set(
  { "n", "x" },
  "go",
  function()
    return require("opencode").operator("@this ")
  end,
  { expr = true, desc = "Add range to opencode", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "goo",
  function()
    return require("opencode").operator("@this ") .. "_"
  end,
  { expr = true, desc = "Add line to opencode", noremap = true, silent = true }
)

vim.keymap.set(
  "n",
  "<C-k>",
  function()
    require("opencode").command("session.half.page.up")
  end,
  { desc = "Opencode half page up", noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<C-j>",
  function()
    require("opencode").command("session.half.page.down")
  end,
  { desc = "Opencode half page down", noremap = true, silent = true }
)

-- function ReloadConfig()
--   for name,_ in pairs(package.loaded) do
--     if name:match('^user') or name:match('^plugins') then
--       package.loaded[name] = nil
--     end
--   end
--   dofile(vim.fn.stdpath('config') .. '/init.lua')
-- end

-- vim.api.nvim_set_keymap('n', '<leader>r', ':lua ReloadConfig()<CR>', { noremap = true, silent = true })
