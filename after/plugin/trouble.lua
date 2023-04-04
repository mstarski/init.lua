require("trouble").setup({icons = false})

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
               {silent = true, noremap = true})

