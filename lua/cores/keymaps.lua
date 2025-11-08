local map = vim.keymap.set

-- :norm
map({ "n", "v" }, "<leader>n", ":norm ")

-- TERMINAL MODE
map("n", "<leader>t", "<cmd>te<cr>a", { desc = "Open Terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "NORMAL MODE in Terminal" })

-- Go to Start and End of a line
map({ "n", "v" }, "<C-h>", "^", { desc = "Goto Start of a line" })
map({ "n", "v" }, "<C-l>", "$", { desc = "Goto End of a line" })

-- Move lines in visual selection
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down a line in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up a line in visual selection" })

map("n", "<leader>J", "mzJ`z")
map("v", "p", '"_dP')
map({"n", "v"} , "Y", '"+y<CR>')
map({"n", "v"} , "P", '"+p<CR>')

-- Center cursor when:
-- moving half screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- find search term
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Clear highlight search
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Increase/Decrease indent in VISUAL MODE
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "H", "<cmd>tabp<cr>", { desc = "Next tab" })
map("n", "L", "<cmd>tabn<cr>", { desc = "Prev tab" })

-- Diagnostic & LSP
map("n", "df", vim.diagnostic.open_float, { desc = "Diagnostic Float" })
map("n", "<leader>fm", vim.lsp.buf.format, { desc = "LSP format" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
