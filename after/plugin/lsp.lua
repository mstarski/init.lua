local lsp = require('lsp-zero').preset({
  manage_nvim_cmp = {
    set_sources = 'recommended'
  }
})

lsp.ensure_installed({
	'tsserver',
	'lua_ls'
})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.setup({
	sources = {
		{name = 'nvim_lsp'},
		{name = 'nvim_lua'},
	}
})

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
	  ['<Down>'] = cmp_action.tab_complete(),
	  ['<Up>'] = cmp_action.select_prev_or_fallback(),
	  ['<C-Space>'] = cmp.mapping.complete(),
	  ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
  }
})

vim.diagnostic.config({
  virtual_text = false,
})

vim.keymap.set('n', '<leader>0', vim.diagnostic.open_float)
