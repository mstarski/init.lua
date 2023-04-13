-- Toggle branches
vim.keymap.set("n", "<M-b>", function()
	vim.cmd("MerginalToggle")
end)

-- Resolving conflicts
vim.keymap.set("n", "<leader>g[", function()
	vim.cmd("diffget //2")
end)

vim.keymap.set("n", "<leader>g]", function()
	vim.cmd("diffget //3")
end)
