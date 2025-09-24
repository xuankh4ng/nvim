local keymap = vim.keymap.set

-- TERMINAL MODE
keymap("n", "<leader>t", "<cmd>te<cr>", { noremap = true, silent = true, desc = "Open Terminal" })
keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "NORMAL MODE in Terminal" })

-- Move lines in visual selection
keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move down a line in visual selection" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move up a line in visual selection" })

keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
keymap("v", "p", '"_dP', { noremap = true, silent = true })

-- Jump to next/prev {}, (), []
keymap({ "n", "v" }, "t", "%", { noremap = true, silent = true, desc = "Jump to next/prev {}, [], ()" })

-- Center cursor when:
-- moving half screen
keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
-- find search term
keymap("n", "n", "nzzzv", { noremap = true, silent = true })
keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

-- Clear highlight search
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })

-- Increase/Decrease indent in VISUAL MODE
keymap("v", "<", "<gv", { noremap = true, silent = true })
keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Replace word on cursor
keymap("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word on cursor" })

-- Split window
keymap("n", "<leader>sv", "<C-w>v", { noremap = true, silent = true, desc = "Split Vertically" })
keymap("n", "<leader>sh", "<C-w>s", { noremap = true, silent = true, desc = "Split Horizontally" })
keymap("n", "<leader>se", "<C-w>=", { noremap = true, silent = true, desc = "Split Equally" })

-- Go to Start and End of a line
keymap({ "n", "v" }, "<C-h>", "^", { noremap = true, silent = true, desc = "Goto Start of a line" })
keymap({ "n", "v" }, "<C-l>", "$", { noremap = true, silent = true, desc = "Goto End of a line" })

-- Tabs
keymap("n", "<leader>td", "<cmd>tabnew %<cr>", { noremap = true, silent = true, desc = "Duplicate Tab" })
keymap("n", "<leader>tn", "<cmd>tabnew<cr>", { noremap = true, silent = true, desc = "New Tab" })
keymap("n", "H", "<cmd>tabp<cr>", { noremap = true, silent = true, desc = "Next Tab" })
keymap("n", "L", "<cmd>tabn<cr>", { noremap = true, silent = true, desc = "Prev Tab" })

-- Diagnostic & LSP
keymap("n", "df", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Open Floating Diagnostic" })
keymap("n", "<leader>fm", vim.lsp.buf.format, { noremap = true, silent = true, desc = "Format" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code Action" })
