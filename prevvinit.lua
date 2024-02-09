-- Lua function to execute Plug commands
local Plug = vim.fn['plug#']

-- Initialize plugin manager
vim.call('plug#begin', '~/.vim/plugged')

-- Plugin definitions
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { 'tag': '0.1.1' })
Plug('TheZoq2/neovim-auto-autoread')
Plug('ctrlpvim/ctrlp.vim')
Plug('liuchengxu/vim-clap')
Plug('christoomey/vim-tmux-navigator')
Plug('junegunn/fzf', { 'do': { function() vim.fn['fzf#install']() end } })
Plug('preservim/vimux')
Plug('instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'})
Plug('iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' })
Plug('guns/vim-sexp',    {'for': 'clojure'})
Plug('liquidz/vim-iced', {'for': 'clojure'})
Plug('dracula/vim')
Plug('ryanoasis/vim-devicons')
Plug('SirVer/ultisnips')
Plug('honza/vim-snippets')
Plug('scrooloose/nerdtree')
Plug('preservim/nerdcommenter')
Plug('mhinz/vim-startify')
Plug('neoclide/coc.nvim', {'branch': 'release'})
Plug('kassio/neoterm')
Plug('NLKNguyen/papercolor-theme')
Plug('urbainvaes/vim-ripple')
Plug('urbainvaes/vim-tmux-pilot')
Plug('sbdchd/neoformat')

-- End plugin manager initialization
vim.call('plug#end')

-- Lua function to define key mappings
local map = vim.api.nvim_set_keymap

-- Key mappings using Lua functions
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', {noremap = true})
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', {noremap = true})
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', {noremap = true})
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', {noremap = true})
map('n', 'vv', '<C-w>v', {noremap = true})
map('n', '<leader>vp', ':VimuxPromptCommand<CR>', {noremap = true})
map('n', '<leader>vl', ':VimuxRunLastCommand<CR>', {noremap = true})
map('n', '<leader>vi', ':VimuxInspectRunner<CR>', {noremap = true})
map('n', '<leader>vz', ':VimuxZoomRunner<CR>', {noremap = true})
map('n', '<C-h>', ':call TmuxOrSplitSwitch("h", "L")<cr>', {noremap = true})
map('n', '<C-j>', ':call TmuxOrSplitSwitch("j", "D")<cr>', {noremap = true})
map('n', '<C-k>', ':call TmuxOrSplitSwitch("k", "U")<cr>', {noremap = true})
map('n', '<C-l>', ':call TmuxOrSplitSwitch("l", "R")<cr>', {noremap = true})
map('t', 'kj', '<C-\\><C-n>', {noremap = true})
map('t', '<M-[>', '<Esc>', {noremap = true})
map('t', '<C-v><Esc>', '<Esc>', {noremap = true})
map('t', '<C-h>', '<c-\\><c-n><c-w>h', {noremap = true})
map('t', '<C-j>', '<c-\\><c-n><c-w>j', {noremap = true})
map('t', '<C-k>', '<c-\\><c-n><c-w>k', {noremap = true})
map('t', '<C-l>', '<c-\\><c-n><c-w>l', {noremap = true})
map('i', '<C-h>', '<Esc><c-w>h', {noremap = true})
map('i', '<C-j>', '<Esc><c-w>j', {noremap = true})
map('i', '<C-k>', '<Esc><c-w>k', {noremap = true})
map('i', '<C-l>', '<Esc><c-w>l', {noremap = true})
map('v', '<C-h>', '<Esc><c-w>h', {noremap = true})
map('v', '<C-j>', '<Esc><c-w>j', {noremap = true})
map('v', '<C-k>', '<Esc><c-w>k', {noremap = true})
map('v', '<C-l>', '<Esc><c-w>l', {noremap = true})
map('n', '<C-h>', '<c-w>h', {noremap = true})
map('n', '<C-j>', '<c-w>j', {noremap = true})
map('n', '<C-k>', '<c-w>k', {noremap = true})
map('n', '<C-l>', '<c-w>l', {noremap = true})
map('i', 'j', 'pumvisible() ? "\\<C-n>" : "j"', {expr = true})
map('i', 'k', 'pumvisible() ? "\\<C-p>" : "k"', {expr = true})
map('n', '<C-n>', ':NERDTreeToggle<CR>', {noremap = true})
map('i', 'kj', '<esc>', {noremap = true})
map('v', 'kj', '<esc>', {noremap = true})
map('c', 'kj', '<C-C>', {noremap = true})

-- Additional configuration
vim.env.PATH = vim.env.PATH .. ':~/.vim/plugged/vim-iced/bin'
vim.g.ripple_repls = {}
vim.g.ripple_repls["clj"] = {
    command = "iced repl",
    addcr = 0,
    filter = 0
}
vim.g.ripple_enable_mappings = 1
vim.g.iced_enable_default_key_mappings = true

-- Start NERDTree and put the cursor back in the other window
vim.cmd('autocmd VimEnter * NERDTree | wincmd p')

-- Trigger autoread when files change on disk
vim.cmd('set autoread')
vim.cmd('autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != "c" | checktime | endif')

-- Notification after file change
vim.cmd('autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None')

