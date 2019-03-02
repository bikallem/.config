" Auto install Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" ==================================================
" Plugins
" ==================================================
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

Plug 'sjl/gundo.vim'

" Return to the last cursor position of a file on reopen.
" Similar to commands like those in Gary Berhardt's dotfiles and :help last-position-jump,
" but a little more fully featured
" See for details:
" https://vim.fandom.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
Plug 'farmergreg/vim-lastplace'

" --------------------------------------------------
" Themes, statuses, etc.
" --------------------------------------------------
Plug 'arcticicestudio/nord-vim'             " A nice theme
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
" Plug 'nathunsmitty/night-owl.vim'
Plug '~/Developer/Personal Projects/night-owl.vim'


Plug 'vim-airline/vim-airline'              " Status bar

" Most maintained rainbow parens plugin
Plug 'luochen1990/rainbow'

" --------------------------------------------------
" Git tools
" --------------------------------------------------
" Git commands in vim
Plug 'tpope/vim-fugitive'
" Fugitive extensions for GitHub
Plug 'tpope/vim-rhubarb'
" Pluses and minuses in the sidebar!
Plug 'airblade/vim-gitgutter'

" --------------------------------------------------
" General tools
" --------------------------------------------------
" Easily define text objects (required for textobj-entire)
Plug 'kana/vim-textobj-user'
" Text objects to select entire buffer (ae, ie)
Plug 'kana/vim-textobj-entire'
" Commenting support (gc)
Plug 'tpope/vim-commentary'
" Surrounding text shortcuts
Plug 'tpope/vim-surround'
" Use `.` for plugins
Plug 'tpope/vim-repeat'
" Helpful character metadata on `ga` 😍
Plug 'tpope/vim-characterize'
" Ctrl-a, ctrl-x for dates, times, etc.
Plug 'tpope/vim-speeddating'
" Dash Integration
Plug 'rizzatti/dash.vim'
" Detect indentation settings
Plug 'tpope/vim-sleuth'
" Editorconfig support
Plug 'editorconfig/editorconfig-vim'

" --------------------------------------------------
" Fuzzy finding (with fzf)
" --------------------------------------------------
"  Source fzf (installed with homebrew)
Plug '/usr/local/opt/fzf'
" fzf vim plugin
Plug 'junegunn/fzf.vim'

" --------------------------------------------------
" Linters and Autocomplete
" --------------------------------------------------
Plug 'w0rp/ale'                             " Linting and LSP support
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" --------------------------------------------------
" Markdown
" --------------------------------------------------
Plug 'plasticboy/vim-markdown'

" --------------------------------------------------
" JavaScript/TypeScript
" --------------------------------------------------

" Moder JS support (indent, syntax, etc)
Plug 'pangloss/vim-javascript'
" JSX syntax
Plug 'mxw/vim-jsx', { 'for': ['jsx', 'javascript.jsx'] }

" JSDoc generation
Plug 'heavenshell/vim-jsdoc'

" CSS-in-JS Support
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
" TypeScript Syntax
Plug 'leafgarland/typescript-vim'
" TSX Support
Plug 'ianks/vim-tsx'
" Add flow typing support
Plug 'flowtype/vim-flow'


" --------------------------------------------------
" JSON
" --------------------------------------------------
Plug 'elzr/vim-json'

" --------------------------------------------------
" GraphQL
" --------------------------------------------------
Plug 'jparise/vim-graphql'

" --------------------------------------------------
" HTML/CSS
" --------------------------------------------------
" HTML5 syntax
Plug 'othree/html5.vim'
" Emmett HTML completion
Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'typescript.tsx', 'html', 'css'] }
Plug 'digitaltoad/vim-pug'

" --------------------------------------------------
" Go
" --------------------------------------------------
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }



Plug 'tpope/vim-dotenv'
Plug 'dag/vim-fish'

call plug#end()


" Learn Vimscript the Hard Way
" http://learnvimscriptthehardway.stevelosh.com/chapters/01.html
:echo "Welcome back, Nathan! >^.^<"


" --------------------------------------------------
" Custom Commands
" --------------------------------------------------
command! Config execute ":vsplit $MYVIMRC"
autocmd bufwritepost init.vim source $MYVIMRC


" --------------------------------------------------
" 1.4 C
" --------------------------------------------------
" Plug 'vim-scripts/aftersyntaxc.vim', { 'dir': 'after/' }



" -----------------------------------------------------
" 4.11 Deoplete autocomplete settings
" -----------------------------------------------------
" let g:deoplete#enable_at_startup=1
" let g:deoplete#enable_refresh_always=0
" let g:deoplete#file#enable_buffer_path=1

" ==================================================
" 2.0 Basic settings
"   (Neovim defaults: https://neovim.io/doc/user/vim_diff.html#nvim-option-defaults)
" ==================================================
" Use Vim, not vi. This should be set by default, but let's make it explicit.
set nocompatible

:let mapleader = " "
nnoremap Y y$

set number                                  " Line numbers on
set showmode                                " Always show mode
set nowrap                                  " Do not wrap long line
set showcmd                                 " Show commands as you type them
" set cmdheight=1                             " Command line height
" set pumheight=10                            " Completion window max size
set noswapfile                              " New buffers will be loaded without creating a swapfile
" set hidden                                  " Enables to switch between unsaved buffers and keep undo history
set clipboard+=unnamed                      " Allow to use system clipboard
" set nostartofline                           " Prevent cursor from moving to beginning of line when switching buffers




filetype plugin on
set omnifunc=syntaxcomplete#Complete

" See https://github.com/neovim/neovim/issues/4867#issuecomment-291249173
" and https://github.com/neovim/neovim/wiki/FAQ#cursor-style-isnt-restored-after-exiting-nvim
:au VimLeave * set guicursor=a:ver25-blinkon1

" --------------------------------------------------
" Spell checking
" refs:
" - http://vimcasts.org/episodes/spell-checking/
" --------------------------------------------------
" Spell file location
set spellfile=~/.config/nvim/spell/dictionary.utf-8.add
" 'Murican English
set spelllang=en_us
" No spelling by default
" Toggable by keyboard settings in unimpaired
" <os to enable
" >os to disable
" =os to toggle
set nospell

" --------------------------------------------------
" Autocompletion
" aka intellisense, omnicomplete
" refs:
" - http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" --------------------------------------------------
:set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" --------------------------------------------------
" Whitespace characters settings
" refs:
" - http://vimcasts.org/episodes/tabs-and-spaces/
" - http://vimcasts.org/episodes/show-invisibles/
" --------------------------------------------------
" View tabs as 2 spaces wide
set tabstop=2
" Ident by 2:
set shiftwidth=2
" Use spaces instead of tabs
set expandtab
" Tab to the current indent level
set smarttab
" Show whitespace characters
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:·,nbsp:·,space:·
set showbreak=↪

" --------------------------------------------------
" Appearance
" --------------------------------------------------
" True colors
set termguicolors
" Syntax highlighting
syntax on
" Palenight color scheme
set background=dark
" colorscheme palenight
" colorscheme gruvbox
colorscheme night-owl
let g:gruvbox_italic=1
let g:palenight_terminal_italics=1
" Blink the cursor
set guicursor=a:blinkon1

" Set this variable to 1 to fix files when you save them.
" let g:ale_completion_enabled = 1
let g:ale_completion_delay = 0
let g:ale_fix_on_save = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)%

nnoremap <Leader>p :Files<Cr>

:set mouse=a
" augroup vimrc     " Source vim configuration upon save
"   autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
" augroup END

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'javascript.jsx': ['eslint', 'prettier'],
\   'typescript.tsx': ['eslint', 'prettier'],
\}
let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
let g:ale_javascript_eslint_suppress_missing_config = 1

:set wrap

"
" Treat all numbers as decimal, even if prefixed with leading 0s
" See Pratical Vim, pg 21 for details
set nrformats=

:set ignorecase
:set smartcase

" Disable markdown folding
let g:vim_markdown_folding_disabled = 1


" Unimpaired configuration
" Because "[" and "]" are a little hard to type on a Dvorak keyboard
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]

" Natural splits
set splitbelow
set splitright
" Split help windows vertically, on the right
autocmd FileType help wincmd L


" --------------------------------------------------
" Rainbow Parentheses
" refs: https://github.com/luochen1990/rainbow
" --------------------------------------------------
let g:rainbow_active = 1
let g:rainbow_conf = {
\  'guifgs': ['#ffd700', '#da70d6', '#87cefa']
\}
