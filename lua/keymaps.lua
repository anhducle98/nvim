-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<S-h>", "<Plug>(cokeline-focus-prev)", { silent = true })
keymap("n", "<S-l>", "<Plug>(cokeline-focus-next)", { silent = true })
keymap("n", "<Leader>p", "<Plug>(cokeline-switch-prev)", { silent = true })
keymap("n", "<Leader>n", "<Plug>(cokeline-switch-next)", { silent = true })

for i = 1, 9 do
  keymap(
    "n",
    ("<Leader>%s"):format(i),
    ("<Plug>(cokeline-focus-%s)"):format(i),
    { silent = true }
  )
  -- keymap(
  --   "n",
  --   ("<Leader>%s"):format(i),
  --   ("<Plug>(cokeline-switch-%s)"):format(i),
  --   { silent = true }
  -- )
end

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Fast save
keymap("n", "<leader>w", ":w<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Neotree
keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Switch to header/source file
keymap("n", "<leader>ll", "<cmd>ClangdSwitchSourceHeader<cr>", opts)

-- Bufferline
-- keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", opts)
-- keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", opts)
-- keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", opts)
-- keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", opts)
-- keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", opts)
-- keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", opts)
-- keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", opts)
-- keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", opts)
-- keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", opts)
