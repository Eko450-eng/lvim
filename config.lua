--  ╭──────────────────────────────────────────────────────────╮
--  │ General                                                  │
--  ╰──────────────────────────────────────────────────────────╯

lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "nord"
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.background = "dark"
vim.opt.belloff = "esc"
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1


lvim.use_icons = true
lvim.transparent_window = true

vim.g.godot_executable = "/usr/bin/godot"

--  ╭──────────────────────────────────────────────────────────╮
--  │ keymappings [view all the defaults by pressing <leader>Lk]│
--  ╰──────────────────────────────────────────────────────────╯
lvim.leader = "space"

lvim.builtin.which_key.mappings.f = nil
lvim.builtin.which_key.mappings["/"] = nil
lvim.keys.normal_mode["<leader>w"] = nil
lvim.keys.normal_mode["<leader>fs"] = ":w<cr>"
lvim.keys.normal_mode["<M-l>"] = "<cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<M-h>"] = "<cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader>bd"] = "<cmd>BufferKill<CR>"
lvim.keys.normal_mode["<leader>wd"] = ":q<cr>"
lvim.keys.normal_mode["<leader>gc"] = "<Plug>(comment_toggle_linewise_current)"
lvim.keys.normal_mode["<leader>bc"] = ":CBlbox<cr>"
lvim.keys.normal_mode["<leader>E"] = ":Telescope find_files <CR>"
lvim.keys.normal_mode["<leader>B"] = ":Telescope live_grep <CR>"

lvim.keys.normal_mode["|"] = ":vsplit<cr>"
lvim.keys.normal_mode["-"] = ":hsplit<cr>"

--  ╭──────────────────────────────────────────────────────────╮
--  │ unmap a default keymapping                               │
--  ╰──────────────────────────────────────────────────────────╯
-- vim.keymap.del("n", "<C-Up>")

--  ╭──────────────────────────────────────────────────────────╮
--  │ override a default keymapping                            │
--  ╰──────────────────────────────────────────────────────────╯
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
-- lvim.keys.normal_mode["<leader>f"] = nil -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

--  ╭──────────────────────────────────────────────────────────╮
--  │ Change Telescope navigation to use j and k for           │
--  │  navigation and n and p for history in both input        │
--  │  and normal mode. we use protected-mode (pcall)          │
--  │  just in case the plugin wasn't loaded yet.              │
--  ╰──────────────────────────────────────────────────────────╯
local _, actions = pcall(require, "telescope.actions")

require("telescope").load_extension "file_browser"
require("telescope").load_extension "project"

require("telescope").setup {
  extensions = {
    project = {
      base_dirs = {
        '~/code',
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      sync_with_nvim_tree = true, -- default false
    }
  }
}

lvim.builtin.telescope.defaults.mappings = {
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

--  ╭──────────────────────────────────────────────────────────╮
--  │ Change theme settings                                    │
--  ╰──────────────────────────────────────────────────────────╯
-- vim.builtin.theme.options.style = "night"

--  ╭──────────────────────────────────────────────────────────╮
--  │ Use which-key to add extra bindings with the             │
--  │  leader-key prefix                                       │
--  ╰──────────────────────────────────────────────────────────╯
-- lvim.builtin.which_key.mappings["R"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["g"] = {
  name = "+Vimagit",
  g = { ":Git<cr>", "Git" },
  d = { ":DiffviewOpen<cr>", "Open" },
  D = { ":DiffviewClose<cr>", "Close" },
  p = { ":Git push<cr>", "Push" },
  b = { ":Git branc<cr>", "branc" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

--  ╭──────────────────────────────────────────────────────────╮
--  │ After changing plugin config exit and reopen             │
--  │  LunarVim, Run :PackerInstall :PackerCompile             │
--  ╰──────────────────────────────────────────────────────────╯
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

--  ╭──────────────────────────────────────────────────────────╮
--  │ if you don't want all the parsers change this to a       │
--  │  table of the ones you want                              │
--  ╰──────────────────────────────────────────────────────────╯
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

--  ╭──────────────────────────────────────────────────────────╮
--  │ generic LSP settings                                     │
--  ╰──────────────────────────────────────────────────────────╯

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
}

--  ╭──────────────────────────────────────────────────────────╮
--  │ Additional Plugins                                       │
--  ╰──────────────────────────────────────────────────────────╯
lvim.plugins = {
  { 'LudoPinelli/comment-box.nvim' },
  { 'jreybert/vimagit' },
  { 'sindrets/diffview.nvim' },
  { 'tpope/vim-fugitive' },
  { 'honza/vim-snippets' },
  { 'SirVer/ultisnips' },
  { 'arcticicestudio/nord-vim' },
  { 'tpope/vim-surround' },
  { 'Pocco81/DAPInstall.nvim' },
  { 'Pocco81/dap-buddy.nvim' },
  { 'brenoprata10/nvim-highlight-colors' },
  { 'jakerobers/vim-hexrgba' },
  { 'alvan/vim-closetag' },
  { 'windwp/nvim-ts-autotag' },
  { 'ziontee113/color-picker.nvim' },
  { 'lambdalisue/suda.vim' },
  { 'ellisonleao/glow.nvim' },
  { 'lommix/godot.nvim' },
  { 'habamax/vim-godot' },
  { 'neoclide/coc.nvim', },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  { 'nvim-telescope/telescope-project.nvim' },
  { 'tom-anders/telescope-vim-bookmarks.nvim' },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
}

--  ╭──────────────────────────────────────────────────────────╮
--  │ Plugin config                                            │
--  ╰──────────────────────────────────────────────────────────╯
require('nvim-highlight-colors').setup {}
require('nvim-ts-autotag').setup {}
require("lspconfig").gdscript.setup {
  flags = {
    debounce_text_changes = 150,
  }
}

vim.lsp.start({
  name = "godot",
  cmd = vim.lsp.rpc.connect('127.0.0.1', 6008)
})

--  ╭──────────────────────────────────────────────────────────╮
--  │ Autocommands (https://neovim.io/doc/user/autocmd.html)   │
--  ╰──────────────────────────────────────────────────────────╯
--  Change comment color for better readability
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*" },
  -- enable wrap mode for json files only
  command = "highlight Comment guifg=lightblue",
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
