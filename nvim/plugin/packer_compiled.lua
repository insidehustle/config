-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/luke.caradine/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/luke.caradine/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/luke.caradine/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/luke.caradine/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/luke.caradine/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    config = { "\27LJ\2\n]\0\0\6\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0004\4\3\0005\5\3\0>\5\1\4=\4\5\3B\1\2\1K\0\1\0\fsources\1\0\0\1\0\1\tname\tpath\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nG\0\0\4\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\bhop\frequire\npcall\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp-colors.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\5\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\4\0B\2\2\1K\0\1\0\1\0\4\fWarning\f#e0af68\16Information\f#0db9d7\nError\f#db4b4b\tHint\f#10B981\nsetup\15lsp-colors\frequire\npcall\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\a\0\r6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\4B\2\2\1K\0\1\0\15symbol_map\1\0\25\14Interface\b\rOperator\b\nClass\bﴯ\nEvent\b\rVariable\b\vStruct\bפּ\nField\bﰠ\rConstant\b\16Constructor\b\15EnumMember\b\rFunction\b\vFolder\b\vMethod\b\14Reference\b\tText\b\tFile\b\nColor\b\fSnippet\b\fKeyword\b\tEnum\b\nValue\b\tUnit\b塞\rProperty\bﰠ\vModule\b\18TypeParameter\b\1\0\2\vpreset\rcodicons\tmode\vsymbol\tinit\flspkind\frequire\npcall\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\ny\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\24server_filetype_map\1\0\0\1\0\1\15typescript\15typescript\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nZ\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\tauto\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\21ensure_installed\1\0\0\1\n\0\0\ngopls\18golangci_lint\rtsserver\18rust_analyzer\vyamlls\rdockerls\16sumneko_lua\vbashls\vjsonls\nsetup\20mason-lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\nM\0\0\5\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\nmason\frequire\npcall\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\r\0\23\0)6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0019\2\4\0029\3\3\0019\3\5\0039\4\3\0019\4\6\0049\5\a\0015\a\b\0004\b\6\0009\t\t\0029\t\n\t5\v\f\0005\f\v\0=\f\r\v5\f\14\0=\f\15\vB\t\2\2>\t\1\b9\t\16\2>\t\2\b9\t\17\4>\t\3\b9\t\18\0029\t\n\t5\v\20\0005\f\19\0=\f\15\vB\t\2\2>\t\4\b9\t\21\3>\t\5\b=\b\22\aB\5\2\1K\0\1\0\fsources\18golangci_lint\1\0\0\1\2\0\0\19--edition=2021\frustfmt\fluasnip\vstylua\15extra_args\1\4\0\0\14--no-semi\19--single-quote\23--jsx-single-quote\20extra_filetypes\1\0\0\1\2\0\0\ttoml\twith\rprettier\1\0\1\ndebug\1\nsetup\15completion\16diagnostics\15formatting\rbuiltins\fnull-ls\frequire\npcall\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\3\0\0\20TelescopePrompt\bvim\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\5\1\0\r\0(\0H6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0@�6\2\1\0'\4\3\0B\2\2\0029\3\4\0015\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0059\6\n\0019\6\v\0069\6\f\0065\b\14\0009\t\n\0019\t\r\t)\v��B\t\2\2=\t\15\b9\t\n\0019\t\r\t)\v\4\0B\t\2\2=\t\16\b9\t\n\0019\t\17\tB\t\1\2=\t\18\b9\t\n\0019\t\19\tB\t\1\2=\t\20\b9\t\n\0019\t\21\t5\v\24\0009\f\22\0019\f\23\f=\f\25\vB\t\2\2=\t\26\bB\6\2\2=\6\n\0059\6\27\0019\6\28\0064\b\4\0005\t\29\0>\t\1\b5\t\30\0>\t\2\b5\t\31\0>\t\3\bB\6\2\2=\6\28\0055\6\"\0009\a \0025\t!\0B\a\2\2=\a#\6=\6$\5B\3\2\0016\3%\0009\3&\3'\5'\0B\3\2\1K\0\1\0K\0\1\0�\1              set completeopt=menuone,noinsert,noselect\n              highlight! default link CmpItemKind CmpItemMenuDefault\n            \bcmd\bvim\15formatting\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\1\15cmp_format\1\0\1\tname\rluasnips\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\flspkind\bcmp\frequire\npcall\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    after = { "null-ls.nvim" },
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1�\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1�\24nvim_buf_set_option\bapi\bvim?\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\24formatting_seq_sync\bbuf\blsp\bvim�\3\1\2\r\0\24\0)3\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0\18\5\2\0'\a\5\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\0019\5\n\0009\5\v\5\15\0\5\0X\6\16�6\5\f\0009\5\r\0059\5\14\5'\a\15\0005\b\19\0006\t\f\0009\t\r\t9\t\16\t'\v\17\0005\f\18\0B\t\3\2=\t\20\b=\1\21\b3\t\22\0=\t\23\bB\5\3\0012\0\0�K\0\1\0\rcallback\0\vbuffer\ngroup\1\0\0\1\0\1\nclear\2\vFormat\24nvim_create_augroup\16BufWritePre\24nvim_create_autocmd\bapi\bvim\31documentFormattingProvider\24server_capabilities.<cmd>lua vim.lsp.buf.implementation()<CR>\agi+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0�\22\1\0\17\0q\0�\0016\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0р6\2\1\0'\4\3\0B\2\2\0023\3\4\0005\4\6\0=\4\5\0026\4\1\0'\6\a\0B\4\2\0029\4\b\0046\6\t\0009\6\n\0069\6\v\0069\6\f\6B\6\1\0A\4\0\0029\5\r\0019\5\14\0055\a\15\0=\3\16\a=\4\17\aB\5\2\0019\5\18\0019\5\14\0055\a\19\0=\3\16\a5\b\20\0=\b\21\a5\b\22\0=\b\23\a=\4\17\aB\5\2\0019\5\24\0019\5\14\0055\a\25\0=\3\16\aB\5\2\0019\5\26\0019\5\14\0055\a\27\0=\3\16\a5\b'\0005\t\31\0005\n\29\0005\v\28\0=\v\30\n=\n \t5\n$\0006\v\t\0009\v!\v9\v\"\v'\r#\0+\14\2\0B\v\3\2=\v%\n=\n&\t=\t(\b=\b)\aB\5\2\0019\5*\0019\5\14\0055\a,\0005\b+\0=\b\23\a5\b0\0005\t.\0005\n-\0=\n/\t=\t*\b=\b)\a=\3\16\a=\4\17\aB\5\2\0016\5\1\0'\a1\0B\5\2\0029\5\14\5B\5\1\0016\5\t\0009\5!\0059\0052\5'\a3\0+\b\1\0B\5\3\0016\5\t\0009\5!\0059\0052\5'\a4\0+\b\1\0B\5\3\0019\5\18\0019\5\14\0055\a5\0=\3\16\a=\4\17\aB\5\2\0015\0059\0005\0066\0005\a7\0=\a8\6=\6:\0055\6;\0=\3\16\6=\4\17\0065\aC\0005\b=\0005\t<\0=\t>\b5\t?\0=\t@\b5\tA\0=\tB\b=\bD\a5\bF\0005\tE\0=\tG\b=\bH\a=\a)\6=\6I\0056\6\1\0'\bJ\0B\6\2\0029\6\14\6\18\b\5\0B\6\2\0019\6K\0019\6\14\0065\bL\0=\4\17\b5\tP\0005\nN\0005\vM\0=\vO\n=\nQ\t=\t)\bB\6\2\0019\6R\0019\6\14\0065\bS\0=\4\17\b=\3\16\bB\6\2\0019\6T\0019\6\14\0065\bU\0=\4\17\b=\3\16\bB\6\2\0019\6V\0019\6\14\0065\bW\0=\3\16\b=\4\17\bB\6\2\0019\6X\0019\6\14\0065\bY\0=\4\17\b=\3\16\bB\6\2\0019\6Z\0019\6\14\0065\b[\0=\4\17\b=\3\16\bB\6\2\0016\6\t\0009\6\n\0069\6\\\0066\a\t\0009\a\n\a9\a^\a6\t\t\0009\t\n\t9\t_\t9\t`\t5\na\0005\vb\0=\vc\nB\a\3\2=\a]\0065\6d\0006\ae\0\18\t\6\0B\a\2\4H\n\v�'\ff\0\18\r\n\0&\f\r\f6\r\t\0009\rg\r9\rh\r\18\15\f\0005\16i\0=\vj\16=\fk\16B\r\3\1F\n\3\3R\n�6\a\t\0009\a_\a9\al\a5\tn\0005\nm\0=\nc\t5\no\0=\np\tB\a\2\1K\0\1\0K\0\1\0\nfloat\1\0\1\vsource\valways\1\0\1\21update_in_insert\2\1\0\1\vprefix\b●\vconfig\vtexthl\ttext\1\0\1\nnumhl\5\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\t \tWarn\t \nError\t \tInfo\t \17virtual_text\1\0\2\fspacing\3\4\vprefix\b●\1\0\3\21update_in_insert\1\14underline\2\18severity_sort\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\1\0\0\vbashls\1\0\0\nsqlls\1\0\0\rdockerls\1\0\0\vjsonls\1\0\0\nvimls\tyaml\1\0\0\fschemas\1\0\0\1\4\4\0\24virtualservice.yaml\14vscv.yaml\fgw.yaml6https://json.schemastore.org/github-workflow.json\25/.github/workflows/*shttps://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json\16/*.k8s.yamlehttps://raw.githubusercontent.com/istio/api/master/kubernetes/customresourcedefinitions.gen.yaml\17gateway.yaml4https://json.schemastore.org/kustomization.json\19kustomize.yaml\1\0\0\vyamlls\15rust-tools\vserver\15inlayHints\25lifetimeElisionHints\1\0\0\1\0\2\22useParameterNames\2\venable\2\18rust-analyzer\1\0\0\16checkOnSave\1\0\1\fcommand\vclippy\ncargo\1\0\1\16allFeatures\2\vassist\1\0\0\1\0\2\17importPrefix\ncrate\29importEnforceGranularity\2\1\0\0\ntools\1\0\0\16inlay_hints\1\0\3\23other_hints_prefix\5\27parameter_hints_prefix\5\25show_parameter_hints\2\1\0\2\23hover_with_actions\2\17autoSetHints\2\1\0\0L autocmd BufWritePre *.go :silent! lua require('go.format').goimport() I autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() \14nvim_exec\ago\1\0\0\ranalyses\1\0\4\20usePlaceholders\2\16staticcheck\2\fgofumpt\2#experimentalPostfixCompletions\2\1\0\4\16unusedwrite\2\17unusedparams\2\fnilness\2\vuseany\2\1\0\0\1\2\0\0\ngopls\ngopls\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\1\20checkThirdParty\1\5\26nvim_get_runtime_file\bapi\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\1\0\0\16sumneko_lua\1\0\0\14sourcekit\bcmd\1\3\0\0\31typescript-language-server\f--stdio\14filetypes\1\4\0\0\15typescript\20typescriptreact\19typescript.tsx\1\0\0\rtsserver\17capabilities\14on_attach\1\0\0\nsetup\tflow\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\1\26\0\0\b\b\b\b\b\b\b\bﰮ\b\b\b\b\b\b\b﬌\b\b\b\b\b\b\b\b\bﬦ\b\23CompletionItemKind\0\21vim.lsp.protocol\14lspconfig\frequire\npcall\0" },
    loaded = true,
    only_config = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-transparent"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\16transparent\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\a\0\0\15\0(\0A6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0006\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1�K\0\1\0009\4\4\0039\5\5\0015\a\6\0005\b\a\0=\b\b\a5\b\t\0005\t\15\0005\n\n\0005\v\v\0=\v\f\n5\v\r\0=\v\14\n=\n\16\t=\t\17\b=\b\18\a5\b\20\0005\t\19\0=\t\21\b=\b\22\a5\b\23\0005\t\24\0=\t\17\b=\b\25\a5\b\26\0005\t$\0004\n\4\0005\v\28\0005\f\27\0=\f\29\v\18\f\4\0'\14\30\0B\f\2\2=\f\31\v>\v\1\n5\v \0\18\f\4\0'\14!\0B\f\2\2=\f\31\v>\v\2\n5\v\"\0\18\f\4\0'\14#\0B\f\2\2=\f\31\v>\v\3\n=\n%\t=\t&\b=\b'\aB\5\2\1K\0\1\0\tview\rmappings\tlist\1\0\0\vvsplit\1\0\1\bkey\6v\15close_node\1\0\1\bkey\6h\acb\tedit\bkey\1\0\0\1\4\0\0\6l\t<CR>\6o\1\0\3\tside\tleft\vheight\3\30\nwidth\3\30\16diagnostics\1\0\4\nerror\b\tinfo\b\fwarning\b\thint\b\1\0\2\17show_on_dirs\2\venable\2\ffilters\vcustom\1\0\0\1\2\0\0\t.git\rrenderer\nicons\vglyphs\1\0\0\bgit\1\0\a\14untracked\6U\runmerged\b\fdeleted\b\vstaged\6S\fignored\b◌\runstaged\b\frenamed\b➜\vfolder\1\0\b\15empty_open\b\15arrow_open\b\topen\b\nempty\b\fdefault\b\fsymlink\b\17symlink_open\b\17arrow_closed\b\1\0\2\fsymlink\b\fdefault\b\1\0\1\25root_folder_modifier\a:t\24update_focused_file\1\0\2\15update_cwd\2\venable\2\1\0\2\15update_cwd\2\20respect_buf_cwd\2\nsetup\23nvim_tree_callback\21nvim-tree.config\14nvim-tree\frequire\npcall\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\14highlight\fdisable\1\3\0\0\6c\trust\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\r\0\0\ago\tjson\tyaml\blua\trust\15dockerfile\nregex\btsx\ttoml\bcss\15javascript\thtml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15stopinsert\bcmd\bvim�\v\1\0\f\0M\1c6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6*\0005\a\6\0005\b\b\0005\t\a\0=\t\t\b5\t\n\0=\t\v\b=\b\f\a5\b\r\0=\b\14\a5\b#\0005\t\16\0009\n\15\1=\n\17\t9\n\18\1=\n\19\t9\n\20\1=\n\21\t9\n\22\1=\n\23\t9\n\24\2=\n\25\t9\n\26\0019\v\27\1 \n\v\n=\n\28\t3\n\29\0=\n\30\t9\n\31\1=\n \t9\n!\3=\n\"\t=\t$\b5\t%\0009\n!\3=\n\"\t=\t&\b=\b'\a5\b(\0=\b)\a=\a+\0065\a-\0005\b,\0=\b.\a5\b/\0=\b0\a5\b1\0005\t5\0005\n3\0009\v2\1=\v4\n=\n$\t=\t'\b=\b6\a5\b8\0005\t7\0=\t9\b=\b:\a5\b<\0005\t;\0=\t=\b=\b>\a5\b?\0=\b@\a5\bA\0=\bB\a=\aC\0065\aF\0004\b\3\0006\t\0\0'\vD\0B\t\2\0029\tE\t4\v\0\0B\t\2\0?\t\0\0=\bG\a5\bH\0=\bI\a4\b\0\0=\bJ\a4\b\0\0=\bK\a=\aL\6B\4\2\1K\0\1\0\15extensions\17file-browser\fproject\bfzf\1\0\2\nfuzzy\2\14case_mode\15smart_case\14ui-select\1\0\0\17get_dropdown\21telescope.themes\fpickers\30current_buffer_fuzzy_find\1\0\1\ntheme\rdropdown\21lsp_code_actions\1\0\1\ntheme\rdropdown\19lsp_references\17path_display\1\0\0\1\2\0\0\fshorten\14man_pages\rsections\1\0\0\1\3\0\0\0062\0063\fbuffers\1\0\0\n<c-d>\1\0\0\18delete_buffer\1\0\3\rsort_mru\2\ntheme\rdropdown\14previewer\1\14git_files\1\0\2\14previewer\1\ntheme\rdropdown\17file_browser\1\0\0\1\0\2\14previewer\1\ntheme\rdropdown\rdefaults\1\0\0\25file_ignore_patterns\1\2\0\0\17src/parser.c\rmappings\6n\1\0\0\6i\1\0\0\n<c-t>\22open_with_trouble\n<esc>\nclose\n<c-c>\0\n<C-q>\16open_qflist\25smart_send_to_qflist\n<C-h>\19toggle_preview\v<C-Up>\23cycle_history_prev\r<C-Down>\23cycle_history_next\n<C-a>\26cycle_previewers_prev\n<C-s>\1\0\1\n<a-q>\1\26cycle_previewers_next\fpreview\1\0\1\20msg_bg_fillchar\6 \18layout_config\vcenter\1\0\1\vmirror\2\rvertical\1\0\0\1\0\1\vmirror\2\1\0\b\23selection_strategy\nreset\26dynamic_preview_title\2\20scroll_strategy\ncycle\20layout_strategy\tflex\15multi_icon\5\ncache\1\18hl_result_eol\1\rwinblend\3\0\nsetup trouble.providers.telescope\29telescope.actions.layout\22telescope.actions\14telescope\frequire\3����\4\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "plenary.nvim", "popup.nvim", "telescope-fzf-native.nvim", "telescope-project.nvim", "telescope-file-browser.nvim", "telescope-ui-select.nvim",
      module = "telescope"
    }
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\b\0\16\00085\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\a\0'\6\6\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\b\0'\6\t\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\n\0'\6\v\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\f\0'\6\r\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\14\0'\6\15\0\18\a\0\0B\1\6\1K\0\1\0\21<C-\\><C-n><C-W>l\n<C-l>\21<C-\\><C-n><C-W>k\n<C-k>\21<C-\\><C-n><C-W>j\n<C-j>\21<C-\\><C-n><C-W>h\n<C-h>\ajk\15<C-\\><C-n>\n<esc>\6t\24nvim_buf_set_keymap\bapi\bvim\1\0\1\fnoremap\2�\3\1\0\a\0\18\0\0296\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0\21�9\2\3\0015\4\4\0004\5\0\0=\5\5\0046\5\6\0009\5\a\0059\5\b\5=\5\b\0045\5\t\0005\6\n\0=\6\v\5=\5\f\4B\2\2\0016\2\r\0003\3\15\0=\3\14\0026\2\6\0009\2\16\2'\4\17\0B\2\2\1K\0\1\0K\0\1\0:autocmd! TermOpen term://* lua set_terminal_keymaps()\bcmd\0\25set_terminal_keymaps\a_G\15float_opts\15highlights\1\0\2\vborder\vNormal\15background\vNormal\1\0\2\vborder\vcurved\rwinblend\3\0\nshell\6o\bvim\20shade_filetypes\1\0\n\17hide_numbers\2\17open_mapping\n<c-\\>\tsize\3\20\18close_on_exit\2\14direction\nfloat\17persist_size\2\20insert_mappings\2\20start_in_insert\2\19shading_factor\3\2\20shade_terminals\2\nsetup\15toggleterm\frequire\npcall\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/luke.caradine/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nG\0\0\4\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\bhop\frequire\npcall\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-transparent
time([[Config for nvim-transparent]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\16transparent\frequire\0", "config", "nvim-transparent")
time([[Config for nvim-transparent]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nM\0\0\5\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\nmason\frequire\npcall\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\b\0\16\00085\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\a\0'\6\6\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\b\0'\6\t\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\n\0'\6\v\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\f\0'\6\r\0\18\a\0\0B\1\6\0016\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0'\5\14\0'\6\15\0\18\a\0\0B\1\6\1K\0\1\0\21<C-\\><C-n><C-W>l\n<C-l>\21<C-\\><C-n><C-W>k\n<C-k>\21<C-\\><C-n><C-W>j\n<C-j>\21<C-\\><C-n><C-W>h\n<C-h>\ajk\15<C-\\><C-n>\n<esc>\6t\24nvim_buf_set_keymap\bapi\bvim\1\0\1\fnoremap\2�\3\1\0\a\0\18\0\0296\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0\21�9\2\3\0015\4\4\0004\5\0\0=\5\5\0046\5\6\0009\5\a\0059\5\b\5=\5\b\0045\5\t\0005\6\n\0=\6\v\5=\5\f\4B\2\2\0016\2\r\0003\3\15\0=\3\14\0026\2\6\0009\2\16\2'\4\17\0B\2\2\1K\0\1\0K\0\1\0:autocmd! TermOpen term://* lua set_terminal_keymaps()\bcmd\0\25set_terminal_keymaps\a_G\15float_opts\15highlights\1\0\2\vborder\vNormal\15background\vNormal\1\0\2\vborder\vcurved\rwinblend\3\0\nshell\6o\bvim\20shade_filetypes\1\0\n\17hide_numbers\2\17open_mapping\n<c-\\>\tsize\3\20\18close_on_exit\2\14direction\nfloat\17persist_size\2\20insert_mappings\2\20start_in_insert\2\19shading_factor\3\2\20shade_terminals\2\nsetup\15toggleterm\frequire\npcall\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\a\0\0\15\0(\0A6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0006\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1�K\0\1\0009\4\4\0039\5\5\0015\a\6\0005\b\a\0=\b\b\a5\b\t\0005\t\15\0005\n\n\0005\v\v\0=\v\f\n5\v\r\0=\v\14\n=\n\16\t=\t\17\b=\b\18\a5\b\20\0005\t\19\0=\t\21\b=\b\22\a5\b\23\0005\t\24\0=\t\17\b=\b\25\a5\b\26\0005\t$\0004\n\4\0005\v\28\0005\f\27\0=\f\29\v\18\f\4\0'\14\30\0B\f\2\2=\f\31\v>\v\1\n5\v \0\18\f\4\0'\14!\0B\f\2\2=\f\31\v>\v\2\n5\v\"\0\18\f\4\0'\14#\0B\f\2\2=\f\31\v>\v\3\n=\n%\t=\t&\b=\b'\aB\5\2\1K\0\1\0\tview\rmappings\tlist\1\0\0\vvsplit\1\0\1\bkey\6v\15close_node\1\0\1\bkey\6h\acb\tedit\bkey\1\0\0\1\4\0\0\6l\t<CR>\6o\1\0\3\tside\tleft\vheight\3\30\nwidth\3\30\16diagnostics\1\0\4\nerror\b\tinfo\b\fwarning\b\thint\b\1\0\2\17show_on_dirs\2\venable\2\ffilters\vcustom\1\0\0\1\2\0\0\t.git\rrenderer\nicons\vglyphs\1\0\0\bgit\1\0\a\14untracked\6U\runmerged\b\fdeleted\b\vstaged\6S\fignored\b◌\runstaged\b\frenamed\b➜\vfolder\1\0\b\15empty_open\b\15arrow_open\b\topen\b\nempty\b\fdefault\b\fsymlink\b\17symlink_open\b\17arrow_closed\b\1\0\2\fsymlink\b\fdefault\b\1\0\1\25root_folder_modifier\a:t\24update_focused_file\1\0\2\15update_cwd\2\venable\2\1\0\2\15update_cwd\2\20respect_buf_cwd\2\nsetup\23nvim_tree_callback\21nvim-tree.config\14nvim-tree\frequire\npcall\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\14highlight\fdisable\1\3\0\0\6c\trust\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\r\0\0\ago\tjson\tyaml\blua\trust\15dockerfile\nregex\btsx\ttoml\bcss\15javascript\thtml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: cmp-path
time([[Config for cmp-path]], true)
try_loadstring("\27LJ\2\n]\0\0\6\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0004\4\3\0005\5\3\0>\5\1\4=\4\5\3B\1\2\1K\0\1\0\fsources\1\0\0\1\0\1\tname\tpath\nsetup\bcmp\frequire\0", "config", "cmp-path")
time([[Config for cmp-path]], false)
-- Config for: lsp-colors.nvim
time([[Config for lsp-colors.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\5\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\4\0B\2\2\1K\0\1\0\1\0\4\fWarning\f#e0af68\16Information\f#0db9d7\nError\f#db4b4b\tHint\f#10B981\nsetup\15lsp-colors\frequire\npcall\0", "config", "lsp-colors.nvim")
time([[Config for lsp-colors.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\a\0\r6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\4B\2\2\1K\0\1\0\15symbol_map\1\0\25\14Interface\b\rOperator\b\nClass\bﴯ\nEvent\b\rVariable\b\vStruct\bפּ\nField\bﰠ\rConstant\b\16Constructor\b\15EnumMember\b\rFunction\b\vFolder\b\vMethod\b\14Reference\b\tText\b\tFile\b\nColor\b\fSnippet\b\fKeyword\b\tEnum\b\nValue\b\tUnit\b塞\rProperty\bﰠ\vModule\b\18TypeParameter\b\1\0\2\vpreset\rcodicons\tmode\vsymbol\tinit\flspkind\frequire\npcall\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\3\0\0\20TelescopePrompt\bvim\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\ny\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\24server_filetype_map\1\0\0\1\0\1\15typescript\15typescript\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\5\1\0\r\0(\0H6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0@�6\2\1\0'\4\3\0B\2\2\0029\3\4\0015\5\b\0005\6\6\0003\a\5\0=\a\a\6=\6\t\0059\6\n\0019\6\v\0069\6\f\0065\b\14\0009\t\n\0019\t\r\t)\v��B\t\2\2=\t\15\b9\t\n\0019\t\r\t)\v\4\0B\t\2\2=\t\16\b9\t\n\0019\t\17\tB\t\1\2=\t\18\b9\t\n\0019\t\19\tB\t\1\2=\t\20\b9\t\n\0019\t\21\t5\v\24\0009\f\22\0019\f\23\f=\f\25\vB\t\2\2=\t\26\bB\6\2\2=\6\n\0059\6\27\0019\6\28\0064\b\4\0005\t\29\0>\t\1\b5\t\30\0>\t\2\b5\t\31\0>\t\3\bB\6\2\2=\6\28\0055\6\"\0009\a \0025\t!\0B\a\2\2=\a#\6=\6$\5B\3\2\0016\3%\0009\3&\3'\5'\0B\3\2\1K\0\1\0K\0\1\0�\1              set completeopt=menuone,noinsert,noselect\n              highlight! default link CmpItemKind CmpItemMenuDefault\n            \bcmd\bvim\15formatting\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\1\15cmp_format\1\0\1\tname\rluasnips\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\flspkind\bcmp\frequire\npcall\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1�\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1�\24nvim_buf_set_option\bapi\bvim?\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\24formatting_seq_sync\bbuf\blsp\bvim�\3\1\2\r\0\24\0)3\2\0\0003\3\1\0\18\4\3\0'\6\2\0'\a\3\0B\4\3\0015\4\4\0\18\5\2\0'\a\5\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\5\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\0019\5\n\0009\5\v\5\15\0\5\0X\6\16�6\5\f\0009\5\r\0059\5\14\5'\a\15\0005\b\19\0006\t\f\0009\t\r\t9\t\16\t'\v\17\0005\f\18\0B\t\3\2=\t\20\b=\1\21\b3\t\22\0=\t\23\bB\5\3\0012\0\0�K\0\1\0\rcallback\0\vbuffer\ngroup\1\0\0\1\0\1\nclear\2\vFormat\24nvim_create_augroup\16BufWritePre\24nvim_create_autocmd\bapi\bvim\31documentFormattingProvider\24server_capabilities.<cmd>lua vim.lsp.buf.implementation()<CR>\agi+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\fnoremap\2\vsilent\2\27v:lua.vim.lsp.omnifunc\romnifunc\0\0�\22\1\0\17\0q\0�\0016\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�2\0р6\2\1\0'\4\3\0B\2\2\0023\3\4\0005\4\6\0=\4\5\0026\4\1\0'\6\a\0B\4\2\0029\4\b\0046\6\t\0009\6\n\0069\6\v\0069\6\f\6B\6\1\0A\4\0\0029\5\r\0019\5\14\0055\a\15\0=\3\16\a=\4\17\aB\5\2\0019\5\18\0019\5\14\0055\a\19\0=\3\16\a5\b\20\0=\b\21\a5\b\22\0=\b\23\a=\4\17\aB\5\2\0019\5\24\0019\5\14\0055\a\25\0=\3\16\aB\5\2\0019\5\26\0019\5\14\0055\a\27\0=\3\16\a5\b'\0005\t\31\0005\n\29\0005\v\28\0=\v\30\n=\n \t5\n$\0006\v\t\0009\v!\v9\v\"\v'\r#\0+\14\2\0B\v\3\2=\v%\n=\n&\t=\t(\b=\b)\aB\5\2\0019\5*\0019\5\14\0055\a,\0005\b+\0=\b\23\a5\b0\0005\t.\0005\n-\0=\n/\t=\t*\b=\b)\a=\3\16\a=\4\17\aB\5\2\0016\5\1\0'\a1\0B\5\2\0029\5\14\5B\5\1\0016\5\t\0009\5!\0059\0052\5'\a3\0+\b\1\0B\5\3\0016\5\t\0009\5!\0059\0052\5'\a4\0+\b\1\0B\5\3\0019\5\18\0019\5\14\0055\a5\0=\3\16\a=\4\17\aB\5\2\0015\0059\0005\0066\0005\a7\0=\a8\6=\6:\0055\6;\0=\3\16\6=\4\17\0065\aC\0005\b=\0005\t<\0=\t>\b5\t?\0=\t@\b5\tA\0=\tB\b=\bD\a5\bF\0005\tE\0=\tG\b=\bH\a=\a)\6=\6I\0056\6\1\0'\bJ\0B\6\2\0029\6\14\6\18\b\5\0B\6\2\0019\6K\0019\6\14\0065\bL\0=\4\17\b5\tP\0005\nN\0005\vM\0=\vO\n=\nQ\t=\t)\bB\6\2\0019\6R\0019\6\14\0065\bS\0=\4\17\b=\3\16\bB\6\2\0019\6T\0019\6\14\0065\bU\0=\4\17\b=\3\16\bB\6\2\0019\6V\0019\6\14\0065\bW\0=\3\16\b=\4\17\bB\6\2\0019\6X\0019\6\14\0065\bY\0=\4\17\b=\3\16\bB\6\2\0019\6Z\0019\6\14\0065\b[\0=\4\17\b=\3\16\bB\6\2\0016\6\t\0009\6\n\0069\6\\\0066\a\t\0009\a\n\a9\a^\a6\t\t\0009\t\n\t9\t_\t9\t`\t5\na\0005\vb\0=\vc\nB\a\3\2=\a]\0065\6d\0006\ae\0\18\t\6\0B\a\2\4H\n\v�'\ff\0\18\r\n\0&\f\r\f6\r\t\0009\rg\r9\rh\r\18\15\f\0005\16i\0=\vj\16=\fk\16B\r\3\1F\n\3\3R\n�6\a\t\0009\a_\a9\al\a5\tn\0005\nm\0=\nc\t5\no\0=\np\tB\a\2\1K\0\1\0K\0\1\0\nfloat\1\0\1\vsource\valways\1\0\1\21update_in_insert\2\1\0\1\vprefix\b●\vconfig\vtexthl\ttext\1\0\1\nnumhl\5\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\t \tWarn\t \nError\t \tInfo\t \17virtual_text\1\0\2\fspacing\3\4\vprefix\b●\1\0\3\21update_in_insert\1\14underline\2\18severity_sort\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\1\0\0\vbashls\1\0\0\nsqlls\1\0\0\rdockerls\1\0\0\vjsonls\1\0\0\nvimls\tyaml\1\0\0\fschemas\1\0\0\1\4\4\0\24virtualservice.yaml\14vscv.yaml\fgw.yaml6https://json.schemastore.org/github-workflow.json\25/.github/workflows/*shttps://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json\16/*.k8s.yamlehttps://raw.githubusercontent.com/istio/api/master/kubernetes/customresourcedefinitions.gen.yaml\17gateway.yaml4https://json.schemastore.org/kustomization.json\19kustomize.yaml\1\0\0\vyamlls\15rust-tools\vserver\15inlayHints\25lifetimeElisionHints\1\0\0\1\0\2\22useParameterNames\2\venable\2\18rust-analyzer\1\0\0\16checkOnSave\1\0\1\fcommand\vclippy\ncargo\1\0\1\16allFeatures\2\vassist\1\0\0\1\0\2\17importPrefix\ncrate\29importEnforceGranularity\2\1\0\0\ntools\1\0\0\16inlay_hints\1\0\3\23other_hints_prefix\5\27parameter_hints_prefix\5\25show_parameter_hints\2\1\0\2\23hover_with_actions\2\17autoSetHints\2\1\0\0L autocmd BufWritePre *.go :silent! lua require('go.format').goimport() I autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() \14nvim_exec\ago\1\0\0\ranalyses\1\0\4\20usePlaceholders\2\16staticcheck\2\fgofumpt\2#experimentalPostfixCompletions\2\1\0\4\16unusedwrite\2\17unusedparams\2\fnilness\2\vuseany\2\1\0\0\1\2\0\0\ngopls\ngopls\rsettings\bLua\1\0\0\14workspace\flibrary\1\0\1\20checkThirdParty\1\5\26nvim_get_runtime_file\bapi\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\1\0\0\16sumneko_lua\1\0\0\14sourcekit\bcmd\1\3\0\0\31typescript-language-server\f--stdio\14filetypes\1\4\0\0\15typescript\20typescriptreact\19typescript.tsx\1\0\0\rtsserver\17capabilities\14on_attach\1\0\0\nsetup\tflow\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\1\26\0\0\b\b\b\b\b\b\b\bﰮ\b\b\b\b\b\b\b﬌\b\b\b\b\b\b\b\b\bﬦ\b\23CompletionItemKind\0\21vim.lsp.protocol\14lspconfig\frequire\npcall\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nZ\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\tauto\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: mason-lspconfig.nvim
time([[Config for mason-lspconfig.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\21ensure_installed\1\0\0\1\n\0\0\ngopls\18golangci_lint\rtsserver\18rust_analyzer\vyamlls\rdockerls\16sumneko_lua\vbashls\vjsonls\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")
time([[Config for mason-lspconfig.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\15stopinsert\bcmd\bvim�\v\1\0\f\0M\1c6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\0005\6*\0005\a\6\0005\b\b\0005\t\a\0=\t\t\b5\t\n\0=\t\v\b=\b\f\a5\b\r\0=\b\14\a5\b#\0005\t\16\0009\n\15\1=\n\17\t9\n\18\1=\n\19\t9\n\20\1=\n\21\t9\n\22\1=\n\23\t9\n\24\2=\n\25\t9\n\26\0019\v\27\1 \n\v\n=\n\28\t3\n\29\0=\n\30\t9\n\31\1=\n \t9\n!\3=\n\"\t=\t$\b5\t%\0009\n!\3=\n\"\t=\t&\b=\b'\a5\b(\0=\b)\a=\a+\0065\a-\0005\b,\0=\b.\a5\b/\0=\b0\a5\b1\0005\t5\0005\n3\0009\v2\1=\v4\n=\n$\t=\t'\b=\b6\a5\b8\0005\t7\0=\t9\b=\b:\a5\b<\0005\t;\0=\t=\b=\b>\a5\b?\0=\b@\a5\bA\0=\bB\a=\aC\0065\aF\0004\b\3\0006\t\0\0'\vD\0B\t\2\0029\tE\t4\v\0\0B\t\2\0?\t\0\0=\bG\a5\bH\0=\bI\a4\b\0\0=\bJ\a4\b\0\0=\bK\a=\aL\6B\4\2\1K\0\1\0\15extensions\17file-browser\fproject\bfzf\1\0\2\nfuzzy\2\14case_mode\15smart_case\14ui-select\1\0\0\17get_dropdown\21telescope.themes\fpickers\30current_buffer_fuzzy_find\1\0\1\ntheme\rdropdown\21lsp_code_actions\1\0\1\ntheme\rdropdown\19lsp_references\17path_display\1\0\0\1\2\0\0\fshorten\14man_pages\rsections\1\0\0\1\3\0\0\0062\0063\fbuffers\1\0\0\n<c-d>\1\0\0\18delete_buffer\1\0\3\rsort_mru\2\ntheme\rdropdown\14previewer\1\14git_files\1\0\2\14previewer\1\ntheme\rdropdown\17file_browser\1\0\0\1\0\2\14previewer\1\ntheme\rdropdown\rdefaults\1\0\0\25file_ignore_patterns\1\2\0\0\17src/parser.c\rmappings\6n\1\0\0\6i\1\0\0\n<c-t>\22open_with_trouble\n<esc>\nclose\n<c-c>\0\n<C-q>\16open_qflist\25smart_send_to_qflist\n<C-h>\19toggle_preview\v<C-Up>\23cycle_history_prev\r<C-Down>\23cycle_history_next\n<C-a>\26cycle_previewers_prev\n<C-s>\1\0\1\n<a-q>\1\26cycle_previewers_next\fpreview\1\0\1\20msg_bg_fillchar\6 \18layout_config\vcenter\1\0\1\vmirror\2\rvertical\1\0\0\1\0\1\vmirror\2\1\0\b\23selection_strategy\nreset\26dynamic_preview_title\2\20scroll_strategy\ncycle\20layout_strategy\tflex\15multi_icon\5\ncache\1\18hl_result_eol\1\rwinblend\3\0\nsetup trouble.providers.telescope\29telescope.actions.layout\22telescope.actions\14telescope\frequire\3����\4\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd null-ls.nvim ]]

-- Config for: null-ls.nvim
try_loadstring("\27LJ\2\n�\3\0\0\r\0\23\0)6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1�K\0\1\0009\2\3\0019\2\4\0029\3\3\0019\3\5\0039\4\3\0019\4\6\0049\5\a\0015\a\b\0004\b\6\0009\t\t\0029\t\n\t5\v\f\0005\f\v\0=\f\r\v5\f\14\0=\f\15\vB\t\2\2>\t\1\b9\t\16\2>\t\2\b9\t\17\4>\t\3\b9\t\18\0029\t\n\t5\v\20\0005\f\19\0=\f\15\vB\t\2\2>\t\4\b9\t\21\3>\t\5\b=\b\22\aB\5\2\1K\0\1\0\fsources\18golangci_lint\1\0\0\1\2\0\0\19--edition=2021\frustfmt\fluasnip\vstylua\15extra_args\1\4\0\0\14--no-semi\19--single-quote\23--jsx-single-quote\20extra_filetypes\1\0\0\1\2\0\0\ttoml\twith\rprettier\1\0\1\ndebug\1\nsetup\15completion\16diagnostics\15formatting\rbuiltins\fnull-ls\frequire\npcall\0", "config", "null-ls.nvim")

time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
