" ---------------------------------------------------------------------------
" Nvim conf for Neovim(-q) @ Windows and Linux
" ---------------------------------------------------------------------------

syntax on

set autoindent
set hlsearch
set incsearch

set tabstop=4
set shiftwidth=4
set expandtab

set number
set relativenumber

set langmenu=en_US
language en_US
let $LANG = 'en_US'

" --- visibility stuff
colorscheme basic-light

hi CursorLine term=bold cterm=NONE ctermbg=7
set cursorline


let mapleader = " "
let maplocalleader = " "

call plug#begin('~/.local/share/nvim/plugged')

Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries', 'for': 'go'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'python-mode/python-mode', {'for' : 'python'}

call plug#end()

" turn on rope
" let g:pymode_rope = 1

" turn on completion?
" let g:pymode_rope_completion = 1

set mouse=a
let g:NERDTreeMouseMode=3

set listchars=space:_,trail:!,eol:$,tab:>~ list
set nolist

set splitbelow
set splitright


" --- mappings

noremap <silent> <leader>c :nohlsearch<CR>

noremap <silent> <F10> :set nonu !<CR>:set nornu !<CR>

noremap <silent> <F7> :NERDTreeToggle<CR>
noremap <silent> <F19> :FZF<CR>
