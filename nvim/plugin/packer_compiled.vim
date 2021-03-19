" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/z001rw6/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/z001rw6/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/z001rw6/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/z001rw6/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/z001rw6/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  InstantRst = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/InstantRst"
  },
  ale = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["ayu-vim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/ayu-vim"
  },
  ["dbext.vim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/dbext.vim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["kotlin-vim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/kotlin-vim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["pgsql.vim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/pgsql.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/rainbow"
  },
  ["riv.vim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/riv.vim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  skim = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/skim"
  },
  ["skim.vim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/skim.vim"
  },
  tabular = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-dotenv"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-dotenv"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-json"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-json"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/Users/z001rw6/.local/share/nvim/site/pack/packer/start/vim-toml"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
