local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space as the leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "


-- File handling
keymap("n", "<leader>s", ":w<cr>", opts)
keymap("n", "<leader>wq", ":wq<cr>", opts)
keymap("n", "<leader>q", ":q!<cr>", opts)
keymap("n", "<leader>xs", ":source %<cr>", opts)

-- Normal --
-- Navigation between windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- To enter normal mode faster
keymap("i", "kj", "<ESC>", opts)

-- Insert --
-- Move text up and down
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- overiding text doesn't yank it
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Plugins --
-- NeoTree
keymap("n", "<leader>e", ":NeoTreeFocusToggle<cr>", opts)
