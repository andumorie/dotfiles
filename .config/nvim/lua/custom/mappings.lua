local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telescope_builtin.git_files, {})

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Quick quit command
vim.keymap.set("n", "<leader>q", "<cmd>quit<CR>") -- Quit current window
vim.keymap.set("n", "<leader>Q", "<cmd>:qa!<CR>") -- Quit all windows

-- Easier moving of code blocks
-- Go into visual mode (v), then select several lines of code here and
-- then press ">" or "<" several times.
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Insert blank linkes without going into Insert mode
vim.keymap.set("n", "t", "o<ESC>k")
vim.keymap.set("n", "T", "O<ESC>j")

-- Jump to start and end of line using homerow keys
vim.keymap.set({ "n", "v" }, "H", "^")
vim.keymap.set({ "n", "v" }, "L", "$")

-- Move in insert mode
vim.keymap.set("i", "<C-j>", "<C-o>j")
vim.keymap.set("i", "<C-h>", "<C-o>h")
vim.keymap.set("i", "<C-k>", "<C-o>k")
vim.keymap.set("i", "<C-l>", "<C-o>l")

-- Move with Tmux Navigator
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")
