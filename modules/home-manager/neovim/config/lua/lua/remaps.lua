vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Paste without overwriting clipboard
vim.keymap.set("x", "<leader>p", [["_dP]], {
    desc = "Paste without overwriting clipboard"
})

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
    desc = "Move line down"
})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
    desc = "Move line up"
})

-- Yank to clipboard separately from yank to vim registers
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {
    desc = "Yank to clipboard"
})
vim.keymap.set("n", "<leader>Y", [["+Y]], {
    desc = "Yank end of line to clipboard"
})

-- Quitters
vim.keymap.set("n", "<leader>Q", "<esc>:qa!<cr>", {
    desc = "Quit and discard"
})
vim.keymap.set("n", "<leader>q", "<esc>:wq!<cr>", {
    desc = "Quit and save"
})
vim.keymap.set("n", "<leader>S", "<esc>:w<cr>", {
    desc = "Save"
})
