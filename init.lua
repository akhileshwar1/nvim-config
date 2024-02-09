-- Add directory to package path
local config_dir = vim.fn.expand('~/.config/nvim/')
package.path = package.path .. ';' .. config_dir .. '?.lua'
require('coc_config')
vim.g.loaded_python_provider = 1
-- Packer installation
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Packer configuration
return require('packer').startup(function()
  -- Packer itself
  use 'wbthomason/packer.nvim'

  -- acts as a bridge between neovim and lsps.
  use {
  'neoclide/coc.nvim',
  branch = 'master',
  run = 'yarn install --frozen-lockfile'
  }

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'mfussenegger/nvim-lint',
    'mhartington/formatter.nvim'
    }

   use "dense-analysis/ale"
  -- setting up mason. It basically helps in setting up lsps, linters etc in such a way that neovim can access them.
  -- It installs packages at ~/.local/share/mason
    require("mason").setup {
     ui = {
         icons = {
             package_installed = "✓"
         }
     }
 }
    require("mason-lspconfig").setup {
     ensure_installed = { "clojure-lsp", "lua-language-server" },
 }
  vim.g.ale_linters = {
   clojure = { 'clj-kondo' }
  }
    -- Plugins
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'guns/vim-clojure-static'
  use 'tpope/vim-fireplace'
  use 'TheZoq2/neovim-auto-autoread'
  use 'ctrlpvim/ctrlp.vim'
  use 'liuchengxu/vim-clap'
  use 'christoomey/vim-tmux-navigator'
  use 'preservim/vimux'
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  use { 'instant-markdown/vim-instant-markdown', ft = 'markdown', run = 'yarn install' }
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' }
  use 'guns/vim-sexp'
  use { 'liquidz/vim-iced', ft = 'clojure' }
  use 'dracula/vim'
  use 'ryanoasis/vim-devicons'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'scrooloose/nerdtree'
  use 'preservim/nerdcommenter'
  use 'mhinz/vim-startify'
  use 'kassio/neoterm'
  use 'NLKNguyen/papercolor-theme'
  use 'urbainvaes/vim-ripple'
  use 'urbainvaes/vim-tmux-pilot'
  use 'sbdchd/neoformat'
  use "tpope/vim-fugitive"

  -- Additional configuration
  vim.env.PATH = vim.env.PATH .. ':~/.vim/plugged/vim-iced/bin'
  vim.g.ripple_repls = {}
  vim.g.ripple_repls["clj"] = {
    command = "iced repl",
    addcr = 0,
    filter = 0
  }
  vim.g.ripple_enable_mappings = 1
  vim.opt.background = 'dark'
  vim.cmd([[colorscheme PaperColor]])

vim.g.iced_enable_default_key_mappings = true

-- boundary setter in code.
vim.api.nvim_set_var('b', 'i;  78i-kj')

-- CLOJURE FIREPLACE
vim.api.nvim_set_keymap('n', 'fe', ':Eval<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'fee', ':%Eval<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'fr', ':Require<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'fR', ':Require!<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'fs', ':lopen<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<Nop>(iced_command_palette)', '<Plug>(iced_command_palette)', {})
vim.api.nvim_set_keymap('n', '<Leader>hc', '<Plug>(iced_command_palette)', {})
vim.api.nvim_set_keymap('n', '<Leader>hh', '<Plug>(iced_clojuredocs_open)', {})



-- CLOJURE
-- VIM-ICED
vim.api.nvim_set_keymap('n', '<Space>e', '<Plug>(iced_eval_and_print)af', {})
vim.api.nvim_set_keymap('n', '<Leader>ef', '<Plug>(iced_eval_outer_top_list)', {})
vim.api.nvim_set_keymap('n', '<Leader>rfu', '<Plug>(iced_use_case_open)', {})
vim.api.nvim_set_keymap('n', '<Leader>=', '<Plug>(iced_format_all)', {})

-- let g:iced#buffer#stdout#mods = 'rightbelow'
-- let g:iced_formatter = 'joker'
-- :packadd vim-iced-coc-source

-- SEXP
vim.api.nvim_set_keymap('n', 'B', '<Plug>(sexp_move_to_prev_element_head)', {})
vim.api.nvim_set_keymap('n', 'W', '<Plug>(sexp_move_to_next_element_head)', {})
vim.api.nvim_set_keymap('n', 'gE', '<Plug>(sexp_move_to_prev_element_tail)', {})
vim.api.nvim_set_keymap('n', 'E', '<Plug>(sexp_move_to_next_element_tail)', {})
vim.api.nvim_set_keymap('x', 'B', '<Plug>(sexp_move_to_prev_element_head)', {})
vim.api.nvim_set_keymap('x', 'W', '<Plug>(sexp_move_to_next_element_head)', {})
vim.api.nvim_set_keymap('x', 'gE', '<Plug>(sexp_move_to_prev_element_tail)', {})
vim.api.nvim_set_keymap('x', 'E', '<Plug>(sexp_move_to_next_element_tail)', {})
vim.api.nvim_set_keymap('o', 'B', '<Plug>(sexp_move_to_prev_element_head)', {})
vim.api.nvim_set_keymap('o', 'W', '<Plug>(sexp_move_to_next_element_head)', {})
vim.api.nvim_set_keymap('o', 'gE', '<Plug>(sexp_move_to_prev_element_tail)', {})
vim.api.nvim_set_keymap('o', 'E', '<Plug>(sexp_move_to_next_element_tail)', {})
vim.api.nvim_set_keymap('n', 'w(', '<Plug>(sexp_flow_to_next_open)', {})
vim.api.nvim_set_keymap('n', 'b(', '<Plug>(sexp_flow_to_prev_open)', {})
vim.api.nvim_set_keymap('n', 'w)', '<Plug>(sexp_flow_to_next_close)', {})
vim.api.nvim_set_keymap('n', 'b)', '<Plug>(sexp_flow_to_prev_close)', {})

vim.api.nvim_set_keymap('n', '<I', '<Plug>(sexp_insert_at_list_head)', {})
vim.api.nvim_set_keymap('n', '>I', '<Plug>(sexp_insert_at_list_tail)', {})
vim.api.nvim_set_keymap('n', '<f', '<Plug>(sexp_swap_list_backward)', {})
vim.api.nvim_set_keymap('n', '>f', '<Plug>(sexp_swap_list_forward)', {})
vim.api.nvim_set_keymap('n', '<e', '<Plug>(sexp_swap_element_backward)', {})
vim.api.nvim_set_keymap('n', '>e', '<Plug>(sexp_swap_element_forward)', {})
vim.api.nvim_set_keymap('n', '>(', '<Plug>(sexp_emit_head_element)', {})
vim.api.nvim_set_keymap('n', '<)', '<Plug>(sexp_emit_tail_element)', {})
vim.api.nvim_set_keymap('n', '<(', '<Plug>(sexp_capture_prev_element)', {})
vim.api.nvim_set_keymap('n', '>)', '<Plug>(sexp_capture_next_element)', {})

  -- Key mappings
  vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>pt', '<cmd>lua require("telescope.builtin").treesitter()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>pf', '<cmd>lua require("telescope.builtin").find_files({ previewer = false })<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>pg', '<cmd>lua require("telescope.builtin").live_grep({ previewer = false })<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>pb', '<cmd>lua require("telescope.builtin").buffers({ previewer = false })<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>ph', '<cmd>lua require("telescope.builtin").help_tags({ previewer = false })<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>pt', '<cmd>lua require("telescope.builtin").treesitter({ previewer = false })<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>cr', '<cmd>Clap ranger<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>tabnew<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tc', '<cmd>tabclose<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>tm', '<cmd>tabmove', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>noh<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true })


-- init.lua

if vim.fn.has('nvim') == 1 then
  -- Terminal mode mappings
  vim.api.nvim_set_keymap('t', 'kj', '<C-\\><C-n>', {noremap = true})
  vim.api.nvim_set_keymap('t', '<M-[>', '<Esc>', {noremap = true})
  vim.api.nvim_set_keymap('t', '<C-v><Esc>', '<Esc>', {noremap = true})

  -- Terminal mode navigation mappings
  vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', {noremap = true})
  vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', {noremap = true})
  vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', {noremap = true})
  vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', {noremap = true})

  -- Insert mode navigation mappings
  vim.api.nvim_set_keymap('i', '<C-h>', '<Esc><C-w>h', {noremap = true})
  vim.api.nvim_set_keymap('i', '<C-j>', '<Esc><C-w>j', {noremap = true})
  vim.api.nvim_set_keymap('i', '<C-k>', '<Esc><C-w>k', {noremap = true})
  vim.api.nvim_set_keymap('i', '<C-l>', '<Esc><C-w>l', {noremap = true})

  -- Visual mode navigation mappings
  vim.api.nvim_set_keymap('v', '<C-h>', '<Esc><C-w>h', {noremap = true})
  vim.api.nvim_set_keymap('v', '<C-j>', '<Esc><C-w>j', {noremap = true})
  vim.api.nvim_set_keymap('v', '<C-k>', '<Esc><C-w>k', {noremap = true})
  vim.api.nvim_set_keymap('v', '<C-l>', '<Esc><C-w>l', {noremap = true})

  -- Normal mode navigation mappings
  vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
  vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
  vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
  vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})

  -- Smart navigation in insert mode
  vim.api.nvim_set_keymap('i', 'j', 'pumvisible() ? "<C-n>" : "j"', {expr = true, noremap = true})
  vim.api.nvim_set_keymap('i', 'k', 'pumvisible() ? "<C-p>" : "k"', {expr = true, noremap = true})

  -- NERDTreeToggle mapping
  vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', {noremap = true})

  -- Escape key mappings
  vim.api.nvim_set_keymap('i', 'kj', '<Esc>', {noremap = true})
  vim.api.nvim_set_keymap('v', 'kj', '<Esc>', {noremap = true})
  vim.api.nvim_set_keymap('c', 'kj', '<C-C>', {noremap = true})

  -- Split vertically
  vim.api.nvim_set_keymap('n', 'vv', '<C-w>v', { silent = true })

  -- Prompt for a command to run
  vim.api.nvim_set_keymap('n', '<Leader>vp', ':VimuxPromptCommand<CR>', { silent = true })

  -- Run last command executed by VimuxRunCommand
  vim.api.nvim_set_keymap('n', '<Leader>vl', ':VimuxRunLastCommand<CR>', { silent = true })

  -- Inspect runner pane
  vim.api.nvim_set_keymap('n', '<Leader>vi', ':VimuxInspectRunner<CR>', { silent = true })

  -- Zoom the tmux runner pane
  vim.api.nvim_set_keymap('n', '<Leader>vz', ':VimuxZoomRunner<CR>', { silent = true })
end

--vim.opt.nocompatible = true             -- disable compatibility to old-time vi
vim.opt.showmatch = true                -- show matching
vim.opt.ignorecase = true               -- case insensitive
vim.opt.mouse = "v"                     -- middle-click paste with
vim.opt.hlsearch = true                 -- highlight search
vim.opt.incsearch = true                -- incremental search
vim.opt.tabstop = 4                     -- number of columns occupied by a tab
vim.opt.softtabstop = 4                 -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true                -- converts tabs to white space
vim.opt.shiftwidth = 4                  -- width for autoindents
vim.opt.autoindent = true               -- indent a new line the same amount as the line just typed
vim.opt.number = true                   -- add line numbers
vim.opt.wildmode = "longest,list"       -- get bash-like tab completions
--vim.opt.cc = 80                         -- set an 80 column border for good coding style
vim.opt.filetype = "plugin"             -- allow auto-indenting depending on file type
vim.opt.syntax = "on"                   -- syntax highlighting
vim.opt.clipboard = "unnamedplus"       -- using system clipboard
vim.opt.cursorline = true               -- highlight current cursorline
vim.opt.ttyfast = true                  -- Speed up scrolling in Vim

-- Set splitright and splitbelow options
vim.o.splitright = true
vim.o.splitbelow = true

  -- Start NERDTree and put the cursor back in the other window
  vim.cmd('autocmd VimEnter * NERDTree | wincmd p')

  -- Trigger autoread when files change on disk
  vim.cmd('set autoread')
  vim.cmd('autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != "c" | checktime | endif')

  -- Notification after file change
  vim.cmd('autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None')

end)
