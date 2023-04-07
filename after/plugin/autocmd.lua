local commonGroup = vim.api.nvim_create_augroup("common", { clear = true })

-- vim.api.nvim_create_autocmd("BufEnter", {
-- pattern = "*",
-- command = "silent! lcd %:p:h",
-- group = commonGroup
-- })

-- Close Vim if NERDTree is the last window
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	command = "if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif",
	group = commonGroup,
})
