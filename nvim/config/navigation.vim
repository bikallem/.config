" navigation.vim
" Settings to make navigating files, windows, tabs, etc. easier

" Faster file switching with alternates
" Also integrates with vim-test
call minpac#add('tpope/vim-projectionist')
lua require("projectionist")

" Fuzzy Finding
" I've found it to be faster that the default fzf plugin.
" fzf is much better than selecta, fzy, etc. though
" ripgrep has the fastest search
call minpac#add('srstevenson/vim-picker')
let g:picker_custom_find_executable = 'rg'
let g:picker_custom_find_flags = '-g !.git/ --files --hidden --color never'
let g:picker_selector_executable = 'fzf'
let g:picker_selector_flags = '--layout=reverse --tiebreak=index'
let g:picker_height = 14

" From https://balatero.com/writings/vim/fzf-ripgrep-proximity-sort/
function! g:FzfFilesSource()
  let l:base = fnamemodify(expand('%'), ':h:.:S')
  let l:proximity_sort_path = $HOME . '/.cargo/bin/proximity-sort'

  if base == '.'
    return printf('%s %s', g:picker_custom_find_executable, g:picker_custom_find_flags)
  else
    return printf('%s %s | %s %s', g:picker_custom_find_executable, g:picker_custom_find_flags, l:proximity_sort_path, expand('%'))
  endif
endfunction

nnoremap <silent> <leader>p :call picker#File(g:FzfFilesSource(), 'edit')<CR>

" NERDTree
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
" s for sidebar
map <leader>s :NERDTreeFind<CR>
" m conflicts with vim-signature
let NERDTreeMapMenu='n'
let g:NERDTreeAutoDeleteBuffer = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['.DS_Store$', '.git/$']

" More sensible window splits
set splitbelow
set splitright

" Split help windows vertically, on the right
autocmd FileType help wincmd L

" Easier split navigation
" https://thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
" ref: http://vimcasts.org/episodes/working-with-windows/
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffers
" ref: http://vimcasts.org/episodes/working-with-buffers/
" Enables to switch between unsaved buffers and keep undo history
set hidden

" Mouse support
" Useful for things like resizing windows
if has('mouse')
  set mouse=a
end

" Add current directory to path (for `gf`)
set path+=.,,
