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


let mapleader = " "
let maplocalleader = "-"

set guicursor=

" auto completion should be handled by coc.vim instead
let g:ale_disable_lsp = 1


call plug#begin('~/.local/share/nvim/plugged')

Plug 'nikvdp/neomux'
autocmd TermOpen * setlocal nonumber norelativenumber nolist nocursorline signcolumn=no
autocmd BufWinEnter,WinEnter term://* startinsert

Plug 'fatih/vim-go', { 'for': 'go' }

" auto completion should be handled by coc.vim instead
let g:go_code_completion_enabled = 0

let g:go_test_show_name = 1


Plug 'rust-lang/rust.vim', { 'for': 'rust'}

" ------------------------------------------------------------------------------

" Plug 'mg979/vim-visual-multi'

Plug 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)


" ------------------------------------------------------------------------------

Plug 'airblade/vim-rooter'



" ------------------------------------------------------------------------------

Plug 'christoomey/vim-tmux-navigator'

" ------------------------------------------------------------------------------


Plug 'dense-analysis/ale', { 'for': ['python', 'go', 'rust']}

let g:ale_sign_column_always = 1

let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

let g:ale_linters = {'python': ['pylint']}


Plug 'neoclide/coc.nvim', { 'for': ['python', 'go', 'rust', 'json', 'yaml', 'vimscript']}

let g:coc_global_extensions = ['coc-json','coc-go','coc-python','coc-rls','coc-sh','coc-perl','coc-yaml','coc-vimlsp']

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

nnoremap <silent>gn <Plug>(coc-rename)
nnoremap <silent>gf <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" ------------------------------------------------------------------------------

Plug 'vim-test/vim-test'

" ------------------------------------------------------------------------------

"Plug 'nvie/vim-flake8', {'for': 'python'}

"let g:flake8_show_in_file=1
"autocmd BufWritePost *.py call flake8#Flake8()



" ------------------------------------------------------------------------------

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'


let g:fzf_layout = { 'down': '~60%' } 

" nnoremap <silent><leader>z :NERDTreeClose \| FZF<CR>

" Plug 'ryanoasis/vim-devicons'
" Plug 'adelarsq/vim-devicons-emoji'

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

nnoremap <leader>c <cmd>CHADopen<cr>

" ------------------------------------------------------------------------------
"
" *** completion stuff
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

Plug 'ms-jpq/chadtree'

nnoremap <silent> <leader>l :set nu !<CR>:set rnu !<CR>

nnoremap <silent> <leader>i :set list !<CR>

nnoremap <silent> <leader>tb :TagbarToggle<CR>
nnoremap <silent> <leader>tu :TagbarForceUpdate<CR>


" !!!!!!!! should be generic for all languages. Start with Go only...
nnoremap <silent><leader>sb :echom "go build..."<CR>: GoBuild<CR>
nnoremap <silent><leader>sr :echom "go run..."<CR> :GoRun<CR>

"sf == source format
nnoremap <silent> <leader>sf :GoFmt<CR>


" ------------------------------------------------------------------------------

Plug 'tpope/vim-fugitive'

" GBrowse Gitlab
Plug 'shumphrey/fugitive-gitlab.vim'

" ------------------------------------------------------------------------------

Plug 'christoomey/vim-tmux-navigator'

" ------------------------------------------------------------------------------

Plug 'airblade/vim-gitgutter'

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '1'
let g:gitgutter_sign_modified_removed = '#'

highlight! GitGutterAdd ctermfg=white guifg=#006000 ctermbg=NONE guibg=NONE
highlight! GitGutterChange ctermfg=white guifg=#5F6000 ctermbg=NONE guibg=NONE
highlight! GitGutterDelete ctermfg=white guifg=#600000 ctermbg=NONE guibg=NONE
highlight! GitGutterChangeDelete ctermfg=52 guifg=#600000 ctermbg=NONE guibg=NONE

" ------------------------------------------------------------------------------



Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'one',
\ }

"     \ 'colorscheme': 'solarized',
"     \ 'colorscheme': 'Tomorrow_Night',

Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'

call plug#end()
" <<<<<<<<<<<<<<<<<<<<<<<<<<<
 
"if empty(argv())
"	au VimEnter * NERDTree
"endif
    
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

augroup CursorLine
    au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END


set mouse=a

set splitbelow
set splitright


" --- en_US.UTF8 should work on any Linux and Windows 10 at least
set langmenu=en_US.UTF8
language en_US.UTF8
let $LANG = 'en_US.UTF8'


set bg=dark
let g:gruvbox_contrast_dark="soft"
colorscheme gruvbox

syntax on

set listchars=space:_,trail:!,eol:$,tab:>~ list
set nolist

noremap <silent> <leader>d :nohlsearch \| cclose \| lclose \| echom ""<CR>

noremap <silent> <C-t> :%!expand -t4<CR>:w<CR>:echom "replaced tabs through 4 space indention"<CR>


" This is the end, my friend...
nnoremap <End> :qa!<CR>


set updatetime=200

autocmd FileType qf wincmd J

" --- coc.nvim related
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c


" always show 
set signcolumn=yes

au FileType go,python,sh,rust,perl :let w:m2=matchadd('ErrorMsg', '\%>78v.\+', -1)


inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
