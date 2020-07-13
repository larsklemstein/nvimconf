" ---------------------------------------------------------------------------
" Nvim conf for Neovim(-q) @ Windows and Linux
" ---------------------------------------------------------------------------

let need_to_install_plugins = 0
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    let need_to_install_plugins = 1
endif


" *** plugin section ***
call plug#begin('~/.local/share/nvim/plugged')

Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries', 'for': 'go'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Plug 'python-mode/python-mode', {'for' : 'python'}

Plug 'majutsushi/tagbar'

Plug 'airblade/vim-gitgutter'

Plug 'itchyny/lightline.vim'

call plug#end()


if need_to_install_plugins == 1
    echo "Installing plugins..."
	silent! PlugInstall
		echo "Done!"
		q
endif

set autoindent
set hlsearch
set incsearch

set noshowmode

set tabstop=4
set shiftwidth=4
set expandtab

set number
set relativenumber
set cursorline


" --- en_US.UTF8 should work on any Linux and Windows 10 at least
set langmenu=en_US.UTF8
language en_US.UTF8
let $LANG = 'en_US.UTF8'


" *** split and mouse behaviour ***
set mouse=a

set splitbelow
set splitright


" *** visibility stuff ***
set bg=dark
let g:gruvbox_contrast_dark="soft"
colorscheme gruvbox

syntax on

set listchars=space:_,trail:!,eol:$,tab:>~ list
set nolist


" *** plugin settings ***
" turn on rope
let g:pymode_rope = 1

" turn on completion?
let g:pymode_rope_completion = 1

let g:NERDTreeMouseMode=3


" *** mapping stuff ***
let mapleader = " "
let maplocalleader = " "

noremap <silent> <leader>c :nohlsearch<CR>

noremap <silent> <F10> :set nonu !<CR>:set nornu !<CR>

noremap <silent> <F7> :NERDTreeToggle<CR>
noremap <silent> <F8> :TagbarToggle<CR>
noremap <silent> <F19> :FZF<CR>
