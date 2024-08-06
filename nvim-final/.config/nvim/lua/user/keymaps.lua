local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
keymap("x", "kj", "<ESC>", opts)

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

-- copying text to clipboard
keymap("v", "<C-c>", ":y+<CR>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>l", "<cmd>Telescope live_grep<cr>", opts)

--  NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Bufferline --
keymap("n", "<leader>nk", ":BufferLinePick<cr>", opts)
keymap("n", "<leader>bk", ":BufferLinePickClose<cr>", opts)

-- move between buffers
keymap("n", "<leader>1", ":BufferLineGoToBuffer1<cr>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer2<cr>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer3<cr>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer4<cr>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer5<cr>", opts)
keymap("n", "<leader>6", ":BufferLineGoToBuffer6<cr>", opts)
keymap("n", "<leader>7", ":BufferLineGoToBuffer7<cr>", opts)
keymap("n", "<leader>8", ":BufferLineGoToBuffer8<cr>", opts)

-- Transparency
-- keymap("n", "<leader>t", ":TransparentToggle<cr>", opts)

-- File Saving
keymap("n", "<leader>s", ":w<cr>", opts)
keymap("n", "<leader>q", ":q!<cr>", opts)
keymap("n", "<leader>wq", ":wq<cr>", opts)

-- Aerial
-- keymap("n", "<leader>a", ":AerialToggle<CR>", opts)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- LSP
-- formatting --
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Spell correction
keymap("i", "<C-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", opts)
