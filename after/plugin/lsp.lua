local lspconfig = require("lspconfig")
local lsp = require("lsp-zero").preset({
	manage_nvim_cmp = { set_sources = "recommended" },
})
local schemastore = require("schemastore")

lsp.ensure_installed({ "tsserver", "lua_ls" })
lsp.set_sign_icons({ error = "✘", warn = "▲", hint = "⚑", info = "»" })
lsp.setup({ sources = { { name = "nvim_lsp" }, { name = "nvim_lua" } } })

lsp.skip_server_setup({ "tsserver" })

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

-- TYPESCRIPT
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

-- JSON
lspconfig.jsonls.setup({
	settings = {
		json = {
			schemas = schemastore.json.schemas(),
			validate = { enable = true },
		},
	},
})

-- YAML
lspconfig.yamlls.setup({
	settings = {
		yaml = {
			keyOrdering = false,
			schemaStore = true,
			completion = true,
			validate = true,
			schemas = schemastore.yaml.schemas(),
		},
	},
})

-- .NET
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

vim.diagnostic.config({ virtual_text = false })

vim.keymap.set("n", "<M-e>", vim.diagnostic.open_float)
vim.keymap.set("n", "<M-Enter>", vim.lsp.buf.code_action)
vim.keymap.set("n", "<M-r>", vim.lsp.buf.rename)
