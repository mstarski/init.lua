-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    use {
        -- also requires ripgrep for grep command to work
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use("smartpde/telescope-recent-files")
    use({'rose-pine/neovim', as = 'rose-pine'})
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'}, -- Required
            { -- Optional
                'williamboman/mason.nvim',
                run = function() pcall(vim.cmd, 'MasonUpdate') end
            }, {'williamboman/mason-lspconfig.nvim'}, -- Optional
            -- Autocompletion
            {'hrsh7th/nvim-cmp'}, -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'} -- Required
        }
    }

    use('tpope/vim-surround')
    use("klen/nvim-test")
    use("tpope/vim-commentary")
    use("sbdchd/neoformat")

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt = true}
    }

    use("windwp/nvim-autopairs")
    use("ellisonleao/glow.nvim")

    use {"folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons"}

    use("phaazon/hop.nvim")
    use('nvim-tree/nvim-web-devicons')
    use('preservim/nerdcommenter')
    use('christoomey/vim-tmux-navigator')
end)

