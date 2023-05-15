require("bufferline").setup({
	options = {
		diagnostic = "nvim_lsp",
		show_buffer_close_icons = false,

		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
})

vim.keymap.set("n", "<leader>pt", ":BufferLinePick<CR>")
