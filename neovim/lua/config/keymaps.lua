-- ==============================
--  General Keymaps
-- ==============================

local map = vim.keymap.set

-- General keymaps
map("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Move lines up/down
map("n", "<leader>j", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<leader>k", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "<leader>j", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<leader>k", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<leader>j", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<leader>k", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
