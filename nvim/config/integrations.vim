" integrations.vim
" Configuration for interactions with external programs

let s:uname = trim(system("uname -s"))

" Set Python paths
if s:uname == "Darwin"
  let g:python_host_prog = "/usr/bin/python"
  let g:python3_host_prog = "/usr/local/bin/python3"
  " let g:python_host_prog = "/usr/local/bin/python"
  " let g:python3_host_prog = "/usr/local/opt/python@3.8/bin/python3"
endif

" Open images in an image viewer (probably Preview)
if s:uname == "Darwin"
  autocmd BufEnter *.png,*.jpg,*.gif exec "silent !open ".expand("%") | :bw
endif

" ctags integration with gutentags
call minpac#add('ludovicchabant/vim-gutentags',  {'rev': '31c0ead'})
let g:gutentags_ctags_executable_ruby = 'ripper-tags'
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git', 'vim']
let g:gutentags_ctags_exclude = [
      \  '*.git', '*.svn', '*.hg',
      \  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
      \  '*-lock.json',  '*.lock',
      \  '*.min.*',
      \  '*.bak',
      \  '*.zip',
      \  '*.pyc',
      \  '*.class',
      \  '*.sln',
      \  '*.csproj', '*.csproj.user',
      \  '*.tmp',
      \  '*.cache',
      \  '*.vscode',
      \  '*.pdb',
      \  '*.exe', '*.dll', '*.bin',
      \  '*.mp3', '*.ogg', '*.flac',
      \  '*.swp', '*.swo',
      \  '.DS_Store', '*.plist',
      \  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
      \  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
      \]

" grep with ripgrep
" https://github.com/BurntSushi/ripgrep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

" Diff Mode
set diffopt+=vertical

" Git
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-rhubarb')

" Unix utilities
call minpac#add('tpope/vim-eunuch')


" Testing with vim-test
call minpac#add('vim-test/vim-test')
let g:test#javascript#jest#file_pattern = '\v(__tests__/.*|(spec|test|unit))\.(js|jsx|coffee|ts|tsx|iced)$'
let g:test#javascript#jest#executable = 'yarn test'
nnoremap <leader>t :TestNearest<cr>
nnoremap <leader>T :TestFile<cr>
nnoremap <leader>a :TestSuite<cr>

" Linter support
" ALE
call minpac#add('dense-analysis/ale')
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_prolog_swipl_timeout = 10
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
nmap gh <Plug>(ale_hover)
nmap gd <Plug>(ale_go_to_definition)
nmap gr <Plug>(ale_find_references)

call minpac#add('neovim/nvim-lsp', {'type': 'opt'})
packadd nvim-lsp
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

set completeopt+=menuone,noselect,noinsert
call minpac#add('nvim-lua/lsp-status.nvim', {'type': 'opt'})
packadd lsp-status.nvim
" function! OpenCompletion()
"     if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
"         call feedkeys("\<C-x>\<C-o>", "n")
"     endif
" endfunction
" autocmd InsertCharPre * call OpenCompletion()
