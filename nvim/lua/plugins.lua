-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
-- vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
   use {'wbthomason/packer.nvim'}

    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'airblade/vim-gitgutter'
    use 'christoomey/vim-tmux-navigator'
    -- use 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
    -- use 'scrooloose/nerdcommenter'
    use 'tpope/vim-commentary'
    use 'vim-scripts/dbext.vim'
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'
    use 'tpope/vim-dotenv'
    use 'jremmen/vim-ripgrep'
    use 'godlygeek/tabular'
    use {'lotabout/skim' , run = 'cd ${HOME}/.skim &&./install' }
    use 'lotabout/skim.vim'
    use 'vim-airline/vim-airline'
    use 'elzr/vim-json'
    use 'luochen1990/rainbow'
    use 'editorconfig/editorconfig-vim'
    use 'udalov/kotlin-vim'
    use 'dense-analysis/ale'
    use 'rust-lang/rust.vim'
    -- use 'davidhalter/jedi-vim'
    use 'lifepillar/pgsql.vim'
    use 'gu-fan/InstantRst'
    use 'gu-fan/riv.vim'
    use 'cespare/vim-toml'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'sbdchd/neoformat'
    use 'janko/vim-test'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- We recommend updating the parsers on update
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    -- use 'joshdick/onedark.vim'
    -- use 'tomasiser/vim-code-dark'
    -- use 'rakr/vim-one'
    -- use 'danilo-augusto/vim-afterglow'
    -- use 'nightsense/carbonized'
    -- use 'NLKNguyen/papercolor-theme'
    -- use 'jacoborus/tender.vim'
    -- use 'romainl/apprentice'
    -- use 'rakr/vim-two-firewatch'
    -- use 'tomasr/molokai'
    -- use 'fcevado/molokai_dark'
    -- use 'Heorhiy/VisualStudioDark.vim'
    --" use 'chriskempson/base16-vim'
    use 'ayu-theme/ayu-vim'


 use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}


  -- -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'

  -- -- Lazy loading:
  -- -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- -- Load on a combination of conditions: specific filetypes or commands
  -- -- Also run code after load (see the "config" key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }

  -- -- Plugins can have dependencies on other plugins
  -- use {
  --   'haorenW1025/completion-nvim',
  --   opt = true,
  --   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  -- }

  -- -- Plugins can also depend on rocks from luarocks.org:
  -- use {
  --   'my/supercoolplugin',
  --   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  -- }

  -- -- You can specify rocks in isolation
  -- use_rocks 'penlight'
  -- use_rocks {'lua-resty-http', 'lpeg'}

  -- -- Local plugins can be included
  -- use '~/projects/personal/hover.nvim'

  -- -- Plugins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- -- Post-install/update hook with call of vimscript function with argument
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- -- Use specific branch, dependency and run lua file after load
  -- use {
  --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  -- -- Use dependency and run lua function after load
  -- use {
  --   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --   config = function() require('gitsigns').setup() end
  -- }

  -- -- You can specify multiple plugins in a single call
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}
end)
