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

Plug 'rust-lang/rust.vim', { 'for': 'rust'}

Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['go', 'python', 'rust', 'sh']}

Plug 'nvie/vim-flake8', { 'for' : 'python' }
    
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    
Plug 'preservim/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'
    
Plug 'liuchengxu/vista.vim'
    
Plug 'airblade/vim-gitgutter'
    
Plug 'itchyny/lightline.vim'
    
call plug#end()
    
let g:flake8_show_in_gutter=1 
autocmd FileType python map <buffer> <F2>: call flake8#Flake8()<CR>
autocmd BufWritePost *.py call flake8#Flake8()
    
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

" source for the following 3 hints: https://www.diycode.cc/projects/fatih/vim-go

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 1
let g:syntastic_always_populate_loc_list = 1

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
let g:syntastic_go_checkers = ['go', 'govet', 'errcheck']
let g:go_list_type = "quickfix"
let g:syntastic_error_symbol = "✗"

let g:NERDTreeMouseMode=3

" for jedi but does not seem to work
" let g:virtualenv_auto_activate = 1

" *** mapping stuff ***
let mapleader = " "
let maplocalleader = " "

noremap <silent> <leader>c :nohlsearch<CR>

noremap <silent> <F10> :set nonu !<CR>:set nornu !<CR>

noremap <silent> <F2> :NERDTreeToggle<CR>
noremap <silent> <F14> :FZF<CR>

noremap <silent> <C-t> :%!expand -t4<CR>:w<CR>:echom "replaced tabs through 4 space indention"<CR>


let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▋'
" ---------------------------------------------------------
highlight! GitGutterAdd ctermfg=white guifg=#006000 ctermbg=NONE guibg=NONE
highlight! GitGutterChange ctermfg=white guifg=#5F6000 ctermbg=NONE guibg=NONE
highlight! GitGutterDelete ctermfg=white guifg=#600000 ctermbg=NONE guibg=NONE
highlight! GitGutterChangeDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE

set updatetime=200

autocmd FileType qf wincmd J

" --- coc.nvim
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c

let g:coc_global_extensions = ['coc-json', 'coc-go', 'coc-python', 'coc-rls', 'coc-sh']

" always show 
set signcolumn=yes


" *** completion stuff
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
