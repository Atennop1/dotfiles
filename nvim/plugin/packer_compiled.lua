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
local package_path_str = "/home/atennop/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/home/atennop/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/home/atennop/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/home/atennop/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/atennop/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
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
  LuaSnip = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["gruber-darker.nvim"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/gruber-darker.nvim",
    url = "https://github.com/blazkowolf/gruber-darker.nvim"
  },
  ["markdown-plus.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18markdown-plus\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/opt/markdown-plus.nvim",
    url = "https://github.com/yousefhadder/markdown-plus.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["obsidian.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\3\0\0046\0\0\0009\0\1\0'\2\2\0D\0\2\0\19%H:%M %d-%m-%Y\tdate\aos›\1\0\1\t\0\5\0\0284\1\0\0009\2\0\0\15\0\2\0X\3\r€6\2\1\0009\2\2\0029\4\0\0B\2\2\2\14\0\2\0X\2\a€6\2\3\0009\4\0\0B\2\2\4H\5\1€<\6\5\1F\5\3\3R\5ý\1279\2\4\0\15\0\2\0X\3\a€9\2\4\0\21\2\2\0)\3\0\0\1\3\2\0X\2\2€9\2\4\0=\2\4\1L\1\2\0\ttags\npairs\16tbl_isempty\bvim\rmetadataF\0\1\6\0\5\0\n\18\3\0\0009\1\0\0'\4\1\0'\5\2\0B\1\4\2\18\3\1\0009\1\0\1'\4\3\0'\5\4\0D\1\4\0\5\17[^%w_%-%.%s]\6_\6 \tgsubº\3\1\0\6\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\3\0005\4\6\0>\4\1\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\f\0003\5\v\0=\5\r\4=\4\14\3=\3\15\0023\3\16\0=\3\17\0023\3\18\0=\3\19\2B\0\2\1K\0\1\0\17note_id_func\0\26note_frontmatter_func\0\14templates\18substitutions\15created_at\1\0\1\15created_at\0\0\1\0\2\vfolder\01704_Templates\18substitutions\0\15completion\1\0\1\rnvim_cmp\2\15workspaces\1\0\2\tname\nvault\tpath\22~/documents/vault\aui\1\0\a\15completion\0\14templates\0\26note_frontmatter_func\0\aui\0\17note_id_func\0\15workspaces\0\24disable_frontmatter\1\1\0\1\venable\1\nsetup\robsidian\frequire\0" },
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/obsidian.nvim",
    url = "https://github.com/epwalsh/obsidian.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/atennop/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: obsidian.nvim
time([[Config for obsidian.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\3\0\0046\0\0\0009\0\1\0'\2\2\0D\0\2\0\19%H:%M %d-%m-%Y\tdate\aos›\1\0\1\t\0\5\0\0284\1\0\0009\2\0\0\15\0\2\0X\3\r€6\2\1\0009\2\2\0029\4\0\0B\2\2\2\14\0\2\0X\2\a€6\2\3\0009\4\0\0B\2\2\4H\5\1€<\6\5\1F\5\3\3R\5ý\1279\2\4\0\15\0\2\0X\3\a€9\2\4\0\21\2\2\0)\3\0\0\1\3\2\0X\2\2€9\2\4\0=\2\4\1L\1\2\0\ttags\npairs\16tbl_isempty\bvim\rmetadataF\0\1\6\0\5\0\n\18\3\0\0009\1\0\0'\4\1\0'\5\2\0B\1\4\2\18\3\1\0009\1\0\1'\4\3\0'\5\4\0D\1\4\0\5\17[^%w_%-%.%s]\6_\6 \tgsubº\3\1\0\6\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0024\3\3\0005\4\6\0>\4\1\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\f\0003\5\v\0=\5\r\4=\4\14\3=\3\15\0023\3\16\0=\3\17\0023\3\18\0=\3\19\2B\0\2\1K\0\1\0\17note_id_func\0\26note_frontmatter_func\0\14templates\18substitutions\15created_at\1\0\1\15created_at\0\0\1\0\2\vfolder\01704_Templates\18substitutions\0\15completion\1\0\1\rnvim_cmp\2\15workspaces\1\0\2\tname\nvault\tpath\22~/documents/vault\aui\1\0\a\15completion\0\14templates\0\26note_frontmatter_func\0\aui\0\17note_id_func\0\15workspaces\0\24disable_frontmatter\1\1\0\1\venable\1\nsetup\robsidian\frequire\0", "config", "obsidian.nvim")
time([[Config for obsidian.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-plus.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
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
