local builtin = require('telescope.builtin')
local telescope = require('telescope');

telescope.setup ({
    defaults = {
        layout_strategy = "vertical",
        file_ignore_patterns = {
            'git',
            'node_modules',
            'dist'
        },
        prompt_prefix="🔍",
    },
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            theme = "dropdown",
        },

        live_grep = {
            theme = "dropdown",
            prompt_prefix="🔍"
        },

        treesitter = {
            theme = "dropdown",
            prompt_prefix="🔍"
        },

        recent_files = {
            theme = "dropdown",
            prompt_prefix="🔍"
        },
    },
})

telescope.load_extension("recent_files")

-- this works as both C-n and C-S-n. Terminal cannot distinguish C-x and C-S-x operations
vim.keymap.set('n', '<C-n>', function()
    builtin.find_files({ hidden = true })
end)

vim.keymap.set('n', '<leader>ps', function()
	builtin.live_grep()
end)

vim.keymap.set('n', '<M-s>', function()
    builtin.lsp_dynamic_workspace_symbols()
end)

vim.keymap.set('n', '<M-b>', function()
    builtin.git_branches()
end)


vim.keymap.set('n', '<leader>gr', function()
    builtin.lsp_references()
end)

-- Recent files window
vim.api.nvim_set_keymap("n", "<C-e>",
[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
{noremap = true, silent = true})
