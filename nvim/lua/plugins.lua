-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}

    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    -- use 'airblade/vim-gitgutter'
    -- use 'mhinz/vim-signify'
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
         config = function() require('gitsigns').setup() end
    }

    use 'christoomey/vim-tmux-navigator'
    use 'tpope/vim-commentary'
    use 'vim-scripts/dbext.vim'
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'tpope/vim-dotenv'
    use 'jremmen/vim-ripgrep'
    use 'godlygeek/tabular'
    use 'vim-airline/vim-airline'
    use 'elzr/vim-json'
    use 'luochen1990/rainbow'
    use 'editorconfig/editorconfig-vim'
    use 'udalov/kotlin-vim'
    use 'dense-analysis/ale'
    use 'rust-lang/rust.vim'
    use 'lifepillar/pgsql.vim'
    use 'gu-fan/InstantRst'
    use 'gu-fan/riv.vim'
    use 'cespare/vim-toml'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'sbdchd/neoformat'
    use 'janko/vim-test'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- We recommend updating the parsers on update
    use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
    use 'ayu-theme/ayu-vim'


  -- -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'

  -- -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- -- Post-install/update hook with call of vimscript function with argument
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- -- Use specific branch, dependency and run lua file after load
  -- use {
  --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }


end)
