require("nvim-tree").setup({
    disable_netrw = true,
})

vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", {
    desc = "Toggle file tree"
})

