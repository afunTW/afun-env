" =======================================================================================
" base setting
" =======================================================================================
set nocompatible

" auto detection by filetype
filetype on
filetype plugin on
filetype indent on

" appearance
syntax on
set t_Co=256
set encoding=utf-8
set hidden
set nu
set cursorline
set cursorcolumn
set laststatus=2

" development
set autoindent
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set wrap
set nofoldenable
set foldmethod=indent
set foldlevel=1
set foldnestmax=2
set list
set relativenumber

" =======================================================================================
" keymap
" =======================================================================================
nnoremap <C-t> :tabnew<Space>
nnoremap <C-s> :w<CR>
nnoremap <C-l> :source $HOME/.config/nvim/init.vim<CR>
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
nnoremap bd :bd<CR>

" move the selected line <Alt+j> <Alt+k>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" =======================================================================================
" install the plugins
" =======================================================================================
call plug#begin()
    " appearance
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    " development
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-fugitive'
    "Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
    "Plug 'junegunn/fzf.vim'
call plug#end()

" =======================================================================================
" configure the plugins
" =======================================================================================
source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/tokyonight.vim
source $HOME/.config/nvim/plugins/coc.vim

if $NVM_BIN != ""
    let g:coc_node_path = '$NVM_BIN/node'
endif