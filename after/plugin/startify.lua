vim.g.startify_lists = {
	{ type = "bookmarks", header = { "  Bookmarks" } },
	{ type = "sessions", header = { "  Sessions" } },
}

vim.g.startify_bookmarks = {
	{ ["v"] = "~/.config/nvim/init.lua" },
	{ ["z"] = "~/.zshrc" },
	{ ["t"] = "~/.tmux.conf" },
	{ ["j"] = "~/job-board-frontend" },
}
