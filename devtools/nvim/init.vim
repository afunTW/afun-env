" ========== vim-plug: manage the plugin
call plug#begin()
Plug 'vim-airline/vim-airline'                          " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'                   " theme
Plug 'joshdick/onedark.vim'                             " theme
Plug 'sheerun/vim-polyglot'                             " a solid language pack for Vim
Plug 'tpope/vim-fugitive'                               " the premier vim plugin for git (:Git)
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " load extensions like vscode and host language server
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }      " command line fuzzy finder
Plug 'easymotion/vim-easymotion'                        " vim motions on speed
Plug 'elzr/vim-json'                                    " a better json for vim
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}        " Go development plugin for Vim
call plug#end()

" ========== vim-plug customization
" vim-airline/vim-airline & vim-airline/vim-airline-theme
let g:airline#extensions#tabline#enabled = 1                        " display all buffers when there's only one table open
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " how file paths are displayed in each individual tab
let g:airline_detect_modified= 1                                    " enable modified detection
let g:airline_detect_spell=1                                        " enable spell detection
let g:airline_powerline_fonts = 1                                   " enable powerline integration
let g:airline#extensions#tabline#buffer_nr_show = 1                 " configure whether buffer numbers should be shown
let g:airline#extensions#coc#enabled = 1                            " enable coc integration
let g:airline#extensions#branch#enabled = 1                         " enable fugitive/lawrencium integration
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline_theme = 'onedark'

" neoclide/coc.nvim
source ~/.config/nvim/coc-config.vim

" easymotion/vim-easymotion
let g:EasyMotion_do_mapping = 0                 " disable default mappings
let g:EasyMotion_smartcase = 1                  " turn on case-insensitive feature

" ========== shortcut
nnoremap <C-t> :tabnew<Space>

" easymotion to search
nmap s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" move lines with alt + j or k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" ========== build-in
syntax on
colorscheme onedark
if (has("nvim"))
    " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif
set laststatus=2
set statusline^=%{coc#status()}
set t_Co=256
filetype indent on
set nu
set ai
set cursorline
set cursorcolumn
set encoding=utf-8
set cindent             " C-liked auto indent
set expandtab           " expand tab to insert spaces
set tabstop=4           " tab width
set softtabstop=4       " virtual tab width (tab then space)
set shiftwidth=4        " auto indent width
set wrap
set nofoldenable
set foldmethod=indent
set foldlevel=1
set foldnestmax=2
set list
