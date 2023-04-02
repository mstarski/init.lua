local builtin = require('telescope.builtin')

-- this works as both C-n and C-S-n. Terminal cannot distinguish C-x and C-S-x operations
vim.keymap.set('n', '<C-n>', '<cmd>Telescope find_files<CR>') 

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
