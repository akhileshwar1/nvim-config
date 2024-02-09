lua require('plugins')

filetype plugin on
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')


Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

Plug 'TheZoq2/neovim-auto-autoread'

" One of following
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'junegunn/fzf'
Plug 'liuchengxu/vim-clap'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/vimux'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Requires
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'kassio/neoterm'
 Plug 'NLKNguyen/papercolor-theme'
call plug#end()

Plug 'urbainvaes/vim-ripple'
" OPTIONAL DEPENDENCIES


" Streamline navigation (e.g. autoinsert in terminal)
Plug 'urbainvaes/vim-tmux-pilot'
" Enable vim-iced's default key mapping
" This is recommended for newbies
" Formatters
Plug 'sbdchd/neoformat'

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" vv to generate new vertical split
nnoremap <silent> vv <C-w>v
  " Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Zoom the tmux runner pane
<leader>vz :VimuxZoomRunner<CR>

" for the boundary setter in code.
let @b = 'i;  78i-kj'

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
 nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
"  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
 map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

if has('nvim')
  tnoremap kj <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>

  " Terminal mode:
  tnoremap <C-h> <c-\><c-n><c-w>h
  tnoremap <C-j> <c-\><c-n><c-w>j
  tnoremap <C-k> <c-\><c-n><c-w>k
  tnoremap <C-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <C-h> <Esc><c-w>h
  inoremap <C-j> <Esc><c-w>j
  inoremap <C-k> <Esc><c-w>k
  inoremap <C-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <C-h> <Esc><c-w>h
  vnoremap <C-j> <Esc><c-w>j
  vnoremap <C-k> <Esc><c-w>k
  vnoremap <C-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <C-h> <c-w>h
  nnoremap <C-j> <c-w>j
  nnoremap <C-k> <c-w>k
  nnoremap <C-l> <c-w>l

  inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
  inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))


nmap <C-n> :NERDTreeToggle<CR>
" esc in insert & visual mode
inoremap kj <esc>
vnoremap kj <esc>

" esc in command mode
cnoremap kj <C-C>
" Note: In command mode mappings to esc run the command for some odd
" historical vi compatibility reason. We use the alternate method of
" existing which is Ctrl-C
endif

export PATH=$PATH:~/.vim
/plugged/vim-iced/bin

let g:ripple_repls = {}
let g:ripple_repls["clj"] = {
    \ "command": "iced repl",
    \ "addcr": 0,
    \ "filter": 0,
    \ }

let g:ripple_enable_mappings = 1
"CLOJURE 
    "VIM-ICED
        let g:iced_enable_default_key_mappings = v:true

        nmap <Nop>(iced_command_palette) <Plug>(iced_command_palette)
        nmap <Leader>hc <Plug>(iced_command_palette)
        nmap <Leader>hh <Plug>(iced_clojuredocs_open)
        
        nmap <space>e <Plug>(iced_eval_and_print)af
        nmap <Leader>ef <Plug>(iced_eval_outer_top_list)
        nmap <Leader>rfu <Plug>(iced_use_case_open)
        nmap <Leader>= <Plug>(iced_format_all)
        
        "let g:iced#buffer#stdout#mods = 'rightbelow' 
        " let g:iced_formatter = 'joker'
        ":packadd vim-iced-coc-source
    "SEXP
        nmap <space>ks <Plug>(sexp_capture_next_element)
        nmap <space>kS <Plug>(sexp_capture_prev_element)
        map <M-j> <Plug>(sexp_swap_list_forward)
        map <M-k> <Plug>(sexp_swap_list_backward)
        map <M-h> <Plug>(sexp_swap_element_backward)
        map <M-l> <Plug>(sexp_swap_element_forward)
        "
" send selection to repl in a terminal using neoterm.
        vnoremap <C-v> :<c-u>exec v:count.'TREPLSendSelection'<cr>   
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" new scheme
set background=dark
colorscheme PaperColor
"color schemes
"if (has(“termguicolors”))
" set termguicolors
" endif
" syntax enable
" “ colorscheme evening
"colorscheme dracula
" open new split panes to right and below
set splitright
set splitbelow

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" trigger `autoread` when files changes on disk
      set autoread
      autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    " notification after file change
      autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


