local telescope = require("telescope")
telescope.load_extension("aerial")
telescope.load_extension("projects")
telescope.load_extension("git_signs")
telescope.setup({
    extensions = {
        aerial = {
            -- Display symbols as <root>.<parent>.<symbol>
            show_nesting = {
                ["_"] = false, -- This key will be the default
                json = true,   -- You can set the option for specific filetypes
                yaml = true
            }
        }
    }
})

local function find_directory_and_focus()
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local function open_nvim_tree(prompt_bufnr, _)
    actions.select_default:replace(function()
      local api = require("nvim-tree.api")

      actions.close(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      api.tree.open()
      api.tree.find_file(selection.cwd .. "/" .. selection.value)
    end)
    return true
  end

  require("telescope.builtin").find_files({
    find_command = { "fd", "--type", "directory", "--hidden", "--exclude", ".git/*" },
    attach_mappings = open_nvim_tree,
  })
end

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pd", find_directory_and_focus, {
    desc = "Find directory and focus"
})
vim.keymap.set("n", "<leader>pf", builtin.find_files, {
    desc = "Find files"
})
vim.keymap.set("n", "<leader>ps", builtin.grep_string, {
    desc = "Grep for current string"
})
vim.keymap.set("n", "<leader>pg", builtin.git_files, {
    desc = "Find git files"
})
vim.keymap.set("n", "<leader>ph", builtin.help_tags, {
    desc = "Find help tags"
})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {
    desc = "Find buffers"
})
vim.keymap.set("n", "<leader>hf", telescope.extensions.git_signs.git_signs, {
    desc = "Find hunks "
})
vim.keymap.set('n', '<leader>pm', builtin.marks, {desc = "Find marks"})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {
    desc = "Grep within current directory"
})
vim.keymap.set("n", "<leader>pp", telescope.extensions.projects.projects, {desc = "Find projects" })
vim.keymap.set("n", "<leader><leader>", builtin.commands, { desc = "Find commands" })
