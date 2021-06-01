""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""
call plug#begin()

""" Aesthetics - Main
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Aesthetics - themes
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
"Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
"Plug 'arcticicestudio/nord-vim'
"Plug 'ryanoasis/vim-devicons'

""" Functionalities - Main
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'

"" Functionalities - Language Pack
Plug 'vim-python/python-syntax'
Plug 'elzr/vim-json'
Plug 'mechatroner/rainbow_csv'
Plug 'alvan/vim-closetag'

call plug#end()

""""""""""""""""""""""""""""""
" vim-plug plugin setting
""""""""""""""""""""""""""""""

""" powerline - intergration
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

""" airline - powerline symbol and theme
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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:python_highlight_all = 1

"" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.ejs'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

""" coc - explorer preset
let g:coc_explorer_global_presets = {
\    'basic': {
\       'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\}

"" easymotion
let g:EasyMotion_do_mapping = 0     " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1      " Turn on case-insensitive feature
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""
" build-in
""""""""""""""""""""""""""""""

""" Aesthetics
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

""" Functionalities
set nu
set ai
set cursorline
set encoding=utf-8

"" Indent
set cindent             " C-liked auto indent
set expandtab           " expand tab to insert spaces
set tabstop=4           " tab width
set softtabstop=4       " virtual tab width (tab then space)
set shiftwidth=4        " auto indent width

"" fold
set wrap
set nofoldenable
set foldmethod=indent
set foldlevel=1
set foldnestmax=2

"" line
set list

""""""""""""""""""""""""""""""
" Mapping Shortcut
""""""""""""""""""""""""""""""
function! SetupCommandAbbrs(from, to)
    exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction


""" coc - open the coc config
call SetupCommandAbbrs('C', 'CocConfig')

""" coc - open the file exporer
nmap <space>e :CocCommand explorer --toggle --sources=buffer+,file+ --preset basic<CR>

""" move lines with alt + j or k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
