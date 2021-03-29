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
let maplocalleader = " "


call plug#begin('~/.local/share/nvim/plugged')

Plug 'fatih/vim-go', { 'do': 'GoInstallBinaries', 'for': 'go'}
Plug 'rust-lang/rust.vim', { 'for': 'rust'}

" ------------------------------------------------------------------------------

Plug 'neoclide/coc.nvim', { 'for': ['python', 'go', 'rust']}

nmap <silent>gn <Plug>(coc-rename)
nmap <silent>gf <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ------------------------------------------------------------------------------

Plug 'vim-test/vim-test'

" ------------------------------------------------------------------------------

Plug 'nvie/vim-flake8', {'for': 'python'}
let g:flake8_show_in_file=1
autocmd BufWritePost *.py call flake8#Flake8()

" ------------------------------------------------------------------------------

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 'down': '~60%' } 

" ------------------------------------------------------------------------------

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" show *no* brackets
let g:NERDTreeGitStatusConcealBrackets = 1

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeMouseMode=3
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows = 0

let g:NERDTreeDirArrowExpandable="▸"
let g:NERDTreeDirArrowCollapsible="▾"
let g:NERDTreeNodeDelimiter="\u00a0"


noremap <silent> <leader>f :NERDTreeFind<CR>

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
	if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    	NERDTreeFind
    	wincmd p
	endif
endfunction

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
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'

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


" *** mapping stuff ***

noremap <silent> <leader>c :nohlsearch<CR>

nnoremap <silent> <leader>q :cclose<CR>

noremap <silent> <F8> :TagbarToggle<CR>

noremap <silent> <F10> :set nonu !<CR>:set nornu !<CR>


noremap <silent> <F21> :NERDTreeToggle<CR>
noremap <silent> <F9> :NERDTreeClose<CR>:FZF<CR>



noremap <silent> <C-t> :%!expand -t4<CR>:w<CR>:echom "replaced tabs through 4 space indention"<CR>

" delete everything from the current line until the last blank line and before
nnoremap <C-d> :.,/\S/-1d\|?\S?+1,-1d\|nohl<CR>O<ESC>j

nnoremap <End> :qa!<CR>


set updatetime=200

autocmd FileType qf wincmd J

" --- coc.nvim
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c

let g:coc_global_extensions = ['coc-json', 'coc-go', 'coc-python', 'coc-rls', 'coc-sh', 'coc-perl','coc-yaml','coc-solargraph']

" always show 
set signcolumn=yes

au FileType go,python,sh,rust,perl :let w:m2=matchadd('ErrorMsg', '\%>78v.\+', -1)


" *** completion stuff
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
