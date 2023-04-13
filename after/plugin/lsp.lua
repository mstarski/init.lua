local lspconfig = require("lspconfig")
local lsp = require("lsp-zero").preset({
	manage_nvim_cmp = { set_sources = "recommended" },
})

lsp.ensure_installed({ "tsserver", "lua_ls" })
lsp.set_sign_icons({ error = "✘", warn = "▲", hint = "⚑", info = "»" })
lsp.setup({ sources = { { name = "nvim_lsp" }, { name = "nvim_lua" } } })

lsp.skip_server_setup({ "tsserver" })

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.yamlls.setup({
	settings = {
		yaml = {
			keyOrdering = false,
			schemaStore = true,
			completion = true,
			validate = true,
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/**/.github/**/workflows/**",
				["https://json.schemastore.org/github-action.json"] = "/**/.github/**/actions/**",
			},
		},
	},
})

lspconfig.omnisharp.setup({
	cmd = { "omnisharp", "-lsp" },
	root_dir = lspconfig.util.root_pattern(".git", "obj"),
	filetypes = { "cs" },
	settings = {
		Zero = {
			diagnosticFilter = {
				exclude = { "**/obj/**", "**/bin/**" },
			},
		},
		RoslynExtensionsOptions = {
			enableAnalyzersSupport = true,
			enableCodeFixesSupport = true,
			enableRefactoringsSupport = true,
		},
	},
})

require("typescript").setup({
	server = {
		on_attach = function(client, bufnr)
			-- You can find more commands in the documentation:
			-- https://github.com/jose-elias-alvarez/typescript.nvim#commands
			if client.name == "tsserver" then
				client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
			end
		end,
	},
})

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
	mapping = {
		["<Down>"] = cmp_action.tab_complete(),
		["<Up>"] = cmp_action.select_prev_or_fallback(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
})

vim.diagnostic.config({ virtual_text = false })

vim.keymap.set("n", "<M-e>", vim.diagnostic.open_float)
vim.keymap.set("n", "<M-Enter>", vim.lsp.buf.code_action)
vim.keymap.set("n", "<M-r>", vim.lsp.buf.rename)
