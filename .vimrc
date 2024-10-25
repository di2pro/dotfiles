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

    Plug 'editorconfig/editorconfig-vim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()

colorscheme sublimemonokai

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

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists('s:std_in') | wincmd p | endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled=0
let g:airline_section_z="\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled=0

let NERDTreeShowHidden=1

let &t_SI.="\e[5 q"
let &t_SR.="\e[3 q"
let &t_EI.="\e[1 q"

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
