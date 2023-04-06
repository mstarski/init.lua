local lspconfig = require('lspconfig')
local lsp = require('lsp-zero').preset({
    manage_nvim_cmp = {set_sources = 'recommended'}
})

lsp.ensure_installed({'tsserver', 'lua_ls'})

lsp.set_sign_icons({error = '✘', warn = '▲', hint = '⚑', info = '»'})

lsp.skip_server_setup({'tsserver'})
lsp.setup({sources = {{name = 'nvim_lsp'}, {name = 'nvim_lua'}}})

lsp.on_attach(function(_, bufnr) lsp.default_keymaps({buffer = bufnr}) end)

-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

-- tsserver configuration

require("typescript").setup({
    settings = {
        -- Your tsserver settings here
    }
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        {name = 'nvim_lsp'}, {name = 'nvim_lua'}, {name = 'path'},
        {name = 'nvim_lsp'}, {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2}
    },
    mapping = {
        ['<Down>'] = cmp_action.tab_complete(),
        ['<Up>'] = cmp_action.select_prev_or_fallback(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        })
    }
})

vim.diagnostic.config({virtual_text = false})

vim.keymap.set('n', '<M-e>', vim.diagnostic.open_float)
vim.keymap.set('n', '<M-Enter>', vim.lsp.buf.code_action)
vim.keymap.set('n', '<M-r>', vim.lsp.buf.rename)
