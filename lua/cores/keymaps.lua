local map = vim.keymap.set

-- TERMINAL MODE
map("n", "<leader>t", "<cmd>te<cr>a", { noremap = true, silent = true, desc = "Open Terminal" })
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "NORMAL MODE in Terminal" })

-- Go to Start and End of a line
map({ "n", "v" }, "<C-h>", "^", { noremap = true, silent = true, desc = "Goto Start of a line" })
map({ "n", "v" }, "<C-l>", "$", { noremap = true, silent = true, desc = "Goto End of a line" })

-- Move lines in visual selection
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move down a line in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move up a line in visual selection" })

map("n", "<leader>J", "mzJ`z", { noremap = true, silent = true })
map("v", "p", '"_dP', { noremap = true, silent = true })
map({"n", "v"} , "P", '"+p', { noremap = true, silent = true })

-- Center cursor when:
-- moving half screen
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
-- find search term
map("n", "n", "nzzzv", { noremap = true, silent = true })
map("n", "N", "Nzzzv", { noremap = true, silent = true })

-- Clear highlight search
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })

-- Increase/Decrease indent in VISUAL MODE
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", { noremap = true, silent = true, desc = "New tab" })
map("n", "H", "<cmd>tabp<cr>", { noremap = true, silent = true, desc = "Next tab" })
map("n", "L", "<cmd>tabn<cr>", { noremap = true, silent = true, desc = "Prev tab" })

-- Diagnostic & LSP
map("n", "df", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Diagnostic Float" })
map("n", "<leader>fm", vim.lsp.buf.format, { noremap = true, silent = true, desc = "LSP format" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code action" })
