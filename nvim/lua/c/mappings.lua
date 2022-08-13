--local nnoremap = require("c.keymap").nnoremap
--local inoremap = require("c.keymap").inoremap
--local vnoremap = require("c.keymap").vnoremap
--local xnoremap = require("c.keymap").xnoremap
--local nmap = require("c.keymap").nmap

local function bind(op, outer_opts)
    outer_opts = outer_opts or { noremap = true }
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

local opts = { noremap = true, silent = true }
local silent_ops = { silent = true }
local expr_ops = { expr = true }

local nmap = bind("n", { noremap = false })
local nnoremap = bind("n")
local inoremap = bind("i")
local vnoremap = bind("v")
local xnoremap = bind("x")

--- NORMAL MODE
nnoremap("<ESC>", "<cmd> noh <CR>")

--Telescope
-- Find files using Telescope command-line sugar.
nnoremap("<leader>ff", "<cmd>Telescope find_files<CR>")
-- Find in text
nnoremap("<leader>s", "<cmd>Telescope live_grep<CR>")
-- Find open buffers
nnoremap("<leader>fb", "<cmd>Telescope buffers<CR>")
-- Find mark
nnoremap("<leader>fm", "<cmd>Telescope marks<CR>")
-- Find in man pages
nnoremap("<leader>f0", "<cmd>Telescope man_pages<CR>")
-- Find and add items to quickfix list
nnoremap("<leader>fq", "<cmd>Telescope quickfix<CR>")
-- Find and enter git branches
nnoremap("<leader>fg", "<cmd>Telescope git_branches<CR>")
-- find apis that can be used
nnoremap("<leader>fh", "<cmd>Telescope help_tags<CR>")
-- find keymaps that can be used
nnoremap("<leader>fk", "<cmd>Telescope keymaps<CR>")
--file file_browser
-- nnoremap("<leader>fp", ":Telescope file_browser<CR>")
-- --Telescope project
nnoremap("<leader>fpr", ":lua require'telescope'.extensions.project.project{}<CR>")
-- quickfix
nnoremap("<leader>fql", "<cmd>Telescope quickfix<CR>")

---- Trouble
nnoremap("<leader>xx", "<cmd>Trouble<cr>",
    { silent = true, noremap = true }
)
nnoremap("<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
nnoremap("<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
    { silent = true, noremap = true }
)
nnoremap("<leader>xl", "<cmd>Trouble loclist<cr>",
    { silent = true, noremap = true }
)
nnoremap("<leader>xq", "<cmd>Trouble quickfix<cr>",
    { silent = true, noremap = true }
)
nnoremap("gR", "<cmd>Trouble lsp_references<cr>",
    { silent = true, noremap = true }
)


-- navigate within insert mode
inoremap("<C-h>", "<Left>")
inoremap("<C-l>", "<Right>")
inoremap("<C-j>", "<Down>")
inoremap("<C-k>", "<Up>")

nnoremap("s", ":HopWordCurrentLine<cr>", silent_ops)
nnoremap("S", ":HopChar1<cr>", silent_ops)
nnoremap("t", ":HopLine<cr>", silent_ops)
-- Insert a newline without entering in insert mode, vim
--nnoremap("OO", "O<Esc>j", {silent=true})
--
-- source init.vim
-- TODO turn this keymap into a plugin that loads 1 of 3 commands depending on the root type:
-- if package.json run npm install
-- if yarn.lock run npm install
-- if go.mod run go mod tidy
-- if Cargo.toml run cargo build
-- if init.vim run source init.vim
-- ADD: if the build or install fails set a global mark in it
nnoremap("<leader><CR>", ":so ~/.config/nvim/init.vim<CR>")

-- <leader><leader> toggles between buffers/ quick fileswitch
nnoremap("<leader><leader>", "<c-^>")

-- Copy to clipboard
vnoremap('<leader>y', '"+y')
nnoremap('<leader>Y', '"+yg_')
nnoremap('<leader>y', '"+y')

-- " Paste from clipboard
nnoremap('<leader>p', '"+p')
nnoremap('<leader>P', '"+P')
vnoremap('<leader>p', '"+p')
vnoremap('<leader>P', '"+P')

-- Navigation
-- Better window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Resize with arrows
nnoremap("<C-Up>", ":resize -2<CR>")
nnoremap("<C-Down>", ":resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize -2<CR>")
nnoremap("<C-Right>", ":vertical resize +2<CR>")
-- Navigate buffers
nnoremap("<S-l>", ":bnext<CR>")
nnoremap("<S-h>", ":bprevious<CR>")

-- NvimTree
nnoremap("<leader>e", ":NvimTreeToggle<CR>")

-- this is smart:
inoremap("<C-c>", "<ESC>")

-- nnoremap("<leader-X>", {
--     function()
--         require("c.utils").close_buffer()
--     end,
-- })

-- saving
-- nnoremap('<C-e>', ":Explore<CR>")
--
-- explorer
nnoremap('<C-s>', ':w<CR>', { silent = true })
nnoremap('<C-f>', ':lua vim.lsp.buf.formatting_sync(nil,1000)<CR>', { silent = true })
inoremap('<C-s>', '<Esc><C-s>a', { silent = true })

-- moving selected text up and down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
-- moving text to the left
--vnoremap("<Shift->>", ":m '<-2<CR>gv=gv")
--vnoremap("<Shift-<>", ":m '<-2<CR>gv=gv")

-- Visual --
-- Stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")
-- should be J, K respectively but whatefs
vnoremap("<C-k>", ":m '>+1<CR>gv=gv")
vnoremap("<C-j>", ":m '<-2<CR>gv=gv")

-- DAP
nnoremap("<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
nnoremap("<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
nnoremap("<leader>di", "<cmd>lua require'dap'.step_into()<cr>")
nnoremap("<leader>do", "<cmd>lua require'dap'.step_over()<cr>")
nnoremap("<leader>dO", "<cmd>lua require'dap'.step_out()<cr>")
nnoremap("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
nnoremap("<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
nnoremap("<leader>du", "<cmd>lua require'dapui'.toggle()<cr>")
nnoremap("<leader>dt", "<cmd>lua require'dap'.terminate()<cr>")

-- Zen-mode
nnoremap('<C-w>o', '<cmd>ZenMode<cr>', { silent = true })

-- LSP Saga
nnoremap('<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', silent_ops)
nnoremap('K', '<Cmd>Lspsaga hover_doc<CR>', silent_ops)
nnoremap('gd', '<Cmd>Lspsaga lsp_finder<CR>', silent_ops)
inoremap('<C-k>', '<Cmd>Lspsaga signature_help<CR>', silent_ops)
nnoremap('gp', '<Cmd>Lspsaga preview_definition<CR>', silent_ops)
nnoremap('gr', '<Cmd>Lspsaga rename<CR>', silent_ops)
nnoremap('<leader>ca', '<Cmd>Lspsaga code_action<CR>', silent_ops)
vnoremap("<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", silent_ops)


-- [[
--
--    n {
--     -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
--     -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
--     -- empty mode is same as using <cmd> :map
--     -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
--     ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
--     ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
--     ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
--     ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
--   },
--
--   t = {
--     ["<C-x>"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
--   },
--
--   v = {
--     ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
--     ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
--     ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
--     ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
--     -- Don't copy the replaced text after pasting in visual mode
--     -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
--     ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', opts = { silent = true } },
--   },
-- ]]
