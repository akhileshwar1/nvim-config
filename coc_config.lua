vim.g.airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
vim.g.airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>u', '<Plug>(coc-references)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>i', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })
vim.cmd('command! -nargs=0 Format :call CocAction("format")')

vim.api.nvim_set_keymap('i', '<C-Space>', 'coc#refresh()', { silent = true })
vim.api.nvim_set_keymap('n', '[l', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', ']l', '<Plug>(coc-diagnostic-next)', { silent = true })
vim.api.nvim_set_keymap('n', '[k', ':CocPrev<CR>', { silent = true })
vim.api.nvim_set_keymap('n', ']k', ':CocNext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'K', ':call v:lua.show_documentation()<CR>', { silent = true })

function show_documentation()
  if vim.bo.filetype == 'vim' then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  else
    vim.fn.CocActionAsync('doHover')
  end
end

function Expand(exp)
  local result = vim.fn.expand(exp)
  return result == '' and '' or 'file://' .. result
end

-- VERY NEAT CODING FUNCTIONS.
-- As said before, Coc takes the clojure commands as args which are then sent to the clojure-lsp server.
vim.api.nvim_set_keymap('n', 'crcc', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "cycle-coll", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crth', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "thread-first", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crtt', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "thread-last", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crtf', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "thread-first-all", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crtl', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "thread-last-all", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'cruw', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "unwind-thread", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crua', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "unwind-all", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crml', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "move-to-let", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1, input("Binding name: ")]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'cril', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "introduce-let", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1, input("Binding name: ")]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crel', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "expand-let", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'cram', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "add-missing-libspec", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crcn', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "clean-ns", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crcp', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "cycle-privacy", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'cris', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "inline-symbol", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'cref', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "extract-function", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1, input("Function name: ")]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crci', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "cursor-info", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crsi', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "server-info", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>T', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "move-coll-entry-up", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "move-coll-entry-down", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crmf', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "move-form", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1, input("File: ", "", "file")]})<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crfe', ':call CocRequest("clojure-lsp", "workspace/executeCommand", {"command": "create-function", "arguments": [v:lua.Expand("%:p"), line(".") - 1, col(".") - 1]})<CR>', { silent = true })

vim.api.nvim_set_keymap('n', 'crsl', ':call setreg("*", CocRequest("clojure-lsp", "clojure/serverInfo/raw")["log-path"])<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'crsp', ':execute "Connect" CocRequest("clojure-lsp", "clojure/serverInfo/raw")["port"]<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)', {})
vim.api.nvim_set_keymap('v', '<leader>a', '<Plug>(coc-codeaction-selected)', {})
vim.api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction-cursor)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>aq', '<Plug>(coc-fix-current)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':<C-u>CocList -I symbols<CR>', {})

function LoadClojureContent(uri)
  vim.bo.filetype = 'clojure'
  local content = vim.fn.CocRequest("clojure-lsp", "clojure/dependencyContents", { uri = uri })
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(content, "\n"))
  vim.bo.modified = false
  vim.bo.readonly = true
end
vim.cmd([[
  autocmd BufReadCmd,FileReadCmd,SourceCmd jar:file://* call v:lua.LoadClojureContent(vim.fn.expand("<amatch>"))
]])

vim.cmd([[
  highlight Normal guibg=#101010 guifg=white
  highlight CursorColumn guibg=#202020
  highlight Keyword guifg=#FFAB52
  highlight CursorLine guibg=#202020
  hi clear CocHighlightText
  hi CocHighlightText guibg=#472004
  hi CocFadeOut gui=undercurl cterm=undercurl
]])

function SynGroup()
  local s = vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1)
  print(vim.fn.synIDattr(s, 'name') .. ' -> ' .. vim.fn.synIDattr(vim.fn.synIDtrans(s), 'name'))
end
