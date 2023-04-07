local fmtGroup = vim.api.nvim_create_augroup("fmtGroup", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = "undojoin | Neoformat",
	group = fmtGroup,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.ts,*.js,*.tsx",
	command = "TypescriptOrganizeImports",
	group = fmtGroup,
})
