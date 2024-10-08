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

vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {})

vim.keymap.set("n", "<leader>nt", ":NERDTreeToggle <CR><esc>", opts)

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

-- function ReloadConfig()
--   for name,_ in pairs(package.loaded) do
--     if name:match('^user') or name:match('^plugins') then
--       package.loaded[name] = nil
--     end
--   end
--   dofile(vim.fn.stdpath('config') .. '/init.lua')
-- end

-- vim.api.nvim_set_keymap('n', '<leader>r', ':lua ReloadConfig()<CR>', { noremap = true, silent = true })
