vim.g.neoformat_try_node_exe = 1;

local fmtGroup = vim.api.nvim_create_augroup("fmtGroup", {clear = true})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = "Neoformat",
    group = fmtGroup
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.ts,*.js,*.tsx",
    command = "TypescriptOrganizeImports",
    group = fmtGroup
})
