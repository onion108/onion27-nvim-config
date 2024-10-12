-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/onion27/.cache/nvim/packer_hererocks/2.1.1693268511/share/lua/5.1/?.lua;/Users/onion27/.cache/nvim/packer_hererocks/2.1.1693268511/share/lua/5.1/?/init.lua;/Users/onion27/.cache/nvim/packer_hererocks/2.1.1693268511/lib/luarocks/rocks-5.1/?.lua;/Users/onion27/.cache/nvim/packer_hererocks/2.1.1693268511/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/onion27/.cache/nvim/packer_hererocks/2.1.1693268511/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["arm-syntax-vim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/arm-syntax-vim",
    url = "https://github.com/ARM9/arm-syntax-vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["auto-save.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["context.vim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/context.vim",
    url = "https://github.com/wellle/context.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruber-darker.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/gruber-darker.nvim",
    url = "https://github.com/blazkowolf/gruber-darker.nvim"
  },
  ["gruber.vim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/gruber.vim",
    url = "https://github.com/m6vrm/gruber.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["hologram.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/hologram.nvim",
    url = "https://github.com/edluffy/hologram.nvim"
  },
  ["kotlin-vim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/kotlin-vim",
    url = "https://github.com/udalov/kotlin-vim"
  },
  ["lsp-inlayhints.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/lsp-inlayhints.nvim",
    url = "https://github.com/lvimuser/lsp-inlayhints.nvim"
  },
  ["mellow.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/mellow.nvim",
    url = "https://github.com/kvrohit/mellow.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\nÚ\4\0\0\a\0\23\0'6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\v\0'\2\f\0B\0\2\0029\0\r\0005\2\21\0005\3\19\0005\4\17\0005\5\15\0005\6\14\0=\6\16\5=\5\18\4=\4\20\3=\3\22\2B\0\2\1K\0\1\0\30default_component_configs\1\0\0\15filesystem\1\0\0\vwindow\1\0\0\26fuzzy_finder_mappings\1\0\0\1\0\4\n<Tab>\21move_cursor_down\f<S-Tab>\19move_cursor_up\n<C-j>\21move_cursor_down\n<C-k>\19move_cursor_up\nsetup\rneo-tree\frequire\1\0\2\ttext\a??\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\a? \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\a? \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\a? \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\bvim\0" },
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-scrollbar"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pride.vim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/pride.vim",
    url = "https://github.com/haoyu953/pride.vim"
  },
  ["scratch.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fscratch\frequire\0" },
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/scratch.nvim",
    url = "https://git.sr.ht/~swaits/scratch.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tender.vim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/tender.vim",
    url = "https://github.com/jacoborus/tender.vim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nh\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\20insert_mappings\1\17open_mapping\15<leader>ot\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["typst.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/opt/typst.vim",
    url = "https://github.com/kaarmu/typst.vim"
  },
  ["v-vim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/v-vim",
    url = "https://github.com/ollykel/v-vim"
  },
  vim = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/vim",
    url = "https://github.com/dracula/vim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-apl"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/vim-apl",
    url = "https://github.com/PyGamer0/vim-apl"
  },
  ["vim-asm_ca65"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/vim-asm_ca65",
    url = "https://github.com/maxbane/vim-asm_ca65"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0" },
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zig.vim"] = {
    loaded = true,
    path = "/Users/onion27/.local/share/nvim/site/pack/packer/start/zig.vim",
    url = "https://github.com/ziglang/zig.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nt\0\0\3\0\a\0\0156\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\3\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\15timeoutlen\ftimeout\6o\bvim\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nh\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\20insert_mappings\1\17open_mapping\15<leader>ot\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: scratch.nvim
time([[Config for scratch.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fscratch\frequire\0", "config", "scratch.nvim")
time([[Config for scratch.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nÚ\4\0\0\a\0\23\0'6\0\0\0009\0\1\0009\0\2\0'\2\3\0005\3\4\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\5\0005\3\6\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0005\3\b\0B\0\3\0016\0\0\0009\0\1\0009\0\2\0'\2\t\0005\3\n\0B\0\3\0016\0\v\0'\2\f\0B\0\2\0029\0\r\0005\2\21\0005\3\19\0005\4\17\0005\5\15\0005\6\14\0=\6\16\5=\5\18\4=\4\20\3=\3\22\2B\0\2\1K\0\1\0\30default_component_configs\1\0\0\15filesystem\1\0\0\vwindow\1\0\0\26fuzzy_finder_mappings\1\0\0\1\0\4\n<Tab>\21move_cursor_down\f<S-Tab>\19move_cursor_up\n<C-j>\21move_cursor_down\n<C-k>\19move_cursor_up\nsetup\rneo-tree\frequire\1\0\2\ttext\a??\vtexthl\23DiagnosticSignHint\23DiagnosticSignHint\1\0\2\ttext\a? \vtexthl\23DiagnosticSignInfo\23DiagnosticSignInfo\1\0\2\ttext\a? \vtexthl\23DiagnosticSignWarn\23DiagnosticSignWarn\1\0\2\ttext\a? \vtexthl\24DiagnosticSignError\24DiagnosticSignError\16sign_define\afn\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typst ++once lua require("packer.load")({'typst.vim'}, { ft = "typst" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/onion27/.local/share/nvim/site/pack/packer/opt/typst.vim/ftdetect/typst.vim]], true)
vim.cmd [[source /Users/onion27/.local/share/nvim/site/pack/packer/opt/typst.vim/ftdetect/typst.vim]]
time([[Sourcing ftdetect script at: /Users/onion27/.local/share/nvim/site/pack/packer/opt/typst.vim/ftdetect/typst.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
