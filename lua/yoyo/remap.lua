vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>cp", ":let @+=@%<cr>")
vim.keymap.set("n", "<BS>", ":noh <cr>")

vim.keymap.set("n", "<C-N>", vim.cmd.BufferNext)
vim.keymap.set("n", "<C-B>", vim.cmd.BufferPrevious)
vim.keymap.set("n", "<C-D>", vim.cmd.BufferClose)

vim.keymap.set("n", "<space>", "/", { noremap = true })
vim.keymap.set("n", ";", ":", { noremap = true })
