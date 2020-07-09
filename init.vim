" ---------------------------------------------------------------------------
" Nvim conf for Neovim(-q) @ Windows and Linux
" ---------------------------------------------------------------------------


set autoindent
set hlsearch
set incsearch

set tabstop=4
set shiftwidth=4
set expandtab

set number
set relativenumber

" --- en_US.UTF8 should work on any Linux and Windows 10 at least
set langmenu=en_US.UTF8
language en_US.UTF8
let $LANG = 'en_US.UTF8'

" --- visibility stuff
set bg=light

" let g:gruvbox_contrast_dark="soft"
" colorscheme gruvbox

colorscheme solarized

set cursorline


let mapleader = " "
let maplocalleader = " "

call plug#begin('~/.local/share/nvim/plugged')

Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries', 'for': 'go'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

Plug 'ocaml/vim-ocaml', {'for' : 'ocaml'}

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

syntax on
