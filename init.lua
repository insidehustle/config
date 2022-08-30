--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "catppuccin",

  -- Override highlight groups in any theme
  highlights = {
    -- duskfox = { -- a table of overrides/changes to the default
    --   Normal = { bg = "#000000" },
    -- },
    default_theme = function(highlights) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = true, -- sets vim.opt.relativenumber
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " █████  ███████ ████████ ██████   ██████",
    "██   ██ ██         ██    ██   ██ ██    ██",
    "███████ ███████    ██    ██████  ██    ██",
    "██   ██      ██    ██    ██   ██ ██    ██",
    "██   ██ ███████    ██    ██   ██  ██████",
    " ",
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██",
  },

  -- Default theme configuration
  default_theme = {
    -- set the highlight style for diagnostic messages
    diagnostics_style = { italic = true },
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = true,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- will be set up by rust-tools & the typescript plugin
    skip_setup = { "rust_analyzer", "tsserver" },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/cloudbuild.json"] = "cloudbuild.{yml,yaml}",
              ["https://github.com/SchemaStore/schemastore/blob/master/src/schemas/json/cargo.json"] = "cargo.toml",
              ["https://raw.githubusercontent.com/GoogleContainerTools/skaffold/master/docs/content/en/schemas/v2beta28.json"] = "skaffold.yaml",
              ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
              ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
              ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
              ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
              ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "k8s-manifests/*.{yml,yaml}",
              ["https://raw.githubusercontent.com/istio/api/master/kubernetes/customresourcedefinitions.gen.yaml"] = "gateway.yaml",
              "virtualservice.yaml",
              "vscv.yaml",
              "gw.yaml",
            },
          },
        },
      },
      -- Example disabling formatting for a specific language server
      -- gopls = { -- override table for require("lspconfig").gopls.setup({...})
      --   on_attach = function(client, bufnr)
      --     client.resolved_capabilities.document_formatting = false
      --   end
      -- }
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- -- <leader><leader> toggles between buffers/ quick fileswitch
      ["<leader><leader>"] = { "<c-^>" },

      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      -- quick save
      ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
      -- ZenMode
      ["<C-w>o"] = { "<cmd>ZenMode<cr>", desc = "Zen" },
      -- Hop
      ["s"] = { ":HopWordCurrentLine<cr>", desc = "Hop in Line" },
      ["S"] = { ":HopChar1<cr>", desc = "Hop 1 Char" },
      ["t"] = { ":HopLine<cr>", desc = "Hop Line" },
      -- TransparentToggle
      ["<leader>T"] = { "<Cmd>TransparentToggle<CR>", desc = "TransparentToggle" },

      -- Go
      ["<leader>Ge"] = { "<cmd>GoIfErr<cr>", desc = "If Err" },
      ["<leader>Gf"] = { "<cmd>GoFillStruct<cr>", desc = "Fill Struct" },
      ["<leader>Gr"] = { "<cmd>GoRun<cr>", desc = "Run" },
      ["<leader>Gb"] = { "<cmd>GoBuild<cr>", desc = "Build" },
      ["<leader>Gg"] = { "<cmd>GoImport<cr>", desc = "Import" },
      ["<leader>Gfmt"] = { "<cmd>GoFmt<cr>", desc = "gofumpt" },
      ["<leader>Gi"] = { "<cmd>GoImpl<cr>", desc = "implement interface" },
      ["<leader>Gat"] = { "<cmd>GoAddAllTest<cr>", desc = "Add All Unit Tests" },
      ["<leader>Gaf"] = { "<cmd>GoAddTest<cr>", desc = "Add Test Current Function" },
      ["<leader>Gtt"] = { "<cmd>GoTest<cr>", desc = "Test All" },
      ["<leader>Gtf"] = { "<cmd>GoTest -f<cr>", desc = "Test File" },
      ["<leader>Gtfn"] = { "<cmd>GoTestFunc<cr>", desc = "Test Function" },
      ["<leader>Gm"] = { "<cmd>GoModTidy<cr>", desc = "GoModTidy" },
      -- ["<leader>G"] = { "<cmd>Go<cr>", desc = "" },
      -- ["<leader>G"] = { "<cmd>Go<cr>", desc = "" },
      ---- Trouble
      ["<leader>xx"] = { "<cmd>Trouble<cr>", desc = "Trouble" },
      ["<leader>xw"] = { "<cmd>Trouble workspace_diagnostics<cr>", desc = "Trouble Workspace" },
      ["<leader>xd"] = { "<cmd>Trouble document_diagnostics<cr>", desc = "Trouble Document Diagnostics" },
      ["<leader>xl"] = { "<cmd>Trouble loclist<cr>", desc = "Trouble LocationList" },
      ["<leader>xq"] = { "<cmd>Trouble quickfix<cr>", desc = "Trouble Quickfix" },
      -- DAP
      ["<leader>yb"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>" },
      ["<leader>yc"] = { "<cmd>lua require'dap'.continue()<cr>" },
      ["<leader>yi"] = { "<cmd>lua require'dap'.step_into()<cr>" },
      ["<leader>yo"] = { "<cmd>lua require'dap'.step_over()<cr>" },
      ["<leader>yO"] = { "<cmd>lua require'dap'.step_out()<cr>" },
      ["<leader>yr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>" },
      ["<leader>yl"] = { "<cmd>lua require'dap'.run_last()<cr>" },
      ["<leader>yu"] = { "<cmd>lua require'dapui'.toggle()<cr>" },
      ["<leader>yt"] = { "<cmd>lua require'dap'.terminate()<cr>" },
      ["<ESC>"] = { "<cmd> noh <CR>" },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
    i = {
      -- navigate within insert mode
      ["<C-h>"] = { "<Left>" },
      ["<C-l>"] = { "<Right>" },
      ["<C-j>"] = { "<Down>" },
      ["<C-k>"] = { "<Up>" },
      ["<C-s>"] = { "<Esc><C-s>a" },
    },
    v = {
      -- moving selected text up and down
      ["J"] = { ":m '>+1<CR>gv=gv" },
      ["K"] = { ":m '<-2<CR>gv=gv" },
      -- moving text to the left
      --["<Shift->>"] = {":m '<-2<CR>gv=gv")
      --["<Shift-<>"] = {":m '<-2<CR>gv=gv")

      -- Visual --
      -- Stay in indent mode
      ["<"] = { "<gv" },
      [">"] = { ">gv" },
      -- should be J, K respectively but whatefs
      ["<C-k>"] = { ":m '>+1<CR>gv=gv" },
      ["<C-j>"] = { ":m '<-2<CR>gv=gv" },
    },
  },

  -- Configure plugins
  plugins = {
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- Add plugins, the packer syntax without the "use"
      -- Colorschemes
      { "marko-cerovac/material.nvim" },
      { "rebelot/kanagawa.nvim" },
      { "Everblush/everblush.nvim", as = "everblush" },
      {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function() require("catppuccin").setup {} end,
      },
      -- DAP:
      { "mfussenegger/nvim-dap" },
      {
        "rcarriga/nvim-dap-ui",
        requires = { "nvim-dap", "rust-tools.nvim" },
        config = function()
          local dapui = require "dapui"
          dapui.setup {}

          local dap = require "dap"
          dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
          dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
          dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

          -- DAP mappings:
          -- local map = vim.api.nvim_set_keymap
          -- map("n", "<F5>", ":lua require('dap').continue()<cr>", { desc = "Continue" })
          -- map("n", "<F10>", ":lua require('dap').step_over()<cr>", { desc = "Step over" })
          -- map("n", "<F11>", ":lua require('dap').step_into()<cr>", { desc = "Step into" })
          -- map("n", "<F12>", ":lua require('dap').step_out()<cr>", { desc = "Step out" })
          -- map("n", "<leader>bp", ":lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle breakpoint" })
          -- map(
          --   "n",
          --   "<leader>Bp",
          --   ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
          --   { desc = "Set conditional breakpoint" }
          -- )
          -- map(
          --   "n",
          --   "<leader>lp",
          --   ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Logpoint message: '))<cr>",
          --   { desc = "Set logpoint" }
          -- )
          -- map("n", "<leader>rp", ":lua require('dap').repl.open()<cr>", { desc = "Open REPL" })
          -- map("n", "<leader>RR", ":lua require('dap').run_last()<cr>", { desc = "Run last debugged program" })
          -- map("n", "<leader>XX", ":lua require('dap').terminate()<cr>", { desc = "Terminate program being debugged" })
          -- map("n", "<leader>du", ":lua require('dap').up()<cr>", { desc = "Up one frame" })
          -- map("n", "<leader>dd", ":lua require('dap').down()<cr>", { desc = "Down one frame" })
        end,
      },
      { "theHamsta/nvim-dap-virtual-text" },
      {
        "ray-x/go.nvim",
        -- after = { "mason-lspconfig.nvim" },
        config = function() require("go").setup {} end,
      },
      { "ray-x/guihua.lua" },
      {
        "mfussenegger/nvim-dap-python",
      },
      -- Rust support
      {
        "simrat39/rust-tools.nvim",
        after = { "mason-lspconfig.nvim" },
        -- Is configured via the server_registration_override installed below!
        config = function()
          require("rust-tools").setup {
            server = astronvim.lsp.server_settings "rust_analyzer",
            tools = {
              inlay_hints = {
                parameter_hints_prefix = "  ",
                other_hints_prefix = "  ",
              },
            },
          }
        end,
      },
      {
        "Saecki/crates.nvim",
        after = "nvim-cmp",
        config = function()
          require("crates").setup()

          local cmp = require "cmp"
          local config = cmp.get_config()
          table.insert(config.sources, { name = "crates", priority = 1100 })
          cmp.setup(config)

          -- Crates mappings:
          local map = vim.api.nvim_set_keymap
          map("n", "<leader>Ct", ":lua require('crates').toggle()<cr>", { desc = "Toggle extra crates.io information" })
          map("n", "<leader>Cr", ":lua require('crates').reload()<cr>", { desc = "Reload information from crates.io" })
          map("n", "<leader>CU", ":lua require('crates').upgrade_crate()<cr>", { desc = "Upgrade a crate" })
          map("v", "<leader>CU", ":lua require('crates').upgrade_crates()<cr>", { desc = "Upgrade selected crates" })
          map("n", "<leader>CA", ":lua require('crates').upgrade_all_crates()<cr>", { desc = "Upgrade all crates" })
        end,
      },

      -- typescript:
      {
        "jose-elias-alvarez/typescript.nvim",
        after = "mason-lspconfig.nvim",
        config = function() require("typescript").setup { server = astronvim.lsp.server_settings "tsserver" } end,
      },
      {
        "xiyaowong/nvim-transparent",
        config = function()
          require("transparent").setup {
            enable = true,
          }
        end,
      },
      {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end,
      },
      {
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        config = function() require("hop").setup {} end,
      },
      {
        "folke/twilight.nvim",
        config = function() require("twilight").setup {} end,
      },
      {
        "folke/zen-mode.nvim",
        config = function() require("zen-mode").setup {} end,
      },
      {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require("lsp_signature").setup() end,
      },

      -- We also support a key value style plugin definition similar to NvChad:
      -- ["ray-x/lsp_signature.nvim"] = {
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup functino call
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
      }
      -- set up null-ls's on_attach function
      -- NOTE: You can remove this on attach function to disable format on save
      config.on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = vim.lsp.buf.formatting_sync,
          })
        end
      end
      return config -- return final config table to use in require("null-ls").setup(config)
    end,
    treesitter = { -- overrides `require("treesitter").setup(...)`
      ensure_installed = { "lua" },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      ensure_installed = { "sumneko_lua" },
    },
    -- use mason-tool-installer to configure DAP/Formatters/Linter installation
    ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
      ensure_installed = { "prettier", "stylua" },
    },
    packer = { -- overrides `require("packer").setup(...)`
      compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
          ["G"] = { name = "Go" },
          ["x"] = { name = "Trouble" },
          ["y"] = { name = "Debugger" },
          ["C"] = { name = "Crates" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set key binding
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
