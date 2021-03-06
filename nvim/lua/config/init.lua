require 'config.ale'
require 'config.editorconfig'
require 'config.lsp'
require 'config.lualine'
require 'config.neoformat'
require 'config.neogit'
require 'config.navigator'
require 'config.nvim-colorizer'
require 'config.nvim-compe'
require 'config.rainbow'
require 'config.ripgrep'
require 'config.tabularize'
require 'config.telescope'
require 'config.todo-comments'
require 'config.treesitter'
require 'config.trouble'
require 'config.vim-test'

-- try to load dbext config if one is available
-- don't be stupid and add the dbext file to versions control - please
local home = os.getenv("HOME")
local dbext_config_path = home .. '/.config/nvim/lua/config/dbext.lua'
if io.open(dbext_config_path, 'r') then
    require 'config.dbext'
end
