set encoding=utf8
set nocompatible
set guioptions=
set showtabline=0
set number
set wrap linebreak nolist
set textwidth=120
set cursorline
set ttimeoutlen=10
set tabstop=4
set re=0
set signcolumn=yes

filetype plugin on

let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled=0
let g:airline_section_z="\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled=0

let NERDTreeShowHidden=1

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

let &t_SI.="\e[5 q"
let &t_SR.="\e[3 q"
let &t_EI.="\e[1 q"

let g:ale_disable_lsp = 1
let g:ale_fixers = {
\	'javascript': ['eslint'],
\	'javascriptreact': ['eslint'],
\	'typescript': ['eslint'],
\	'typescriptreact': ['eslint'],
\}

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline'

    Plug 'ErichDonGubler/vim-sublime-monokai'

    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'fisadev/FixedTaskList.vim'

    Plug 'editorconfig/editorconfig-vim'

	Plug 'dense-analysis/ale'
	Plug 'sheerun/vim-polyglot'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

colorscheme sublimemonokai

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists('s:std_in') | wincmd p | endif

nnoremap <silent> <leader>n :NERDTreeFocus<CR>
nnoremap <silent> <C-n> :NERDTree<CR>
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>

nnoremap <silent> <F9> :ALEFix<CR>
nnoremap <silent> <F10> :TaskList<CR>
nnoremap <silent> <C-p> :Files<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
