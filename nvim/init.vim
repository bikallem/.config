"  Nathan Smith's vim configuration

"  Overarching Philosophy:
" 1. Prefer the defaults
" 2. Extend functionality where needed
" 3. Change functionality only when it doesn't make sense

" Put plugin managment first, as it handles install minpac for later files
source $HOME/.config/nvim/config/plugin-management.vim
source $HOME/.config/nvim/config/editing.vim

source $HOME/.config/nvim/config/integrations.vim
source $HOME/.config/nvim/config/appearance.vim
source $HOME/.config/nvim/config/custom-commands.vim
source $HOME/.config/nvim/config/completion.vim
source $HOME/.config/nvim/config/languages.vim
source $HOME/.config/nvim/config/navigation.vim

source $HOME/.config/nvim/config/statusline.vim
source $HOME/.config/nvim/config/stripe.vim

call minpac#add('nvim-treesitter/nvim-treesitter', {'type': 'opt'})
packadd nvim-treesitter
lua require("treesitter")
" TSEnableAll highlight


noremap <c-z> <nop>

" From Learn VimScript the Hard Way, Ch 4
" :imap <c-u> <esc>viw~i
" :imap <c-U> <esc>viW~i
" :nmap <c-u> <esc>viw~
" :nmap <c-U> <esc>viw~
"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>rv :source $MYVIMRC<cr>

" Handle common typos
iabbrev adn and

nnoremap H ^
nnoremap L $


"  " Handle swap files better
"  " call minpac#add('gioele/vim-autoswap')
"  " let g:autoswap_detect_tmux = 1
"
"

packadd nvim-colorizer.lua
lua require 'colorizer'.setup(nil, { css = true; })
