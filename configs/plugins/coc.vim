" =======================================================================================
" base setting
" =======================================================================================
set updatetime=300
set signcolumn=number

" =======================================================================================
" configure the plugin
" =======================================================================================
let g:coc_start_at_startup = 1
let g:coc_node_path = "/home/afun/.nvm/versions/node/v18.7.0/bin/node"
let g:coc_global_extentions = [
\    'coc-json',
\    'coc-explorer',
\    'coc-marketplace',
\    'coc-sh',
\    'coc-pyright',
\    ]

" =======================================================================================
" keymap
" =======================================================================================
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" coc command and extension
nmap <space>e :CocCommand explorer<CR>
nmap <space>c :CocConfig<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" scroll the floating window
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

" =======================================================================================
" function set
" =======================================================================================
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

