--  ╭──────────────────────────────────────────────────────────╮
--  │ General                                                  │
--  ╰──────────────────────────────────────────────────────────╯

lvim.log.level = "warn"
lvim.format_on_save.enabled = true
vim.opt.relativenumber = true
lvim.colorscheme = "nord"


vim.opt.autoindent = true
vim.opt.background = "dark"
vim.opt.belloff = "esc"
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1

vim.api.nvim_set_hl(0, "ZenBg", { ctermbg = 0 })
vim.cmd("autocmd VimEnter * hi ZenBg ctermbg=NONE guibg=NONE")
-- Keep line vertically centered
-- vim.cmd("autocmd VimEnter * set scrolloff=999")

vim.g.editorconfig = true

lvim.builtin.theme.tokyonight = false

lvim.use_icons = true
lvim.transparent_window = true

vim.g.godot_executable = "/home/eko/appimg/Godot_v4.0-beta8_linux.x86_64"

--  ╭──────────────────────────────────────────────────────────╮
--  │ Neovide                                                  │
--  ╰──────────────────────────────────────────────────────────╯
vim.g.neovide_transparency = .7
vim.o.guifont = "Fira Code:h14"
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_refresh_rate = 144

--  ╭──────────────────────────────────────────────────────────╮
--  │ keymappings [view all the defaults by pressing <leader>Lk]│
--  ╰──────────────────────────────────────────────────────────╯
lvim.leader = "space"

lvim.builtin.which_key.mappings.f = nil
lvim.builtin.which_key.mappings["/"] = nil
lvim.keys.normal_mode["<leader>w"] = false
lvim.keys.normal_mode["<leader>w"] = nil
lvim.keys.normal_mode["<leader>fs"] = ":w<cr>"
lvim.keys.normal_mode["<M-l>"] = "<cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<M-h>"] = "<cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader>bd"] = "<cmd>BufferKill<CR>"
lvim.keys.normal_mode["<Leader>ba"] = ':%bd!|e #|bd #|normal`"<CR>'
lvim.keys.normal_mode["<leader>wd"] = ":q<cr>"
-- lvim.keys.normal_mode["gc"] = "<Plug>(comment_toggle_linewise_current)"
lvim.keys.normal_mode["<leader>bc"] = ":CBlbox<cr>"
lvim.keys.normal_mode["<leader>E"] = ":Telescope find_files <CR>"
lvim.keys.normal_mode["<leader>B"] = ":Telescope live_grep <CR>"

lvim.keys.normal_mode["|"] = ":vsplit<cr>"
lvim.keys.normal_mode["-"] = ":hsplit<cr>"

--  ╭──────────────────────────────────────────────────────────╮
--  │ Change Telescope navigation to use j and k for           │
--  │  navigation and n and p for history in both input        │
--  │  and normal mode. we use protected-mode (pcall)          │
--  │  just in case the plugin wasn't loaded yet.              │
--  ╰──────────────────────────────────────────────────────────╯
local _, actions = pcall(require, "telescope.actions")

-- require("telescope").load_extension "file_browser"
-- require("telescope").load_extension "project"
require("luasnip/loaders/from_vscode").load { paths = { "~/.config/lvim/snippets/my-snippets" } }

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
--  │ Use which-key to add extra bindings with the             │
--  │  leader-key prefix                                       │
--  ╰──────────────────────────────────────────────────────────╯

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
  { 'nvim-telescope/telescope-file-browser.nvim' },
  { 'nvim-telescope/telescope-project.nvim' },
  { 'tom-anders/telescope-vim-bookmarks.nvim' },
  { 'elkowar/yuck.vim' },
  { 'folke/zen-mode.nvim' },
  { 'smithbm2316/centerpad.nvim' },
  { 'ggandor/leap.nvim' },
  { 'norcalli/snippets.nvim' },
  { 'Shougo/deoplete.nvim' },
  { 'nyoom-engineering/nyoom.nvim' },
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
require("lspconfig").tsserver.setup {}
require("leap").add_default_mappings()
require("lspconfig").gdscript.setup {
  flags = {
    debounce_text_changes = 150,
  }
}

--  ╭──────────────────────────────────────────────────────────╮
--  │ Autocommands (https://neovim.io/doc/user/autocmd.html)   │
--  ╰──────────────────────────────────────────────────────────╯
--  Change comment color for better readability
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*" },
  -- enable wrap mode for json files only
  command = "highlight Comment guifg=lightblue",
})
