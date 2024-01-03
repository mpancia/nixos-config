local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local builtin = require("telescope.builtin")
telescope.setup {
    mappings = {
        n = {
            ["<leader>ff"] = builtin.find_files,
            ["<leader>fg"] = builtin.live_grep,
            ["<leader>fb"] = builtin.buffers,
            ["<leader>fh"] = builtin.help_tags
        }
    }
}
