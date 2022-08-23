" =======================================================================================
" configure the plugins
" =======================================================================================
let g:airline_detect_modified= 1
let g:airline_detect_spell=1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    let g:airline_symbols.branch = ''
    let g:airline_symbols.colnr = ' ℅:'
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ' :'
    let g:airline_symbols.maxlinenr = '☰ '
endif
let g:airline_extensions = ['branch', 'tabline', 'coc']
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 0
