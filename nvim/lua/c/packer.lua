-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Core stuff
    use("nvim-lua/plenary.nvim")

    -- Terminal
    -- https://github.com/akinsho/toggleterm.nvim
    use({
        "akinsho/toggleterm.nvim",
        tag = "v2.*",
        config = function()
            local status_ok, toggleterm = pcall(require, "toggleterm")
            if not status_ok then
                return
            end

            toggleterm.setup({
                size = 20,
                open_mapping = [[<c-\>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "float",
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved",
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
            })

            function _G.set_terminal_keymaps()
                local opts = { noremap = true }
                vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
                vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
                vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
                vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
                vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
                vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
            end

            vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
        end,
    })

    -- Colorschemes
    use({ "marko-cerovac/material.nvim" })
    use({ "rebelot/kanagawa.nvim" })
    use({ "Everblush/everblush.nvim", as = "everblush" })
    use({
        "folke/lsp-colors.nvim",
        config = function()
            local status, colors = pcall(require, "lsp-colors")
            if not status then
                return
            end

            colors.setup({
                Error = "#db4b4b",
                Warning = "#e0af68",
                Information = "#0db9d7",
                Hint = "#10B981",
            })
        end,
    })

    -- Custom LSP Setup
    -- specialized lsp configs for go and rust
    use({ "simrat39/rust-tools.nvim" })
    use({ "ray-x/go.nvim" })
    -- Craftzdog
    use({
        "onsails/lspkind-nvim",
        config = function()
            local status, lspkind = pcall(require, "lspkind")
            if not status then
                return
            end

            lspkind.init({
                -- enables text annotations
                --
                -- default: true
                mode = "symbol",

                -- default symbol map
                -- can be either 'default' (requires nerd-fonts font) or
                -- 'codicons' for codicon preset (requires vscode-codicons font)
                --
                -- default: 'default'
                preset = "codicons",

                -- override preset symbols
                --
                -- default: {}
                symbol_map = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "ﰠ",
                    Variable = "",
                    Class = "ﴯ",
                    Interface = "",
                    Module = "",
                    Property = "ﰠ",
                    Unit = "塞",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "פּ",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                },
            })
        end,
    }) -- vscode-like pictograms
    use({ "hrsh7th/cmp-buffer" })
    use({
        "hrsh7th/cmp-nvim-lsp",
        config = function()
            require("cmp").setup({
                sources = {
                    { name = "nvim_lsp" },
                },
            })
        end,
    }) -- nvim-cmp source for neovim's built-in LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            --vim.lsp.set_log_level("debug")

            local status, nvim_lsp = pcall(require, "lspconfig")
            if not status then
                return
            end

            local protocol = require("vim.lsp.protocol")

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end

                local function buf_set_option(...)
                    vim.api.nvim_buf_set_option(bufnr, ...)
                end

                --Enable completion triggered by <c-x><c-o>
                buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

                -- Mappings.
                local opts = { noremap = true, silent = true }

                -- See `:help vim.lsp.*` for documentation on any of the below functions
                buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

                -- formatting
                if client.server_capabilities.documentFormattingProvider then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("Format", { clear = true }),
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.formatting_seq_sync()
                        end,
                    })
                end
            end

            protocol.CompletionItemKind = {
                " Text", -- Text
                " Method", -- Method
                " Function", -- Function
                "", -- Constructor
                "", -- Field
                "", -- Variable
                "", -- Class
                "ﰮ", -- Interface
                "", -- Module
                "", -- Property
                "", -- Unit
                "", -- Value
                "", -- Enum
                "", -- Keyword
                "﬌", -- Snippet
                "", -- Color
                "", -- File
                "", -- Reference
                "", -- Folder
                "", -- EnumMember
                "", -- Constant
                "", -- Struct
                "", -- Event
                "ﬦ", -- Operator
                "", -- TypeParameter
            }

            -- Set up completion using nvim_cmp with LSP source
            local capabilities =
            require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

            nvim_lsp.flow.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            nvim_lsp.tsserver.setup({
                on_attach = on_attach,
                filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
                cmd = { "typescript-language-server", "--stdio" },
                capabilities = capabilities,
            })

            nvim_lsp.sourcekit.setup({
                on_attach = on_attach,
            })

            nvim_lsp.sumneko_lua.setup({
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { "vim" },
                        },

                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                    },
                },
            })

            nvim_lsp.gopls.setup({
                cmd = { "gopls" },
                settings = {
                    gopls = {
                        analyses = {
                            nilness = true,
                            unusedparams = true,
                            unusedwrite = true,
                            useany = true,
                        },
                        experimentalPostfixCompletions = true,
                        gofumpt = true,
                        staticcheck = true,
                        usePlaceholders = true,
                    },
                },
                on_attach = on_attach,
                capabilities = capabilities,
            })

            require("go").setup()
            --require("go.format").gofmt()  -- gofmt only
            --require("go.format").goimport()  -- goimport + gofmt
            ---- Run gofmt on save
            vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)
            ---- Run gofmt + goimport on save
            vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

            nvim_lsp.tsserver.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            nvim_lsp.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            local rs_opts = {
                -- rust-tools options
                tools = {
                    autoSetHints = true,
                    -- hover_with_actions = true, -- is deprecated and needs to be replaced with :RustHoverAction
                    inlay_hints = {
                        show_parameter_hints = true,
                        parameter_hints_prefix = "",
                        other_hints_prefix = "",
                    },
                },
                -- all the opts to send to nvim-lspconfig
                -- these override the defaults set by rust-tools.nvim
                -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
                -- https://rust-analyzer.github.io/manual.html#features
                server = {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    settings = {
                        ["rust-analyzer"] = {
                            assist = {
                                importEnforceGranularity = true,
                                importPrefix = "crate",
                            },
                            cargo = {
                                allFeatures = true,
                            },
                            checkOnSave = {
                                -- default: `cargo check`
                                command = "clippy",
                            },
                        },
                        inlayHints = {
                            lifetimeElisionHints = {
                                enable = true,
                                useParameterNames = true,
                            },
                        },
                    },
                },
            }
            require("rust-tools").setup(rs_opts)

            nvim_lsp.yamlls.setup({
                -- other configuration for setup {}
                capabilities = capabilities,
                settings = {
                    yaml = {
                        -- other settings. note this overrides the lspconfig defaults.
                        schemas = {
                            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                            ["https://json.schemastore.org/kustomization.json"] = "kustomize.yaml",
                            ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
                            ["https://raw.githubusercontent.com/istio/api/master/kubernetes/customresourcedefinitions.gen.yaml"] = "gateway.yaml",
                            "virtualservice.yaml",
                            "vscv.yaml",
                            "gw.yaml",
                        },
                    },
                },
            })

            nvim_lsp.vimls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            nvim_lsp.jsonls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            nvim_lsp.dockerls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            nvim_lsp.sqlls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            nvim_lsp.bashls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            vim.lsp.handlers["textDocument/publishDiagnostics"] =
            vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                underline = true,
                update_in_insert = false,
                virtual_text = { spacing = 4, prefix = "●" },
                severity_sort = true,
            })

            -- Diagnostic symbols in the sign column (gutter)
            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            vim.diagnostic.config({
                virtual_text = {
                    prefix = "●",
                },
                update_in_insert = true,
                float = {
                    source = "always", -- Or "if_many"
                },
            })
        end,
    }) -- LSP

    -- use { 'MunifTanjim/prettier.nvim' } -- Prettier plugin for Neovim's built-in LSP client
    use({
        "williamboman/mason.nvim",
        config = function()
            local status, mason = pcall(require, "mason")
            if not status then
                return
            end
            mason.setup({})
        end,
    })

    use({
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local mason_lsp = require("mason-lspconfig")
            mason_lsp.setup({
                ensure_installed = {
                    "gopls",
                    "golangci_lint",
                    "tsserver",
                    "rust_analyzer",
                    "yamlls",
                    "dockerls",
                    "sumneko_lua",
                    "bashls",
                    "jsonls",
                },
            })
        end,
    })

    -- Completion
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            -- local has_words_before = function()
            --     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            --     return col ~= 0
            --         and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            -- end
            -- local status, cmp = pcall(require, "cmp")
            -- if not status then
            --     return
            -- end
            --
            -- local status, luasnip = pcall(require, "luasnip")
            -- if not status then
            --     return
            -- end
            -- local lspkind = require("lspkind")
            -- cmp.setup({
            --     snippet = {
            --         expand = function(args)
            --             require("luasnip").lsp_expand(args.body)
            --         end,
            --     },
            --     mapping = cmp.mapping.preset.insert({
            --         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
            --         ["<C-Space>"] = cmp.mapping.complete(),
            --         ["<C-e>"] = cmp.mapping.close(),
            --         ["<CR>"] = cmp.mapping.confirm({
            --             behavior = cmp.ConfirmBehavior.Replace,
            --             select = true,
            --         }),
            --     }),
            --     sources = cmp.config.sources({
            --         { name = "nvim_lsp" },
            --         { name = "buffer" },
            --         { name = "luasnip" },
            --     }),
            --     formatting = {
            --         format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
            --     },
            -- })
            --
            -- vim.cmd([[
            --   set completeopt=menuone,noinsert,noselect
            --   highlight! default link CmpItemKind CmpItemMenuDefault
            -- ]])
            local cmp_status_ok, cmp = pcall(require, "cmp")
            if not cmp_status_ok then
                return
            end

            local snip_status_ok, luasnip = pcall(require, "luasnip")
            if not snip_status_ok then
                return
            end

            require("luasnip/loaders/from_vscode").lazy_load()

            local check_backspace = function()
                local col = vim.fn.col(".") - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
            end

            local kind_icons = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "",
                Variable = "",
                Class = "",
                Interface = "",
                Module = "",
                Property = "",
                Unit = "",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "",
                Event = "",
                Operator = "",
                TypeParameter = "",
            }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    ["<C-e>"] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    -- Accept currently selected item. If none selected, `select` first item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif check_backspace() then
                            fallback()
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        vim_item.kind = kind_icons[vim_item.kind]
                        vim_item.menu = ({
                            nvim_lsp = "",
                            nvim_lua = "",
                            luasnip = "",
                            buffer = "",
                            path = "",
                            emoji = "",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                },
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                experimental = {
                    ghost_text = true,
                },
            })
        end,
    }) -- Completion

    -- Path completion
    -- https://github.com/hrsh7th/cmp-path
    use({
        "hrsh7th/cmp-path",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = {
                    { name = "path" },
                },
            })
        end,
    })

    --
    -- LSP UI
    use({
        "glepnir/lspsaga.nvim",
        config = function()
            local saga = require("lspsaga")
            saga.init_lsp_saga({
                server_filetype_map = {
                    typescript = "typescript",
                },
            })
        end,
    })

    -- Snippets
    use({ "L3MON4D3/LuaSnip" })
    use({ "rafamadriz/friendly-snippets" })
    -- LSP Setup
    -- from lsp-zero which does some default config. Not all perfect but a good start for the new lua setup.
    -- https://github.com/VonHeikemen/lsp-zero.nvim
    -- use {
    --     'VonHeikemen/lsp-zero.nvim',
    --     requires = {
    --         -- LSP Support
    --         { 'neovim/nvim-lspconfig' },
    --         { 'williamboman/nvim-lsp-installer' },
    --
    --         -- Autocompletion
    --         { 'hrsh7th/nvim-cmp' },
    --         { 'hrsh7th/cmp-buffer' },
    --         { 'hrsh7th/cmp-path' },
    --         { 'saadparwaiz1/cmp_luasnip' },
    --         { 'hrsh7th/cmp-nvim-lsp' },
    --         { 'hrsh7th/cmp-nvim-lua' },
    --
    --         -- Snippets
    --         { 'L3MON4D3/LuaSnip' },
    --         { 'rafamadriz/friendly-snippets' },
    --     },
    --     config = function()
    --         local lsp = require('lsp-zero')
    --         lsp.preset('recommended')
    --         lsp.setup()
    --
    --     end
    -- }

    -- Null LS is a linting service with some other features. It's a big one
    --https://github.com/jose-elias-alvarez/null-ls.nvim
    -- http://neovimcraft.com/plugin/hrsh7th/nvim-cmp/index.html -> as a reference for setting up completion like Luasnip inside null-ls
    use({
        "jose-elias-alvarez/null-ls.nvim",
        after = "nvim-lspconfig",
        config = function()
            local null_ls_status_ok, null_ls = pcall(require, "null-ls")
            if not null_ls_status_ok then
                return
            end

            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
            local formatting = null_ls.builtins.formatting
            -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
            local diagnostics = null_ls.builtins.diagnostics
            local completion = null_ls.builtins.completion
            -- local actions = null_ls.builtins.code_actions
            --
            -- https://github.com/prettier-solidity/prettier-plugin-solidity
            -- npm install --save-dev prettier prettier-plugin-solidity
            null_ls.setup({
                debug = false,
                sources = {
                    formatting.prettier.with({
                        extra_filetypes = { "toml" },
                        extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
                    }),
                    -- formatting.black.with({ extra_args = { "--fast" } }),
                    -- diagnostics.flake8,
                    formatting.stylua,
                    completion.luasnip,
                    formatting.rustfmt.with({ extra_args = { "--edition=2021" } }),
                    diagnostics.golangci_lint,
                },
            })
        end,
    })

    -- Trouble
    -- https://github.com/folke/trouble.nvim
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    -- Telescope
    use({ "nvim-lua/popup.nvim" })
    use({ "nvim-telescope/telescope-project.nvim" })
    use({ "nvim-telescope/telescope-ui-select.nvim" })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope-file-browser.nvim" })
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.x",
        wants = {
            module = "telescope",
            "plenary.nvim",
            "popup.nvim",
            "telescope-fzf-native.nvim",
            "telescope-project.nvim",
            "telescope-file-browser.nvim",
            "telescope-ui-select.nvim",
        },
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-project.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            { "nvim-telescope/telescope-file-browser.nvim" },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local actions_layout = require("telescope.actions.layout")
            local trouble = require("trouble.providers.telescope")

            telescope.setup({
                defaults = {
                    multi_icon = "",
                    layout_strategy = "flex",
                    scroll_strategy = "cycle",
                    selection_strategy = "reset",
                    winblend = 0,
                    layout_config = {
                        vertical = {
                            mirror = true,
                        },
                        center = {
                            mirror = true,
                        },
                    },
                    hl_result_eol = false,
                    preview = {
                        msg_bg_fillchar = " ",
                    },
                    cache = false,
                    mappings = {
                        i = {
                            ["<C-s>"] = actions.cycle_previewers_next,
                            ["<C-a>"] = actions.cycle_previewers_prev,
                            ["<C-Down>"] = actions.cycle_history_next,
                            ["<C-Up>"] = actions.cycle_history_prev,
                            ["<C-h>"] = actions_layout.toggle_preview,

                            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                            ["<a-q>"] = false,
                            ["<c-c>"] = function()
                                vim.cmd([[stopinsert]])
                            end,
                            ["<esc>"] = actions.close,
                            ["<c-t>"] = trouble.open_with_trouble,
                        },
                        n = { ["<c-t>"] = trouble.open_with_trouble },
                    },
                    file_ignore_patterns = { "src/parser.c" },
                    dynamic_preview_title = true,
                },
                pickers = {
                    -- find_files = {
                    --     theme = "dropdown",
                    --     previewer = true,
                    -- },
                    file_browser = {
                        theme = "dropdown",
                        previewer = false,
                    },
                    git_files = {
                        theme = "dropdown",
                        previewer = false,
                    },
                    buffers = {
                        sort_mru = true,
                        theme = "dropdown",
                        previewer = false,
                        mappings = {
                            i = { ["<c-d>"] = actions.delete_buffer },
                        },
                    },
                    man_pages = { sections = { "2", "3" } },
                    lsp_references = { path_display = { "shorten" } },
                    lsp_code_actions = { theme = "dropdown" },
                    current_buffer_fuzzy_find = { theme = "dropdown" },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    ["fzf"] = {
                        fuzzy = true,
                        case_mode = "smart_case",
                    },
                    ["project"] = {},
                    ["file-browser"] = {},
                },
            })

            -- local status_ok, telescope = pcall(require, "telescope")
            -- if not status_ok then
            --     return
            -- end
            -- local actions = require "telescope.actions"
            -- telescope.setup {
            --     defaults = {
            --         mappings = {
            --             i = {
            --                 ["<C-j>"] = actions.move_selection_next,
            --                 ["<C-k>"] = actions.move_selection_previous,
            --                 ["<C-n>"] = actions.cycle_history_next,
            --                 ["<C-p>"] = actions.cycle_history_prev,
            --                 ["<C-h>"] = "which_key"
            --             },
            --         },
            --     },
            --     extensions = {
            --         ['fzf'] = {
            --             fuzzy = true,
            --             case_mode = "smart_case",
            --         }
            --     },
            --     ['ui-select'] = {
            --
            --     },
            --     ['project'] = {
            --
            --     },
            --     ['file-browser'] = {
            --
            --     },
            --
            -- }
            -- telescope.load_extension("fzf")
            -- telescope.load_extension("project")
            -- --telescope.load_extension("file-browser")
            -- telescope.load_extension("ui-select")
            --            telescope.setup {
            --              extensions = {
            --                ["project"] = {},
            --                ["ui-select"] = {
            --                  require("telescope.themes").get_dropdown {
            --                    -- even more opts
            --                  }
            --                }
            --              }
            --            }
            --            -- To get ui-select loaded and working with telescope, you need to call
            --            -- load_extension, somewhere after setup function:
            --            require("telescope").load_extension("ui-select")
            --            require("telescope").load_extension("file_browser")
        end,
    })

    -- Utilities
    --
    -- hop is amazing
    -- https://github.com/phaazon/hop.nvim/wiki/Commands
    use({
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            local status_ok, hop = pcall(require, "hop")
            if not status_ok then
                return
            end
            hop.setup()
        end,
    })

    -- true-zen lets me focus on specific code bits
    -- https://github.com/Pocco81/true-zen.nvim
    ---    use({
    ---        "Pocco81/true-zen.nvim",
    --        config = function()
    --           local api = vim.api
    --            api.nvim_set_keymap("n", "<leader>n", ":TZNarrow<CR>", {})
    --            api.nvim_set_keymap("v", "<leader>n", ":'<,'>TZNarrow<CR>", {})
    --             require("true-zen").setup {
    --                -- your config goes here
    --                -- or just leave it empty :)
    --                 }
    --            end,
    --    })

    -- zen-mode by folke is older but appears to work better still than true-zen
    -- https://github.com/folke/zen-mode.nvim
    -- Lua
    use({
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup({})
        end,
    })
    use({
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup({})
        end,
    })
    -- Comment adds a extremely lightweight commenting options
    -- https://github.com/numToStr/Comment.nvim
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    -- Whichkey pops open the selection screen for keys; as a reminder usually
    -- https://github.com/folke/which-key.nvim
    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    -- Autopairs does auto-pairing
    -- https://github.com/windwp/nvim-autopairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt", "vim" },
            })
        end,
    })

    -- Gitsigns shows some git information an other highlights
    -- https://github.com/lewis6991/gitsigns.nvim
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("gitsigns").setup()
        end,
    })

    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end,
    })

    -- UI
    --
    --
    -- Treesitter does syntax highlighting and more. It's a big one
    -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all"
                ensure_installed = {
                    "go",
                    "json",
                    "yaml",
                    "lua",
                    "rust",
                    "dockerfile",
                    "regex",
                    "tsx",
                    "toml",
                    "css",
                    "javascript",
                    "html",
                    "python",
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- List of parsers to ignore installing (for "all")
                -- ignore_install = { "haskell" },

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                    -- the name of the parser)
                    -- list of language that will be disabled
                    disable = { "c" },

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    })

    -- Lualine is the bar at the bottom it currently has bubble mode but others can be configured
    -- https://github.com/nvim-lualine/lualine.nvim
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                },
            })
        end,
    })

    -- Nvim Tree is the file explorer
    -- https://github.com/kyazdani42/nvim-tree.lua
    use({
        "kyazdani42/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icons
        },
        config = function()
            local status_ok, nvim_tree = pcall(require, "nvim-tree")
            if not status_ok then
                return
            end

            local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
            if not config_status_ok then
                return
            end

            local tree_cb = nvim_tree_config.nvim_tree_callback

            nvim_tree.setup({

                update_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                },
                renderer = {
                    root_folder_modifier = ":t",
                    icons = {
                        glyphs = {
                            default = "",
                            symlink = "",
                            folder = {
                                arrow_open = "",
                                arrow_closed = "",
                                default = "",
                                open = "",
                                empty = "",
                                empty_open = "",
                                symlink = "",
                                symlink_open = "",
                            },
                            git = {
                                unstaged = "",
                                staged = "S",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "U",
                                deleted = "",
                                ignored = "◌",
                            },
                        },
                    },
                },
                filters = {
                    custom = { ".git" },
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                view = {
                    width = 30,
                    height = 30,
                    side = "left",
                    mappings = {
                        list = {
                            { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
                            { key = "h", cb = tree_cb("close_node") },
                            { key = "v", cb = tree_cb("vsplit") },
                        },
                    },
                },
                respect_buf_cwd = true,
            })
        end,
    })

    -- Fidget does the loading display for null-ls and the LSP
    -- https://github.com/j-hui/fidget.nvim
    use({
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({})
        end,
    })

    use({
        "xiyaowong/nvim-transparent",
        config = function()
            require("transparent").setup({
                enable = true,
            })
        end,
    })
    -- Notify shows the popups
    -- https://github.com/rcarriga/nvim-notify
    use({
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({})
        end,
    })

    -- Blankline handles the indentation appearance and highlighting
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    -- use {
    --     'lukas-reineke/indent-blankline.nvim',
    --     config = function()
    --         vim.opt.termguicolors = true
    --         vim.cmd [[highlight IndentBlanklineIndent1 guibg=#16161D gui=nocombine]]
    --         vim.cmd [[highlight IndentBlanklineIndent2 guibg=#2A2A37 gui=nocombine]]
    --
    --         require("indent_blankline").setup {
    --             char = "",
    --             char_highlight_list = {
    --                 "IndentBlanklineIndent1",
    --                 "IndentBlanklineIndent2",
    --             },
    --             space_char_highlight_list = {
    --                 "IndentBlanklineIndent1",
    --                 "IndentBlanklineIndent2",
    --             },
    --             show_trailing_blankline_indent = false,
    --             show_current_context = true,
    --             show_current_context_start = true,
    --         }
    --     end,
    -- }
    -- this end closes Packer.
end)
