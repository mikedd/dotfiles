-- local cmd = vim.api.nvim_command
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function(use)
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use 'tpope/vim-surround'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('gitsigns').setup() end
    }

    use 'numToStr/Navigator.nvim'

    use 'b3nj5m1n/kommentary'
    use 'vim-scripts/dbext.vim'
    use 'jremmen/vim-ripgrep'
    use 'godlygeek/tabular'

    use {
        'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'editorconfig/editorconfig-vim'
    use 'dense-analysis/ale'
    use 'rust-lang/rust.vim'
    use 'lifepillar/pgsql.vim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'sbdchd/neoformat'
    use 'janko/vim-test'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} -- We recommend updating the parsers on update
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use "ayu-theme/ayu-vim"

    use "ChristianChiarulli/nvcode-color-schemes.vim"

    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview'
    }
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'theHamsta/nvim-dap-virtual-text'

    use 'norcalli/nvim-colorizer.lua'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = "kyazdani42/nvim-web-devicons",
    }

    use {
      "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
        }
      end
    }

    -- Adds popups and other stuff using the built in lsp..
    -- use  'glepnir/lspsaga.nvim'

    -- Potential plugins
    -- -- Simple plugins can be specified as strings
    -- use '9mm/vim-closer'

    -- -- Post-install/update hook with call of vimscript function with argument
    -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
end)
